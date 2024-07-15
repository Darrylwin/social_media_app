import 'package:flutter/material.dart';
import 'package:social_media_app/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/pages/home_page.dart';
import 'package:social_media_app/pages/profile_page.dart';
import 'package:social_media_app/pages/users_page.dart';
import 'package:social_media_app/themes/dark_mode.dart';
import 'package:social_media_app/themes/light_mode.dart';
import 'auth/auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/login_register_page' : (context) => const LoginOrRegisterPage(),
        '/home_page' : (context) => HomePage(),
        '/profile_page' : (context) => const ProfilePage(),
        '/users_page' : (context) => const UsersPage(),
      },
    );
  }
}
