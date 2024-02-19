import 'package:e_com/app/view/modules/auth/screens/auth_screen.dart';
import 'package:e_com/app/view/modules/home/admin_home.dart';
import 'package:e_com/core/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: AuthService().user,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return const AdminHome();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
