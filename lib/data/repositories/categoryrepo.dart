import 'dart:html';

import 'package:bookme_app/features/bookplace/models/categorymodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepo extends GetxController{

  static CategoryRepo get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{

      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;

    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: '');
    } on PlatformException catch (e) {
      throw PlatformException(code: '');
    } catch (e){
      throw 'Something went wrong try Again';
    }
  }
}