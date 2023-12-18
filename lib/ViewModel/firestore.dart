import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tramber/Model/user_model.dart';
import 'package:tramber/View/home.dart';
import 'package:tramber/ViewModel/firebase_auths.dart';

class Firestore {
  UserModel? userModel;

  final db = FirebaseFirestore.instance;
  Future<void> addUserToCollectionUser(uid, UserModel userModel,context) async {
    try {
      final userRef = db.collection("user");
      final docs = userRef.doc(uid);
      await docs.set(userModel.toJson());
      print("----------------added user-----------------");
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

/////////////////////////////////////////////////////////////////
/////////////////////////fetchUser///////////////////////////////
  getloginUSer(loginId, context) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await db.collection("user").doc(loginId).get();
    if (userSnapshot.exists) {
      userModel = UserModel.fromJson(userSnapshot.data()!);
      print(userSnapshot.data()!);
      print("--------fetchd user------");
        Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
    }
  
  }
}
