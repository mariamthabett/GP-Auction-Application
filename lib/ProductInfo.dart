import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/product.dart';
import 'presentation/screens/chat/GroupChatScreen.dart';
import 'presentation/screens/features/Favorites/presentation/bloc/favorites_bloc.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({Key? key});
  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  bool isFavorite = false;
  bool isForSale = true; // Adjust the value based on your logic
  bool isBiddingStarted = false;
  List<QueryDocumentSnapshot> sellers = [];
   String _userName = '';

  late ProductModel product;
  _getUserName() async {
    final db = await FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(db.uid)
        .get()
        .then((ds) {
      if (ds.exists) {
        Map<String, dynamic>? data =
            ds.data(); // Call the function to get the data
        _userName = data!['userName'];
        log(_userName);
      } else {
        // Handle the case where the document doesn't exist
        print('not exist');
      }
    });
  }

  getData() async {
    QuerySnapshot querySnapshot2 =
        await FirebaseFirestore.instance.collection("seller").get();
    sellers.addAll(querySnapshot2.docs);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _getUserName();
    getData();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isBiddingStarted = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocListener<FavoritesBloc, FavoritesState>(
      listenWhen: (previous, current) =>
          previous.addProductState != current.addProductState,
      listener: (context, state) {
        switch (state.addProductState) {
          case RequestState.success:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Added to favorites'),
              ),
            );
            break;
          case RequestState.error:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to add to favorites'),
              ),
            );
            break;
          default:
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 115, 183, 239),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_circle_left_outlined),
          ),
          title: Text(product.title!),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<FavoritesBloc>(context, listen: false)
                    .add(AddToFavorites(product: product));
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      width: 250,
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(
                        product.image!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  product.title!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Description: ${product.productDescription!}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Card(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Text(
                      "Start Bid Amount: ${product.price!} EGP",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const SizedBox(
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  for (var i = 0; i < sellers.length; i++)
                      if (sellers[i]['SellerID'] == product.Seller_Id!) ...[
                      Text(
                        "Company: ${sellers[i]['CompanyName']}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  for (var i = 0; i < sellers.length; i++)
                      if (sellers[i]['SellerID'] == product.Seller_Id!) ...[
                      Text(
                        "Seller: ${sellers[i]['Name']}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.confirmation_num, color: Colors.black),
            label: const Text(
              'Book a Ticket',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 33, 150, 243),
          ),
          const SizedBox(width: 10),
          FloatingActionButton.extended(
            onPressed: isBiddingStarted
                ? () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => GroupChatScreen(
                              groupId: product.sId!,
                              groupName: product.title!,
                              userName: _userName ?? "",
                            )));
                  }
                : null,
            icon: Icon(Icons.chat, color: Colors.black),
            label: Text(
              'Bid LiveChat',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: isBiddingStarted
                ? const Color.fromARGB(255, 33, 150, 243)
                : Colors.grey,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
