import 'package:ProfessionConnect/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  Map data;
  addData() {
    Map<String, dynamic> newData = {
      "name": "shetty",
      "email": "gs00619@gmail.com"
    };
    CollectionReference collectionReference =
        Firestore.instance.collection('users');
    collectionReference.document('gs00619@gmail.com').setData(newData);
  }

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('userdata');

  // Future<void> updateUserData(String sugars, String name, int strength) async {
  //   return await userCollection.document(uid).setData({
  //     'sugars': sugars,
  //     'name': name,
  //     'strength': strength,
  //   });
  // }

  Future<void> updateUserData({String email, String name, int age}) async {
    CollectionReference collectionReference =
        Firestore.instance.collection('users');
    collectionReference.document(uid).setData({
      'email': email,
      'name': name,
      'age': age,
    });
  }
}
