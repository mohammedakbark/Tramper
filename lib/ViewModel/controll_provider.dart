import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  var cetegory;
  onchanged(value) {
    cetegory = value;
    notifyListeners();
  }

  bool isImageLoading = false;

  imageIsLoading(value) {
    isImageLoading = value;
    notifyListeners();
  }

  bool isUserHoster = false;
  
}
