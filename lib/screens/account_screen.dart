import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storezup/screens/myshop_screen.dart';

import '../model/user_details_model.dart';
import '../providers/user_details_provider.dart';
import '../utils/color_themes.dart';
import '../widgets/profile_menu.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsProvider>(context).userDetails;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primaryColor),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(userDetailsModel.name, style: const TextStyle(fontSize: 23)),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text("Edit Profile",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Settings", icon: Icons.settings, onPress: () {}),
            ProfileMenuWidget(
                title: "Your Store",
                icon: Icons.store,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyShopScreen();
                  }));
                }),
            ProfileMenuWidget(
                title: "User Management",
                icon: Icons.verified_user_rounded,
                onPress: () {}),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Information", icon: Icons.info, onPress: () {}),
            ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout_outlined,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  FirebaseAuth.instance.signOut();
                }),
          ],
        ),
      ),
    );
  }
}
