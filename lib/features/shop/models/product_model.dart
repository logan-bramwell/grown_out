import 'package:cloud_firestore/cloud_firestore.dart';

import '../../personalisation/models/user_model.dart';

class ProductModel {
  String id;
  String title;
  String? description;
  double price;
  List<String>? images;
  String condition;
  String location;
  DateTime? date;
  String categoryId;
  String size;
  String thumbnail;
  UserModel? user;


  ProductModel({
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
  });

  static ProductModel empty() {return ProductModel(id: '', title: '', price: 0.0, condition: '', location: '', categoryId: '', size: '', thumbnail: '',
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
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'],
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
    );
  }
}