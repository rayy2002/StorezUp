import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storezup/utils/color_themes.dart';

import '../resources/cloudfirestore_methods.dart';
import '../utils/utils.dart';

class ListStoreScreen extends StatefulWidget {
  const ListStoreScreen({Key? key}) : super(key: key);

  @override
  State<ListStoreScreen> createState() => _ListStoreScreenState();
}

class _ListStoreScreenState extends State<ListStoreScreen> {
  bool isLoading = false;

  TextEditingController imageLinkController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  // List<int> keysForDiscount = [0, 70, 60, 50];
  //keysofdiscoutn[selected -1]

  @override
  void dispose() {
    super.dispose();
    imageLinkController.dispose();
    nameController.dispose();
    contactController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      extendBody: true,
      body: !isLoading
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const Text(
                          "List Your Shop !!",
                          style: TextStyle(
                            fontSize: 45,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            controller: imageLinkController,
                            decoration: const InputDecoration(
                                hintText: "Image Link",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                hintText: "Name of Store",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            controller: addressController,
                            decoration: const InputDecoration(
                                hintText: "Location of Store",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                                hintText: "Store Description",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            controller: categoryController,
                            decoration: const InputDecoration(
                                hintText: "Store Category",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200))),
                          child: TextField(
                            controller: contactController,
                            decoration: const InputDecoration(
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              String output = await CloudFirestoreClass()
                                  .uploadShopToDatabase(
                                      imageLink: imageLinkController.text,
                                      shopName: nameController.text,
                                      address: addressController.text,
                                      description: descriptionController.text,
                                      contact: contactController.text,
                                      category: categoryController.text,
                                      ownerId: FirebaseAuth
                                          .instance.currentUser!.uid);
                              if (output == "success") {
                                // ignore: use_build_context_synchronously
                                Utils().showSnackBar(
                                    context: context, content: "Posted Store");
                              } else {
                                // ignore: use_build_context_synchronously
                                Utils().showSnackBar(
                                    context: context, content: output);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: AppColors.primaryColor,
                              child: const Text(
                                "Post",
                                style: TextStyle(
                                    color: AppColors.whiteColor, fontSize: 20),
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: AppColors.greyColor,
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                    color: AppColors.whiteColor, fontSize: 20),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          : const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
    );
  }
}
