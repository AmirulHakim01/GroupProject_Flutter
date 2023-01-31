import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fleetproject/Screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fleetproject/Screens/login.dart';
import 'package:fleetproject/Screens/authPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return MyHomePage();
          } else {
            return AuthPage();
          }
        },
      )
    );
      }));
  }
}
