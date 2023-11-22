import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storezup/model/store_model.dart';
import 'package:storezup/screens/list_store_screen.dart';
import 'package:storezup/widgets/myshop_widget.dart';
import '../utils/color_themes.dart';

class MyShopScreen extends StatefulWidget {
  const MyShopScreen({Key? key}) : super(key: key);

  @override
  State<MyShopScreen> createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<MyShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("stores")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text(
                      "Loading",
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("NO SHOPS ADDED"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ListStoreScreen();
                            }));
                          },
                          child: const Text(
                            "List Your Shop Now",
                            style: TextStyle(
                                fontSize: 32, color: AppColors.primaryColor),
                          ),
                        )
                      ],
                    );
                  } else {
                    return MyShopWidget(
                      storeModel: StoreModel.getModelFromJson(
                          json: snapshot.data!.docs[0].data()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
