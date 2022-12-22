
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme= ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    color:  HexColor('333739'),
  ),
  textTheme: TextTheme(
      bodyText1:TextStyle(
        color: Colors.white,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    selectedItemColor: defColor,
    unselectedItemColor: Colors.white,
    elevation: 20.0,
  ),
);
ThemeData lightTheme=ThemeData(
  primarySwatch: defColor,
 /* floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),*/
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defColor,
      elevation: 20.0
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    color: Colors.white,
    elevation: 0.0,
  ),

  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
);