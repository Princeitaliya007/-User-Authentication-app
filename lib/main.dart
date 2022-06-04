import 'package:flutter/material.dart';
import 'package:mediabooster_project3/screens/home_page.dart';
import 'package:mediabooster_project3/screens/login_page.dart';
import 'package:mediabooster_project3/screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  final share = await SharedPreferences.getInstance();

  bool isSignup = share.getBool('signup') ?? false;
  bool checkbox = share.getBool('check') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isSignup) ? (checkbox) ? 'home_page' :'login_page':'/',
      routes: {
        '/' : (context)=> const SignupPage(),
        'login_page' : (context)=> const LoginPage(),
        'home_page' : (context)=> const HomePage(),
      },
    ),
  );
}