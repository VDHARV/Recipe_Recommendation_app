// import 'dart:html';

import 'package:de_app/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:de_app/loginPage.dart';
// import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:de_app/authPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const MaterialApp(
                    home: HomePage(),
                  );
                  // return const MaterialApp(
                  // title: 'Recipe Recommender',
                  // home: HomePage(),
                  // );
                } else {
                  return const AuthPage();
                  // return const MaterialApp(
                  //   title: 'Recipe Recommender',
                  //   home: LoginPage(),
                  // );
                }
              }),
        ),
      );
}

  // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     return const MaterialApp(
//       title: 'Recipe Recommender',
//       home: LoginPage(),
//     );
//   }
// }
