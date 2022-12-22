



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/register_model.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context)=>BlocProvider.of(context);
  RegisterModel registerModel;



  void userRegister(
      {
        @required String userName,
        @required String password,
        @required String name,
        @required String ssn,
        @required String nationality,
        @required String email,

      }
      ){
    emit(RegisterLoadingState());

    DioHelper.postData(
        url: register+REGISTER,
        data: {
          "userName": userName,
          "password": password,
          "name":name,
          "ssn":ssn,
          "nationality":nationality,
          "email":email,
        }
    ).then((value) {
      print(value.data);

      registerModel=RegisterModel.fromJson(value.data);
      print(registerModel.status);
      print(registerModel.massage);
      print(registerModel.data);

      emit(RegisterSuccessState(registerModel));
    }).catchError((error){

      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }


  IconData suffix=Icons.visibility;

  bool obscureText=true;


  void changeVisibility()
  {
    obscureText=!obscureText;
    suffix=obscureText?Icons.visibility:Icons.visibility_off;
    emit(RegisterLoginChangeVisibilityState());
  }




}