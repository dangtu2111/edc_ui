
import 'package:flutter/cupertino.dart';

class Background{
  Widget defauld = Container(

    child: Column(
    children: [
      Expanded(
        child: Image.asset(
          "assets/images/background01.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Expanded(
        child: Image.asset(
          "assets/images/background02.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ],
  ),);
}