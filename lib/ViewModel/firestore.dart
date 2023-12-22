import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tramber/Model/place_model.dart';
import 'package:tramber/Model/user_model.dart';
import 'package:tramber/View/modules/user/home.dart';
import 'package:tramber/ViewModel/firebase_auths.dart';


class Firestore with ChangeNotifier {
  UserModel? userModel;
  UserModel? hosterModel;
  List<UserModel> hosterAllList = [];
  List<UserModel> hostFemaleList = [];
  List<UserModel> hostMaleList = [];

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

  fetchAllUSer() async {
    QuerySnapshot<Map<String, dynamic>> usersSnapshot =
        await db.collection("user").get();
    hosterAllList = usersSnapshot.docs.map((doc) {
      return UserModel.fromJson(doc.data());
    }).toList();
    notifyListeners();
    _fetchSorteduser();
  }

  _fetchSorteduser() async {
    final collection = db.collection("user");
    QuerySnapshot<Map<String, dynamic>> maleSnapshot =
        await collection.where("gender", isEqualTo: "Male").get();
    QuerySnapshot<Map<String, dynamic>> femaleSnapshot =
        await collection.where("gender", isEqualTo: "Female").get();

    hostFemaleList = femaleSnapshot.docs.map((e) {
      return UserModel.fromJson(e.data());
    }).toList();
    hostMaleList = maleSnapshot.docs.map((e) {
      return UserModel.fromJson(e.data());
    }).toList();
    notifyListeners();
  }

  fetchSelectedHoster(hosterID) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await db.collection("user").doc(hosterID).get();
    if (userSnapshot.exists) {
      hosterModel = UserModel.fromJson(userSnapshot.data()!);
      notifyListeners();
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
          MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
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

  ///////////////////add place IMAGE////////////////////////
  addPlaceDetailsToFirestore(PlaceModel placeModel) async {
    final docs = db.collection("Places").doc();
    await docs.set(placeModel.toJson(docs.id));
    print("*****************image added****************");
  }
}
