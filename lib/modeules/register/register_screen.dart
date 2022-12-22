
import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../layouts/home/home_layout.dart';
import '../../shared/component/components.dart';
import '../../shared/component/constains.dart';
import '../../shared/network/local/cache_Helper.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var ssnController = TextEditingController();
  var nationalityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider
      (
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if(state is RegisterSuccessState)
          {
            if(state.registerModel.status)
            {
              print(state.registerModel.massage);
             // print(state.registerModel.data.token);
              CacheHelper.saveData(key: 'token', value: state.registerModel.data.token).then((value) {
                token=state.registerModel.data.token;
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => HomeLayout()),
                        (Route<dynamic> route) => false);
              });
              Fluttertoast.showToast(
                  msg: state.registerModel.massage,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );



            }
            else{
              print(state.registerModel.massage);
              Fluttertoast.showToast(
                  msg: state.registerModel.massage,
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
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(

            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          "Register now to browse our hot offers",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 15,),
                        defTextFormField(
                          controller: nameController,
                          label: "User Name",
                          keyType: TextInputType.name,
                          prefix: Icons.person,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your User Name ";
                            }
                            return null;
                          },

                        ),
                        SizedBox(height: 15,),
                        defTextFormField(
                          controller: emailController,
                          label: "Email Address",
                          keyType: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your Email Address ";
                            }
                            return null;
                          },

                        ),
                        SizedBox(height: 15,),
                        defTextFormField(
                            controller: passwordController,
                            label: "Password",
                            keyType: TextInputType.visiblePassword,
                            prefix: Icons.lock_open_outlined,
                            suffix: RegisterCubit
                                .get(context)
                                .suffix,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return "Enter Your Validate Password ";
                              }
                              return null;
                            },
                            obscureText: RegisterCubit
                                .get(context)
                                .obscureText,
                            funSuffix: () {
                              RegisterCubit.get(context).changeVisibility();
                            },
                            onsubmitte: (value) {
                              if (formKey.currentState.validate()) {
                                RegisterCubit.get(context).userRegister(
                                    userName: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    ssn: ssnController.text,
                                  nationality: nationalityController.text,
                                  email: emailController.text,
                                );
                              }
                            }

                        ),
                        SizedBox(height: 15,),
                        defTextFormField(
                          controller: ssnController,
                          label: "SSN",
                          keyType: TextInputType.phone,
                          prefix: Icons.article,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your SSN ";
                            }
                            return null;
                          },

                        ),

                        SizedBox(height: 15,),
                        defTextFormField(
                          controller: nationalityController,
                          label: "Nationality",
                          keyType: TextInputType.text,
                          prefix: Icons.accessibility,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Enter Your Nationality ";
                            }
                            return null;
                          },

                        ),
                        SizedBox(height: 15,),
                        ConditionalBuilder(

                          condition: state is! RegisterLoadingState,
                          builder: (context) =>
                              defaultButton(
                                function: () {
                                  if (formKey.currentState.validate()) {
                                    RegisterCubit.get(context).userRegister(
                                        userName: emailController.text,
                                        password: passwordController.text,
                                    ssn: ssnController.text,
                                    name: nameController.text,
                                      nationality: nationalityController.text,
                                      email: emailController.text,

                                    );
                                  }
                                },
                                text: "Submit",
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
