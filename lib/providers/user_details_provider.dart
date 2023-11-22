// import 'package:craveit/model/user_details_model.dart';
// import 'package:craveit/resources/cloudfirestore_methods.dart';
import 'package:flutter/material.dart';

import '../model/user_details_model.dart';
import '../resources/cloudfirestore_methods.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider() : userDetails = UserDetailsModel(name: "Loading");

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
