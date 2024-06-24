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
      QuerySnapshot querySnapshot = await _firestore.collection('Products').get();

      // Log the number of documents retrieved
      log('Number of documents: ${querySnapshot.docs.length}');

      querySnapshot.docs.forEach((element) {
        // Log each document data
        log('Document data: ${element.data()}');
        products.add(ProductModel.fromJson(element.data() as Map<String, dynamic>));
      });

      if (products.isNotEmpty) {
        log('products Fetched: ${products[0].title}');
      } else {
        log('No products found');
      }
      
      return products;
    } catch (e) {
      log("Error while fetching products: $e");
      return products;
    }
  }
}
