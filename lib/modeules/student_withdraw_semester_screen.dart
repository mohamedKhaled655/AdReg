

import 'package:advising_academy/shared/component/components.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../layouts/home/cubit/home_layout_cubit.dart';
import '../layouts/home/cubit/home_layout_state.dart';
import '../models/student_withdraw_semester.dart';

HomeLayoutStates st;
bool istrue=true;
String change="";
class WithdrawSemesterForStudentScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (BuildContext context,state){
        st=state;
        if(state is WithdrawSemesterForStudentErrorState)
          {
            Fluttertoast.showToast(
                msg: "Failed send request to  Drop From This Semester",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            change="Failed send request to  Drop From This Semester";

          }

        if(state is RejectWithdrawingSemState)
          {
            Fluttertoast.showToast(
                msg: "Failed send request to  Drop From This Semester",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            change="Failed send request to  Drop From This Semester";
          }
        else if(state is AcceptWithdrawingSemState){
          Fluttertoast.showToast(
              msg: "Successful send request to  Drop From This Semester",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          change="Successful send request to  Drop From This Semester";
        }
      },
      builder: (BuildContext context,state){

        var cubit=HomeLayoutCubit.get(context);

        return Scaffold(
          appBar: NewGradientAppBar(
            title:Text( "Drop Semester ",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
            gradient: LinearGradient(colors: appBarColorStudent,),
            bottom:PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: SizedBox(height: 5,),
            ) ,
            actions: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/pattern.png')

                  ),),
                child: Image.asset(
                  "assets/images/logo2.png",
                  scale:4,
                ),
              ),
            ],
            leading: Builder(
                builder: (context) {
                  return IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  );
                }
            ),
          ),
          backgroundColor: Colors.white,

          body:Form(
            key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 250,
               // margin: EdgeInsets.all(15),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(

                    children: [
                      SizedBox(height: 20,),
                      Text(" Drop off Semster",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,

                      ),
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Colors.blue,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(height: 20,),

                      Padding(

                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: defTextFormField(

                          controller: HomeLayoutCubit.get(context).dropSemesterController,

                          label: "the reason ....",
                          keyType: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,

                          validate: (String value){
                            if(cubit.formKey.currentState.validate())
                            {
                              return "Send the reason for withdrawal";
                            }
                            return null;
                          },

                        ),
                      ),
                      SizedBox(height: 10,),
                      (istrue==true)?  Container(
                        width: double.infinity,
                        padding:  EdgeInsets.only(left: 20,right: 20),
                        child: OutlinedButton(
                          style: ButtonStyle(

                            elevation:MaterialStateProperty.all(5),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              // Colors.blueGrey[50],
                              // Colors.tealAccent.shade700,
                              // Color(0xFF00b0ff),
                            //  Color(0xFF557B83),
                              Color(0xFFD99C54).withOpacity(.75),

                              // Color(0xFF80d8ff),
                              // Color(0xFF82f7ff),
                            ),
                          ),

                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Icon(Icons.draw, color: Colors.white),
                              SizedBox(width: 7,),
                              Text('Drop off Semester',style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),

                          onPressed: (){
                            HomeLayoutCubit.get(context).postWithdrawSemesterForStudent(HomeLayoutCubit.get(context).dropSemesterController.text);

                            istrue=false;

                          },
                        ),
                      ):Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            change,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),

                      // Container(
                      //   width: double.infinity,
                      //   padding:  EdgeInsets.only(left: 20,right: 20),
                      //   child: OutlinedButton(
                      //     style: ButtonStyle(
                      //
                      //       elevation:MaterialStateProperty.all(5),
                      //       backgroundColor: MaterialStateProperty.all<Color>(
                      //         // Colors.blueGrey[50],
                      //         Colors.tealAccent.shade700,
                      //       ),
                      //     ),
                      //     child: Row(
                      //
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //
                      //         Icon(Icons.draw, color: Colors.white),
                      //         SizedBox(width: 7,),
                      //         Text('Withdraw From Semester',style: TextStyle(
                      //             fontSize: 14,
                      //             color: Colors.white,fontWeight: FontWeight.bold),),
                      //       ],
                      //     ),
                      //
                      //     onPressed: (){
                      //       //HomeLayoutCubit.get(context).getWithdrawSemesterForStudent();
                      //       Fluttertoast.showToast(
                      //           msg: "Already Send request to  Withdrawal From This Semester",
                      //           toastLength: Toast.LENGTH_SHORT,
                      //           gravity: ToastGravity.BOTTOM,
                      //           timeInSecForIosWeb: 4,
                      //           backgroundColor: Colors.red,
                      //           textColor: Colors.white,
                      //           fontSize: 16.0
                      //       );
                      //       //  istrue=false;
                      //       //
                      //       //
                      //       // Navigator.push(context, MaterialPageRoute(
                      //       //     builder: (context){
                      //       //       return GroupScreen();
                      //       //     }));
                      //     },
                      //   ),
                      // ),
                    ],
                  ),


                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Widget buildWithdrawSemesterItem(StudentWithdrawSemesterModel model,context,)=>Card(
//
//   shadowColor: Colors.black,
//
//
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(20),
//   ),
//   elevation: 10,
//   margin:EdgeInsets.all(4.0) ,
//
//   child:   SingleChildScrollView(
//     child: Container(
//
//       // decoration: BoxDecoration(
//       //   borderRadius: BorderRadius.only(
//       //     bottomRight: Radius.circular(75),
//       //     topLeft: Radius.circular(10),
//       //     topRight: Radius.circular(10),
//       //     bottomLeft:Radius.circular(10),
//       //   ),
//       //   gradient: LinearGradient(
//       //     colors: [
//       //       //Colors.indigo[300],
//       //
//       //       Colors.teal[400],
//       //       Colors.teal[300],
//       //
//       //
//       //       //Colors.brown[400],
//       //       Colors.blueGrey[200],
//       //
//       //       // Colors.blueAccent,
//       //       //Colors.black26,
//       //     ],
//       //   ),
//       // ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 160,
//                   child: Text(
//                     model.englishName,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                     maxLines: 2,
//                   ),
//                 ),
//                 Spacer(),
//                 Container(
//
//                   alignment: Alignment.centerRight,
//                   width: 150,
//                   child: Text(
//                     model.arabicName,
//                     style: TextStyle(
//
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//
//                     ),
//                     maxLines: 2,
//                     textAlign:TextAlign.right ,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10,),
//             Row(
//               children: [
//
//                 Row(
//                   children: [
//                     Text(
//                       'CourseHours : ',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     Text(
//                       "${model.courseHours}",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 Row(
//                   children: [
//                     Text(
//                       'State : ',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                       ),
//                     ),
//                     Text(
//                       (model.mandatory==true)?"mandatory":"optional",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ],
//
//             ),
//             SizedBox(height: 10,),
//             Container(
//               width: double.infinity,
//               child: OutlinedButton(
//                 style: ButtonStyle(
//
//                   elevation:MaterialStateProperty.all(5),
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                     // Colors.blueGrey[50],
//                     Colors.tealAccent.shade700,
//                   ),
//                 ),
//                 child: Text('Withdrawing',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//
//                 onPressed: (){
//                   HomeLayoutCubit.get(context).postWithdrawCousreToAdvisor(model.sId);
//                   //
//                   //
//                   // Navigator.push(context, MaterialPageRoute(
//                   //     builder: (context){
//                   //       return GroupScreen();
//                   //     }));
//                 },
//               ),
//             ),
//
//
//           ],
//         ),
//
//       ),
//     ),
//   ),
// );