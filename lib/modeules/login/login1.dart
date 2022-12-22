



import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../layouts/advisor/advisor_layout.dart';
import '../../layouts/advisor/advisor_screen.dart';
import '../../layouts/home/home_layout.dart';
import '../../shared/component/components.dart';
import '../../shared/component/constains.dart';
import '../../shared/network/local/cache_Helper.dart';
import '../register/register_screen.dart';
import 'cubit/cubit_for_login.dart';
import 'cubit/login_state.dart';



// ignore: must_be_immutable
class Login extends StatelessWidget {



  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double viewInset=MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize=size.height-(size.height*.2);
    double defaultRegisterSize=size.height-(size.height*.1);


    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (BuildContext context, state) {
          if(state is LoginSuccessState)
          {
            if(state.loginModel.status)
            {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              CacheHelper.saveData(key: 'token', value: state.loginModel.data.token).then((value) {
                token=state.loginModel.data.token;
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => HomeLayout()),
                        (Route<dynamic> route) => false);
              });
              CacheHelper.saveData(key: 'role', value: state.loginModel.data.role).then((value) {
                role=state.loginModel.data.role;
                if(role=="advisor"){
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => AdvisorLayout()),
                          (Route<dynamic> route) => false);
                }
                else if(role=="student"){
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => HomeLayout()),
                          (Route<dynamic> route) => false);
                }

              });
              Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }
            else{
              print(state.loginModel.message);
              Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (BuildContext context, state) { return Scaffold(

          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "LOGIN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SvgPicture.asset(
                            'assets/images/a.svg',
                          height: 200,

                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin:EdgeInsets.symmetric(vertical: 10) ,
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(30),
                          //   color: kPrimaryColor.withAlpha(50),
                          //
                          // ),
                          child:  defTextFormField(
                            controller: LoginCubit.get(context).emailController,
                            label: "Email Address",
                            keyType: TextInputType.emailAddress,
                            prefix: Icons.email_outlined,
                            validate: (String value){
                              if(value.isEmpty)
                              {
                                return "Enter Your Email Address ";
                              }
                              return null;
                            },

                          ),
                        ),

                        Container(
                          margin:EdgeInsets.symmetric(vertical: 10) ,
                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(30),
                          //   color: kPrimaryColor.withAlpha(50),
                          //
                          // ),
                          child: defTextFormField(
                              controller: LoginCubit.get(context).passwordController,
                              label: "Password",
                              keyType: TextInputType.visiblePassword,
                              prefix: Icons.lock_open_outlined,
                              suffix: LoginCubit.get(context).suffix,

                              validate: (String value){
                                if(value.isEmpty)
                                {
                                  return "Enter Your Validate Password ";
                                }
                                return null;
                              },
                              obscureText:LoginCubit.get(context).obscureText,
                              funSuffix: (){
                                LoginCubit.get(context).changeVisibility();
                              },
                              onsubmitte: (value){
                                if(formKey.currentState.validate())
                                {
                                  LoginCubit.get(context).userLogin(userId: LoginCubit.get(context).emailController.text,
                                      password: LoginCubit.get(context).passwordController.text);
                                }
                              }

                          ),
                        ),
                        SizedBox(height: 10,),

                        Container(

                          margin:EdgeInsets.symmetric(vertical: 0) ,
                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),

                          child: ConditionalBuilder(

                            condition: state is! LoginLoadingState,
                            builder: (context)=>defaultButton(
                              background:kPrimaryColor,
                              radius: 25,
                              function: (){
                                if(formKey.currentState.validate())
                                {
                                  LoginCubit.get(context).userLogin(userId: LoginCubit.get(context).emailController.text,
                                      password: LoginCubit.get(context).passwordController.text);
                                }


                              },
                              text: "Login",
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                          ),
                        ),




                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              /////Register
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: size.height*.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color:  kPrimaryColor.withAlpha(50),

                  ),
                  alignment: Alignment.center,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>RegisterScreen())
                            );

                          },

                          child: Text("Register Now"))
                    ],
                  ),
                ),
              ),
            ],
          ),


        ); },


      ),

    );
  }
}
