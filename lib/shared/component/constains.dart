

import 'package:flutter/material.dart';

import '../../modeules/login/login_screen.dart';
import '../network/local/cache_Helper.dart';

String course="";
String name="";
String email="";
String imageProfile="";
int id =0;
void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false);
    }

  });
}

void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));
}
String token='';
String uId='';
String role='';






