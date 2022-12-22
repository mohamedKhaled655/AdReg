
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class SplashScreen  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:EasySplashScreen(
        showLoader: true,
        loadingText:const Text("Loading..."),
        logo: Image.asset(
          "assets/images/logo2.png",

        ),
        logoWidth: 100,

        title:Text("Building Your Road For Tomorrow",style: TextStyle(fontWeight: FontWeight.bold,fontStyle:FontStyle.italic ),),

      ) ,
    );
  }
}
