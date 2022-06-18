import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUserData(
      String authId, String email, Bool enabled, String type) async {
    return await userCollection.doc(authId).set(
        {'email': email, 'enabled': enabled, 'type': type, 'authId': authId});
  }

  Future getUsersList() async {
    List itemsList = [];
    try {
      await userCollection.get().then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          itemsList.add(doc.data());
          print(doc.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
