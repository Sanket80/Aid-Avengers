import 'dart:io';

import 'package:bluebit1/api/notification_api.dart';
import 'package:bluebit1/auth/mainpage.dart';
import 'package:bluebit1/pages/Bot/mybot.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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

  // await AwesomeNotifications().initialize(
  //   'resource://drawable/logo.png',
  //   [
  //     NotificationChannel(
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: Color(0xFF9D50DD),
  //       ledColor: Colors.white,
  //     )
  //   ],
  //   channelGroups: [
  //     NotificationChannelGroup(
  //       channelGroupKey: 'bluebit_group',
  //       channelGroupName: 'Bluebit notifications',
  //     )
  //   ],
  // );
  //
  // bool isNotificationAllowed =
  //     await AwesomeNotifications().isNotificationAllowed();
  // if (!isNotificationAllowed) {
  //   await AwesomeNotifications().requestPermissionToSendNotifications();
  // }

  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
    path: 'assets/translations',
    fallbackLocale: Locale('en', 'US'),
    child: const MyApp(),
  ));}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   AwesomeNotifications().setListeners(
  //     onActionReceivedMethod: NotificationController.onActionReceivedMethod,
  //     onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
  //     onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
  //     onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale, // Access locale directly from context
      localizationsDelegates: context.localizationDelegates, // Handle delegates automatically
      supportedLocales: context.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
