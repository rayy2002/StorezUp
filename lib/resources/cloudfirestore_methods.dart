import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:storezup/model/announcement_model.dart';
import 'package:storezup/model/event_model.dart';
import 'package:storezup/widgets/popular_stores.dart';
import 'package:storezup/widgets/reg_stores_card.dart';
import '../model/offers_model.dart';
import '../model/store_model.dart';
import '../model/user_details_model.dart';
import '../utils/utils.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }

  Future getNameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
      (snap.data() as dynamic),
    );

    return userModel;
  }

  Future<String> uploadShopToDatabase({
    required String imageLink,
    required String shopName,
    required String description,
    required String address,
    required String category,
    required String contact,
    required String ownerId,
  }) async {
    String output = "Something went wrong";

    if (imageLink != "" &&
        shopName != "" &&
        description != "" &&
        address != "") {
      try {
        String uid = Utils().getUid();
        StoreModel product = StoreModel(
            imageLink: imageLink,
            shopName: shopName,
            description: description,
            category: category,
            address: address,
            contact: contact,
            uid: uid,
            ownerId: ownerId);

        await firebaseFirestore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("stores")
            .add(product.getJson());

        await firebaseFirestore
            .collection("stores")
            .doc(uid)
            .set(product.getJson());

        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  Future<String> uploadEvent({
    required String date,
    required String eventName,
    required String description,
    required String shopName,
    required String shopImage,
    required String shopLocation,
  }) async {
    String output = "Something went wrong";

    if (date != "" && eventName != "" && description != "") {
      try {
        String uid = Utils().getUid();
        EventModel event = EventModel(
            shopImage: shopImage,
            date: date,
            shopName: shopName,
            description: description,
            shopLocation: shopLocation,
            eventName: eventName);

        await firebaseFirestore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("events")
            .add(event.getJson());

        await firebaseFirestore
            .collection("events")
            .doc(uid)
            .set(event.getJson());

        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  Future<String> uploadOffer({
    required String offerTitle,
    required String description,
    required String shopName,
  }) async {
    String output = "Something went wrong";

    if (offerTitle != "" && description != "") {
      try {
        String uid = Utils().getUid();
        OfferModel offer = OfferModel(
            shopName: shopName,
            description: description,
            offerTitle: offerTitle);

        await firebaseFirestore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("offers")
            .add(offer.getJson());

        await firebaseFirestore
            .collection("offers")
            .doc(uid)
            .set(offer.getJson());

        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  Future<String> uploadAnnouncement({
    required String announcement,
    required String description,
    required String shopName,
  }) async {
    String output = "Something went wrong";

    if (announcement != "" && description != "") {
      try {
        String uid = Utils().getUid();
        AnnouncementModel offer = AnnouncementModel(
            shopName: shopName,
            description: description,
            announcement: announcement);

        await firebaseFirestore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("announcement")
            .add(offer.getJson());

        await firebaseFirestore
            .collection("announcement")
            .doc(uid)
            .set(offer.getJson());
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  Future<List<Widget>> getPopularStoresFromDataBase() async {
    List<Widget> children = [];
    QuerySnapshot<Map<String, dynamic>> snap =
        await firebaseFirestore.collection("stores").get();

    for (int i = 0; i < snap.docs.length; i++) {
      DocumentSnapshot docSnap = snap.docs[i];
      StoreModel model =
          StoreModel.getModelFromJson(json: (docSnap.data() as dynamic));
      children.add(PopStoresCard(storeModel: model));
    }
    return children;
  }

  Future<List<Widget>> getStoresFromDataBase() async {
    List<Widget> children = [];
    QuerySnapshot<Map<String, dynamic>> snap =
        await firebaseFirestore.collection("stores").get();

    for (int i = 0; i < snap.docs.length; i++) {
      DocumentSnapshot docSnap = snap.docs[i];
      StoreModel model =
          StoreModel.getModelFromJson(json: (docSnap.data() as dynamic));
      children.add(RegStoresCard(storeModel: model));
    }
    return children;
  }
}
