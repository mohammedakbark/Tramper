import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tramber/Model/bucketlist_model.dart';
import 'package:tramber/Model/hotel_model.dart';
import 'package:tramber/Model/place_model.dart';
import 'package:tramber/Model/restaurent_model.dart';
import 'package:tramber/Model/user_model.dart';
import 'package:tramber/View/modules/user/drop_menu/bucket_list.dart';
import 'package:tramber/View/modules/user/home.dart';
import 'package:tramber/ViewModel/firebase_auths.dart';

class Firestore with ChangeNotifier {
  UserModel? userModel;
  UserModel? hosterModel;
  List<UserModel> hosterAllList = [];
  List<UserModel> hostFemaleList = [];
  List<UserModel> hostMaleList = [];
  List<PlaceModel> placeList = [];
  List<HotelModel> hotelsList = [];
  List<RestaurentModel> restaurentList = [];
  List<PlaceModel> topCategoryList = [];
  List<PlaceModel> adventuresList = [];
  List<PlaceModel> familyDestinationList = [];
  List<UserModel> selctedPlaceHosterList = [];
  final db = FirebaseFirestore.instance;

  Future fetchDatas(lginId) async {
    await fetchTopCategory();
    await fetchAdventure();
    await fetchFamilyDestination();
    await fetchAllUSer();
    await fetchCurrentUser(lginId);
    // notifyListeners();
  }

  getloginUSer(loginId, context) async {
    fetchCurrentUser;
    notifyListeners();

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => home()));
  }

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
    QuerySnapshot<Map<String, dynamic>> usersSnapshot = await db
        .collection("user")
        .where("userType", isEqualTo: "HOSTER")
        .get();
    hosterAllList = usersSnapshot.docs.map((doc) {
      return UserModel.fromJson(doc.data());
    }).toList();
    // notifyListeners();
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
    // notifyListeners();
  }

  fetchSelectedHoster(hosterID) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await db.collection("user").doc(hosterID).get();
    if (userSnapshot.exists) {
      hosterModel = UserModel.fromJson(userSnapshot.data()!);
      // notifyListeners();
    }
  }

////////////////////////////////////////////////////////////////////////////
  addtoBucketList(currentUser, BucketListModel bucketListModel) async{
    final userCollection = db.collection("user");
    final docs =
        userCollection.doc(currentUser).collection("Bucket List").doc();
  await  docs.set(bucketListModel.toJson(docs.id));
  }

/////////////////////////fetch current User///////////////////////////////

  Future fetchCurrentUser(logiId) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await db.collection("user").doc(logiId).get();
    if (userSnapshot.exists) {
      userModel = UserModel.fromJson(userSnapshot.data()!);
      // notifyListeners();
      print(userSnapshot.data()!);
      print("--------fetchd user------");
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

  fetchAllPlaces() async {
    QuerySnapshot<Map<String, dynamic>> placeSnapshot =
        await db.collection("Places").get();
    placeList = placeSnapshot.docs.map((doc) {
      return PlaceModel.fromJson(doc.data());
    }).toList();
    notifyListeners();
    _fetchSorteduser();
  }

  //////////////////hotel///////////////////
  addHotels(selectedplaceId, HotelModel hotelModel) {
    final hotelDocs =
        db.collection("Places").doc(selectedplaceId).collection("Hotels").doc();
    hotelDocs.set(hotelModel.toJson(hotelDocs.id));
    notifyListeners();
  }

  fetchAllHotelFromSelectedPlace(placeId) async {
    QuerySnapshot<Map<String, dynamic>> hotelSnapshot =
        await db.collection("Places").doc(placeId).collection("Hotels").get();
    hotelsList = hotelSnapshot.docs.map((e) {
      return HotelModel.fromJson(e.data());
    }).toList();
    notifyListeners();
  }

  ////////////////////////////////restaurent////////////////////
  addRestaurent(selectedplaceId, RestaurentModel restaurentModel) {
    final restaurentDocs = db
        .collection("Places")
        .doc(selectedplaceId)
        .collection("Restaurent")
        .doc();
    restaurentDocs.set(restaurentModel.toJson(restaurentDocs.id));
    notifyListeners();
  }

  fetchAllRestaurentFromSelectedPlace(placeId) async {
    QuerySnapshot<Map<String, dynamic>> restSnapshot = await db
        .collection("Places")
        .doc(placeId)
        .collection("Restaurent")
        .get();
    restaurentList = restSnapshot.docs.map((e) {
      return RestaurentModel.fromJson(e.data());
    }).toList();
    notifyListeners();
  }

  ////////////////////////////////////////////
  Future fetchAllHotelAndRestaurentsSelectedPlace(
      placeID, selectedPlace) async {
    QuerySnapshot<Map<String, dynamic>> restSnapshot = await db
        .collection("Places")
        .doc(placeID)
        .collection("Restaurent")
        .get();
    restaurentList = restSnapshot.docs.map((e) {
      return RestaurentModel.fromJson(e.data());
    }).toList();
    QuerySnapshot<Map<String, dynamic>> hotelSnapshot =
        await db.collection("Places").doc(placeID).collection("Hotels").get();
    hotelsList = hotelSnapshot.docs.map((e) {
      return HotelModel.fromJson(e.data());
    }).toList();
    await _fetchSelectedPlaceHosters(selectedPlace);
    // await fetchAllRestaurentFromSelectedPlace(placeID);
    // await fetchAllHotelFromSelectedPlace(placeID);
  }

  //////////////////////////////////////////////
  fetchTopCategory() async {
    final collection = db.collection("Places");
    QuerySnapshot<Map<String, dynamic>> placeSnapshot =
        await collection.where("category", isEqualTo: "TOP CATEGORY").get();
    topCategoryList = placeSnapshot.docs.map((e) {
      return PlaceModel.fromJson(e.data());
    }).toList();
    // notifyListeners();
  }

  fetchAdventure() async {
    final collection = db.collection("Places");
    QuerySnapshot<Map<String, dynamic>> placeSnapshot =
        await collection.where("category", isEqualTo: "ADVENTURES").get();
    adventuresList = placeSnapshot.docs.map((e) {
      return PlaceModel.fromJson(e.data());
    }).toList();
    // notifyListeners();
  }

  fetchFamilyDestination() async {
    final collection = db.collection("Places");
    QuerySnapshot<Map<String, dynamic>> placeSnapshot = await collection
        .where("category", isEqualTo: "FAMILY DESTINATION")
        .get();
    familyDestinationList = placeSnapshot.docs.map((e) {
      return PlaceModel.fromJson(e.data());
    }).toList();
    // notifyListeners();
  }

  ///////////////////////////////////////////////
  _fetchSelectedPlaceHosters(selectedPlace) async {
    final collection = db.collection("user");
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await collection.where("city", isEqualTo: selectedPlace).get();

    selctedPlaceHosterList = snapshot.docs.map((e) {
      return UserModel.fromJson(e.data());
    }).toList();
  }
}
