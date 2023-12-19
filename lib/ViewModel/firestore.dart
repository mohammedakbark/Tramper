import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tramber/Model/user_model.dart';
import 'package:tramber/View/home.dart';
import 'package:tramber/ViewModel/firebase_auths.dart';
import 'package:tramber/ViewModel/pick_image.dart';
import 'package:tramber/utils/variables.dart';

class Firestore with ChangeNotifier {
  UserModel? userModel;

  final db = FirebaseFirestore.instance;

  //////////////////////////////add user/////////////////////
  Future<void> addUserToCollectionUser(
      uid, UserModel userModel, context) async {
    try {
      final userRef = db.collection("user");
      final docs = userRef.doc(uid);
      await docs.set(userModel.toJson());
      print("----------------added user-----------------");
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

/////////////////////////fetch current User///////////////////////////////
  getloginUSer(loginId, context) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await db.collection("user").doc(loginId).get();
    if (userSnapshot.exists) {
      userModel = UserModel.fromJson(userSnapshot.data()!);
      notifyListeners();
      print(userSnapshot.data()!);
      print("--------fetchd user------");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => home()), (route) => false);
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => home()));
    }
  }

  updateUSerDAta(userID, UserModel userModel, context) async {
    final userRef = db.collection("user");
    final docs = userRef.doc(userID);
    await docs.update(userModel.toJson());
    notifyListeners();
    await getloginUSer(userID, context);
  }
}
