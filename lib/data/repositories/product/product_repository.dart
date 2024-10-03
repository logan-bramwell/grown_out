
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/utils/exceptions/firebase_exceptions.dart';
import 'package:whs_deals_app/utils/exceptions/platform_exceptions.dart';
import 'package:whs_deals_app/utils/local_storage/firebase_storage_service.dart';

import '../../../features/shop/models/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getRecentProducts() async {
    try {
      final snapshot = await _db.collection("Products").where('isRecent', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong! Please try again.';
    }
  }

  Future<List<ProductModel>> getAllRecentProducts() async {
    try {
      final snapshot = await _db.collection("Products").where('isRecent', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong! Please try again.';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong! Please try again.';
    }
  }




  // upload dummy data
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets for the thumbnail
        final thumbnail = await storage.getImageDataFromAssets(
            product.thumbnail);

        // Upload the thumbnail image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign the URL to the product's thumbnail attribute
        product.thumbnail = url;

        // Check if product has additional images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];

          // Loop through each image in the product's image list
          for (var image in product.images!) {
            // Get image data link from local assets for each image
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload the image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // Add the image URL to the imagesUrl list
            imagesUrl.add(url);
          }

          // Clear the existing images in the product object
          product.images!.clear();

          // Assign the new URLs to the product's images attribute
          product.images!.addAll(imagesUrl);
        }

        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw 'Firebase Exception: ${e.message}';
    } on SocketException catch (e) {
      throw 'Network Error: ${e.message}';
    } on PlatformException catch (e) {
      throw 'Platform Exception: ${e.message}';
    } catch (e) {
      throw e.toString();
    }
  }
}