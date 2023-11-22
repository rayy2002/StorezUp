// ignore_for_file: unused_local_variable

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user_details_model.dart';
import '../providers/user_details_provider.dart';
import '../utils/color_themes.dart';
import '../utils/utils.dart';

class SearchBarWidget extends StatelessWidget {
  final String label;
  final String searchfor;
  SearchBarWidget({Key? key, required this.label, required this.searchfor})
      : preferredSize = const Size.fromHeight(84),
        super(key: key);

  @override
  // ignore: override_on_non_overriding_member
  final Size preferredSize;

  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Colors.grey.shade100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetails =
        Provider.of<UserDetailsProvider>(context).userDetails;
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Heyy ${userDetails.name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey,
                              fontSize: 20),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.notifications_sharp,
                            color: AppColors.primaryColor,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(label,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: AppColors.primaryColor)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(),
              Expanded(
                // width: screenSize.width * 0.7,
                child: Container(
                  width: screenSize.width - 2,
                  decoration: const BoxDecoration(
                    boxShadow: [],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextField(
                          cursorColor: Colors.black,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Search $searchfor ...",
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: border,
                            border: border,
                            focusedBorder: border,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor,
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
