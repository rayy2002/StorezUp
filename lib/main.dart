import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'layout/screen_layout.dart';
import 'providers/user_details_provider.dart';
import 'screens/sign_in_screen.dart';
import 'utils/color_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyCjwP62cAH58P3bmfOtD8xqwrKJNfPXd0k",
  //         authDomain: "crave-a8ffd.firebaseapp.com",
  //         projectId: "crave-a8ffd",
  //         storageBucket: "crave-a8ffd.appspot.com",
  //         messagingSenderId: "39412399885",
  //         appId: "1:39412399885:web:a9742ec288542520913a44"),
  //   );
  // } else {
  await Firebase.initializeApp();
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetailsProvider())],
      child: MaterialApp(
        title: "StorzeUp",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            // scaffoldBackgroundColor: backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme()),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (user.hasData) {
                return const ScreenLayout();
                //return const SellScreen();
              } else {
                return const SignInScreen();
              }
            }),
      ),
    );
  }
}
