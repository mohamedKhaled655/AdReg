



import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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


class LoginScreen extends StatelessWidget {



  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Color(0xFF376b59).withAlpha(200),
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }
            else {
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
          else if(state is LoginErrorState){

            Fluttertoast.showToast(
                msg:"Http status error [503]",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        builder: (BuildContext context, state) { return Scaffold(


          //appBar: AppBar(),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 250.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/login.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),

                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color:Colors.blueAccent.withAlpha(20),

                          ),
                          child: defTextFormField(
                            controller: LoginCubit.get(context).emailController,
                            label: "user Id",
                            keyType: TextInputType.number,
                            prefix: Icons.email_outlined,

                            validate: (String value){
                              if(value.isEmpty)
                              {
                                return "Enter Your user Id ";
                              }
                              return null;
                            },

                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.blueAccent.withAlpha(20),

                          ),
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
                        SizedBox(height: 15,),
                        ConditionalBuilder(

                          condition: state is! LoginLoadingState,
                          builder: (context)=>defaultButton(
                            background: Color(0xFF376b59).withAlpha(120),
                            //background:  Colors.blueAccent.withAlpha(100),
                            //background:  kPrimaryColor.withAlpha(150),

                            radius: 10,
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
                        SizedBox(height: 10,),
                        Row(
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
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),

        ); },


      ),

    );
  }
}
