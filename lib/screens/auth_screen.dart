import 'package:chat_app/widget/auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  void _submitAuthForm( String username)async{
    AuthResult authResult;
    try {
       authResult = await _auth.signInAnonymously();
       Firestore.instance.collection('users').document(authResult.user.uid).setData({
        'username' : username,
      }
      );

    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}