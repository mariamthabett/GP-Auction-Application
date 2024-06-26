import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:philo_task/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'firebase_options.dart';

// The main function is the starting point for all our Flutter Apps
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MyApp(),
    ),
  );
}
