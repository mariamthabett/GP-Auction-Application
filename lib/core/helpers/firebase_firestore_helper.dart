import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:philo_task/core/navigator/named_routes.dart';
import 'package:philo_task/core/navigator/navigator.dart';
import 'package:philo_task/models/product.dart';
import 'package:philo_task/models/user_model.dart';

class DatabaseHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //initialize the firestore instance

  //create a new user
  static Future<void> createUser(UserModel? user) async {
    try {
      await _firestore.collection('Users').doc(user!.email).set(user.toJson());
      // log('User Created');
      Go.toNamed(NamedRoutes.home);
    } catch (e) {
      print(e);
    }
  }

  //get alll documents from the collection
  static Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    try {
      await _firestore.collection('Users').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          users.add(UserModel.fromJson(element.data()));
        });
      });
      log('Users Fetched ${users[0].email}');
      return users;
    } catch (e) {
      print(e);
      return users;
    }
  }

  //get all documents from the collection Products
  static Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];
    try {
      await _firestore.collection('Products').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          products.add(ProductModel.fromJson(element.data()));
        });
      });
      log('products Fetched ${products[0].title}');
      return products;
    } catch (e) {
      log("Error while fetching products" + e.toString());
      return products;
    }
  }
}
