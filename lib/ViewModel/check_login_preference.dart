import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tramber/View/home.dart';
import 'package:tramber/View/intro_pages/get_start.dart';
import 'package:tramber/View/login/login.dart';
import 'package:tramber/utils/variables.dart';

void checkLoginStatus(context) async {
  bool isLoggedIn = await getLoggedPrefer();
  if (isLoggedIn == true) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);
    await store.getloginUSer(uid, context);
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => intro1()));
  }
}

Future<bool> getLoggedPrefer() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

void setLoginPrefertrue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
  getLoggedPrefer();
}

void setLoginPreferfalse() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
  getLoggedPrefer();
}
