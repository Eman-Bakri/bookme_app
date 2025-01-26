import 'dart:html';

import 'package:bookme_app/features/bookplace/models/categorymodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  bool isFeatured;

  CategoryModel(
      { required this.id, required this.name, required this.image, required this.isFeatured});

  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'IsFeautred': isFeatured,
    };
  }

  /// Map JSON Doc to userModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;

    return CategoryModel(
        id: document.id, name: data['Name'] ?? '', image: data['Image'] ?? '', isFeatured: data['IsFeautred'] ?? false,);
  } else {
      return CategoryModel.empty();
    }
  }
}
