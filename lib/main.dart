import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bluebit1/api/notification_api.dart';
import 'package:bluebit1/auth/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String storageBucketUrl = 'gs://bluebit-bd5bf.appspot.com';
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: 'AIzaSyBgW2lamwXuWlQAoQPJi13cAKefNfFWNSc',
            appId: '1:1029764035246:android:2ce842ecae1a63e628333f',
            messagingSenderId: '1029764035246',
            projectId: 'bluebit-bd5bf',
            storageBucket: storageBucketUrl,
          ),
        )
      : await Firebase.initializeApp();

  await AwesomeNotifications().initialize(
    'resource://drawable/logo.png',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
      )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'bluebit_group',
        channelGroupName: 'Bluebit notifications',
      )
    ],
  );

  bool isNotificationAllowed =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isNotificationAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
