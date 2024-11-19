
import 'package:flutter/material.dart';

import 'Authen/BirdaySheet.dart';
import 'Authen/MentorListScreen.dart';
import 'Authen/NewFeed.dart';
import 'Authen/addContact.dart';
import 'Authen/createAccount.dart';
import 'Authen/splash.dart';
import 'Authen/startSreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: const Center(
          child: CreateaccountScreen(),
        ),
      ),
    );
  }
}

