


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../../models/login_model.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);
  LoginModel loginModel;

  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  void userLogin(
  {
  @required String userId,
    @required String password,

}
      ){
    emit(LoginLoadingState());

    DioHelper.postData(
        url: user+LOGIN,
        data: {
          "userId": userId,
          "password": password,
        }
        ).then((value) {
          print(value.data);

          loginModel=LoginModel.fromJson(value.data);
           print(loginModel.status);

           print(loginModel.message);
          print(loginModel.data.role);




          emit(LoginSuccessState(loginModel));
    }).catchError((error){

      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }


IconData suffix=Icons.visibility;

  bool obscureText=true;


  void changeVisibility()
  {
    obscureText=!obscureText;
    suffix=obscureText?Icons.visibility:Icons.visibility_off;
    emit(LoginChangeVisibilityState());
  }




}