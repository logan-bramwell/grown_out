import 'package:cloud_firestore/cloud_firestore.dart';

import '../../personalisation/models/user_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  String title;
  String? description;
  double price;
  bool? isFeatured;
  List<String>? images;
  String condition;
  String location;
  DateTime? date;
  String categoryId;
  String size;
  String thumbnail;
  UserModel? user;
  String productType;



  ProductModel({
    required this.stock,
    required this.thumbnail,
    this.user,
    required this.size,
    required this.categoryId,
    this.date,
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.images,
    required this.condition,
    required this.location,
    required this.sku,
    required this.productType,
    required this.isFeatured,
  });

  static ProductModel empty() {return ProductModel(id: '', title: '', price: 0.0, condition: '', location: '', categoryId: '', size: '', thumbnail: '', stock: 0, sku: '', productType: '', isFeatured: false,
    );
  }


  toJson() {
    return {
      'Title': title,
      'Description': description,
      'Price': price,
      'Image': images ?? [],
      'Condition': condition,
      'Location': location,
      'Date': date,
      'CategoryId': categoryId,
      'Size': size,
      'Thumbnail': thumbnail,
      'User': user!.toJson(),
      'ProductType': productType,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) {
      return ProductModel.empty();
    }
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['Title'],
      sku: data['SKU'],
      price: double.parse((data['Price']).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['Category'] ?? '',
      description: data['Description'] ?? '',
      user: UserModel.fromSnapshot(data['User']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      condition: data['Condition'] ?? '',
      location: data['Location'] ?? '',
      date: data['Date'] != null ? (data['Date'] as Timestamp).toDate() : null,
      size: data['Size'] ?? '',
      stock: data['Stock'] ?? '',
      productType: data['ProductType'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'],
      sku: data['SKU'],
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['Category'] ?? '',
      description: data['Description'] ?? '',
      user: UserModel.fromSnapshot(data['User']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      condition: data['Condition'] ?? '',
      location: data['Location'] ?? '',
      date: data['Date'] != null ? (data['Date'] as Timestamp).toDate() : null,
      size: data['Size'] ?? '',
      stock: data['Stock'] ?? '',
      productType: data['ProductType'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,

    );
  }
}