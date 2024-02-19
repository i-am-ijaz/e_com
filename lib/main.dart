import 'package:e_com/app/view/modules/auth/landing.dart';
import 'package:e_com/app/view/theme/theme.dart';
import 'package:e_com/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Com',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const LandingScreen(),
    );
  }
}
