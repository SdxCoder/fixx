import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:client/core/constants/constants.dart';
import 'package:client/core/models/user.dart';

class UserService {
  final _userCollection = Firestore.instance.collection("users");

  final StreamController<List<User>> _userController =
      StreamController<List<User>>.broadcast();

  Stream<List<User>> listenToUsersRealTime() {

    _userCollection.snapshots().listen((usersSnapshot) {
      if (usersSnapshot.documents.isNotEmpty) {
        var users = usersSnapshot.documents
            .map((snapshot) => User.fromJson(snapshot.data))
           .where((mappedItem) => mappedItem.role != Role.professional)
            .toList();

        _userController.add(users);
      }
    });

    return _userController.stream;
  }

  Future getUsersOnceOff() async {
    try {
      var doc = await _userCollection
          .getDocuments();
     
      if (doc.documents.isNotEmpty) {
        return doc.documents
            .map((snapshot) => User.fromJson(snapshot.data))
            .where((element) => element.role != Role.professional)
            .toList();
      }
      else{
        return List<User>(); // return emply list
      }
      
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future updateUser(User user ) async {
    try {
      await _userCollection
          .document(user.uid)
          .updateData(user.toJson());

    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future createUser(User user) async {
    try {
      if (await _userExists(user.uid) == true) return;
      await _userCollection.document(user.uid).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userCollection.document(uid).get();
      return User.fromJson(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> _userExists(String uid) async {
    DocumentSnapshot snapshot = await _userCollection.document(uid).get();
    return snapshot.exists;
  }
}
