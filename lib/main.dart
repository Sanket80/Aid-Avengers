import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String storageBucketUrl = 'gs://bluebit-bd5bf.appspot.com';
  Platform.isAndroid
  ? await Firebase.initializeApp(
    options:FirebaseOptions(
      apiKey: 'AIzaSyBgW2lamwXuWlQAoQPJi13cAKefNfFWNSc',
      appId: '1:1029764035246:android:2ce842ecae1a63e628333f',
      messagingSenderId: '1029764035246',
      projectId: 'bluebit-bd5bf',
      storageBucket: storageBucketUrl,
    ),)
  : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Text('Firebase Setup Success'),
    );
  }
}
