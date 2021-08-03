// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hlochatbusiness/model/users.dart';
// import 'package:flutter/material.dart';
//
// class FirebaseRepository{
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   static final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   final user = User(uid: "uid", nickName: "nickName", phone: "phone", userName: "userName", profilePhoto: "profilePhoto");
//
//
//
//   Future<FirebaseUser> getCurrentUser() async {
//     FirebaseUser currentUser;
//     currentUser = await _firebaseAuth.currentUser!();
//     return currentUser;
//   }
//
// }