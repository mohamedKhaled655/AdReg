

import 'package:advising_academy/shared/component/components.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../layouts/home/cubit/home_layout_cubit.dart';
import '../layouts/home/cubit/home_layout_state.dart';
import '../models/withdraw_coursesFor_student_model.dart';

HomeLayoutStates st;
class WithdrawCoursesForStudentScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (BuildContext context,state){
        st=state;
      },
      builder: (BuildContext context,state){

        var cubit=HomeLayoutCubit.get(context);

        return Scaffold(
          appBar: NewGradientAppBar(
            title:Text( "Withdraw From Courses ",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
            gradient: LinearGradient(colors: appBarColorStudent,),
            bottom:PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: SizedBox(height: 5,),
            ) ,
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
          body:(cubit.withdrawCoursesForStudentModel.message=="withdraw is closed now"||cubit.withdrawCoursesForStudentModel.message=="There are no courses available for you to withdraw from"||cubit.withdrawCoursesForStudentModel.message=="The withdrawal is closed to you"||cubit.withdrawCoursesForStudentModel.message=="you are not registered for this semester")?
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 200,
              // margin: EdgeInsets.all(15),
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(

                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(cubit.withdrawCoursesForStudentModel.message,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.red,

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),
                ),


              ),
            ),
          )
              : CustomScrollView(
                slivers: [



                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        if(state is WithdrawCoursesForStudentLoadingState)
                          ListTile(title: LinearProgressIndicator(),),

                      ],
                    ),
                  ),

                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: ConditionalBuilder(
                      condition:cubit.withdrawCoursesForStudentModel !=null ,
                      // condition:state is !GetCoursesLoadingState ,
                      builder: (context)=>Padding (

                        padding: const EdgeInsets.all(15.0),
                        child: ListView.separated(

                          itemBuilder: ( context,index)=>buildWithdrawCourseItem(cubit.withdrawCoursesForStudentModel.data[index],context,),
                          separatorBuilder: (context,index)=>Divider(),
                          itemCount:cubit.withdrawCoursesForStudentModel.data.length,
                        ),
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    ),
                  ),

                ],
              ),
        );
      },
    );
  }
}

Widget buildWithdrawCourseItem(WithdrawCoursesForStudentData model,context,)=>Card(

  shadowColor: Colors.black,


  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  elevation: 10,
  margin:EdgeInsets.all(4.0) ,

  child:   SingleChildScrollView(
    child: Container(

      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //     bottomRight: Radius.circular(75),
      //     topLeft: Radius.circular(10),
      //     topRight: Radius.circular(10),
      //     bottomLeft:Radius.circular(10),
      //   ),
      //   gradient: LinearGradient(
      //     colors: [
      //       //Colors.indigo[300],
      //
      //       Colors.teal[400],
      //       Colors.teal[300],
      //
      //
      //       //Colors.brown[400],
      //       Colors.blueGrey[200],
      //
      //       // Colors.blueAccent,
      //       //Colors.black26,
      //     ],
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  child: Text(
                    model.englishName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                  ),
                ),
                Spacer(),
                Container(

                  alignment: Alignment.centerRight,
                  width: 100,
                  child: Text(
                    model.arabicName,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,

                    ),
                    maxLines: 2,
                    textAlign:TextAlign.right ,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [

                Row(
                  children: [
                    Text(
                      'CourseHours : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${model.courseHours}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(

                  child: Row(
                    children: [
                      // Text(
                      //   'State : ',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 17,
                      //   ),
                      // ),
                      Text(
                        (model.status=="mandatory")?"mandatory":"optional",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                    ],
                  ),
                ),



              ],

            ),
            SizedBox(height: 10,),
            defTextFormField(
              controller: HomeLayoutCubit.get(context).reasonController,
              label: "reason ....",
              keyType: TextInputType.emailAddress,
              prefix: Icons.email_outlined,

              validate: (String value){
                if(value.isEmpty)
                {
                  return "Send the reason for withdrawal";
                }
                return null;
              },

            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: ButtonStyle(

                  elevation:MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all<Color>(
                     // Colors.blueGrey[50],
                   // Colors.tealAccent.shade700,
                   // Color(0xFF00b0ff),

                   // Color(0xFF0091ea),

                    //Color(0xFF39AEA9),
                   // Color(0xFFF6E3C5),

                   // Color(0xFFC8E0C8),


                  //  Color(0xFF557B83),
                    Color(0xFFD99C54).withOpacity(.75),

                    // Color(0xFF80d8ff),
                  //  Color(0xFF82f7ff),
                  ),
                ),
                child: Text('Withdraw',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                onPressed: (){
                   HomeLayoutCubit.get(context).postWithdrawCousreToAdvisor(model.courseCode,HomeLayoutCubit.get(context).reasonController.text);
                  //
                  //
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context){
                  //       return GroupScreen();
                  //     }));
                },
              ),
            ),



          ],
        ),

      ),
    ),
  ),
);