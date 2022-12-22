import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../layouts/home/cubit/home_layout_cubit.dart';

class DioHelper{
  static Dio dio;

  static init(){
    dio=Dio(
      BaseOptions(
       // baseUrl: 'https://student.valuxapps.com/api/',
       //baseUrl: 'http://2bc2-156-209-152-213.ngrok.io/user/login',
        baseUrl: 'https://academic-advising-credit-hours.herokuapp.com/',
        receiveDataWhenStatusError: true,
        headers: {
        //  "Content-Type":"application/json",

        }
      ),


    );
  }
 static Future<Response>getData(
      {
        @required String url,
         Map<String,dynamic> query,
        String lang='en',
        String token,
      }
      )async{
   dio.options.headers={
     "Content-Type":"application/json",
    // "lang":lang,
     "Authorization":token??'',
     "token":token,
   };
    return await dio.get(url,queryParameters: query);
  }





static Future <Response>postData(
  {
  @required String url,
    Map<String,dynamic>query,
    @required Map<String,dynamic>data,
    //String lang="en",
    String token,
}
    )async{
   dio.options.headers={
     "Content-Type":"application/json",
    // "lang":lang,
     //"Authorization":token,
     "token":token,
   };


    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
}


  static Future <Response>putData(
      {
        @required String url,
        Map<String,dynamic>query,
        @required Map<String,dynamic>data,
        //String lang="en",
        String token,
      }
      )async{
    dio.options.headers={
      "Content-Type":"application/json",

     // "lang":lang,
      //"Authorization":token,
      "token":token,
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}