import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:philo_task/app/app.dart';
import 'package:philo_task/core/helpers/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   print("Handling a background message: ${message.messageId}");
  // }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await FirebaseMessaging.instance.requestPermission();

  // Get FCM token
  // String? token = await FirebaseMessaging.instance.getToken();
  // print("FCM Token: $token");

  runApp(MyApp());
}
