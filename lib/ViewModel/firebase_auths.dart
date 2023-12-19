import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tramber/Model/user_model.dart';
import 'package:tramber/View/home.dart';
import 'package:tramber/View/intro_pages/get_start.dart';
import 'package:tramber/ViewModel/check_login_preference.dart';
import 'package:tramber/utils/variables.dart';

class FirebaseAuths {
  FirebaseAuth auth = FirebaseAuth.instance;

  String? uID;

  sign(
    email,
    password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      uID = userCredential.user!.uid;
      setLoginPrefertrue();
      print("*********************$uID**********************");
    } catch (e) {
      customeShowDiolog("$e", context);
    }
  }

  emailVarification(
    context,
  ) async {
    try {
      if (FirebaseAuth.instance.currentUser != null &&
          !FirebaseAuth.instance.currentUser!.emailVerified) {
        await FirebaseAuth.instance.currentUser!.sendEmailVerification().then(
            (value) => customeShowDiolog(
                "Varification email Send to your registered email address ${FirebaseAuth.instance.currentUser!.email} ",
                context));
      }
    } catch (e) {
      customeShowDiolog("$e", context);
    }
  }

  login(
    email,
    password,
    context,
  ) async {
    try {
      UserCredential loginId = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        setLoginPrefertrue();
        return await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      });
    } catch (e) {
      customeShowDiolog("$e", context);
    }
  }
///////////////////////////////////////////////////////////////////////////////////////

  Future signWithGoogle(
    context,
  ) async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);

await auth.signInWithCredential(credential)
      // return await auth.signInWithCredential(credential)
      .then((value) async {
        await storenstence.addUserToCollectionUser(
    value.user?.uid,
            UserModel(

                email: "${gUser?.email}",
                gender: "",
                password: "",
                phonenumber: 0,
                profileimage: "${gUser?.photoUrl}",
                proofimage: "",
                userID: "${ value.user?.uid}",
                username: "${gUser?.displayName}"),
            context);

        setLoginPrefertrue();
        return await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      });
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

  Future signInWithFacebook(context, page) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          // .then((value) => noti(
          //       "Facebook sign successful",
          //     ))
          .then((value) async {
        setLoginPrefertrue();
        return await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      });
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

  ///////////////////SIGNOUT//////////////////////////////////////
  ///
  ///

  void signOut(
    context,
  ) async {
    setLoginPreferfalse();
    signOutFromMAil(context);
    signoutFromGoogle(
      context,
    );

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => intro1()), (route) => false);
  }

/////////////////////////////////////////////
  void signOutFromMAil(context) {
    FirebaseAuth.instance.signOut();
  }

  void signoutFromGoogle(context) {
    GoogleSignIn().signOut();
  }
}

customeShowDiolog(String title, BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      content: Text(title),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    ),
  );
}
// void noti(msg) {
//   Fluttertoast.showToast(
//     msg: msg,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.CENTER,
//     timeInSecForIosWeb: 1,
//     backgroundColor: Colors.grey.shade200,
//     textColor: Colors.black,
//     fontSize: 20.0,
//   );
// }
