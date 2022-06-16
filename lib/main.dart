import 'package:fire_flutter/screens/addtask.dart';
import 'package:fire_flutter/screens/dashboard.dart';
import 'package:fire_flutter/screens/updatetask.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCL67zQNYTgFjtZWCO4mEFa7AyEqC862P8",
          authDomain: "flutterfire-75599.firebaseapp.com",
          projectId: "flutterfire-75599",
          storageBucket: "flutterfire-75599.appspot.com",
          messagingSenderId: "289413038478",
          appId: "1:289413038478:web:3da84cdd2dbe1bf8f0a4df")
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duty Manager',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.grey),
      routes: {
        '/':(context) =>const Dashboard(),
        '/addTask': (context) =>const AddTask(),
        '/updateTask':(context) =>const UpdateTask()
      },
    );
  }
}
