import 'package:firebase_auth/firebase_auth.dart';
import 'package:tramber/ViewModel/firebase_auths.dart';
import 'package:tramber/ViewModel/firestore.dart';

FirebaseAuths authInstence = FirebaseAuths();
Firestore storenstence = Firestore();
final currentUID = FirebaseAuth.instance.currentUser!.uid;
