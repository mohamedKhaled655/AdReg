

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/advisor_model/withdraw_course_advisor_model.dart';
import 'advisor_cubit/advisor_cubit.dart';
import 'advisor_cubit/advisor_state.dart';
import 'advisor_register_screen.dart';

class StudentWithdrawCourseAdvisorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorLayoutCubit, AdvisorLayoutStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AdvisorLayoutCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          body:(cubit.withdrawCourseAdvisorModel.message=="not found student")?Padding(
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
                            child: Center(
                              child: Text(cubit.withdrawCourseAdvisorModel.message,
                                maxLines: 3,
                                overflow:TextOverflow.ellipsis ,
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
          ): Material(
            // color: Colors.teal[400],

            elevation: 0,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  // bottomRight: Radius.circular(10),
                  //topLeft: Radius.circular(10),
                  //topRight: Radius.circular(10),
                  bottomLeft:Radius.circular(200),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white70,
                    // Colors.tealAccent.shade700,
                    // Colors.tealAccent.shade100,
                    //Colors.indigo[300],
                    // Colors.teal[400],
                    // Colors.teal[200],
                    // //Colors.brown[400],
                    // Colors.blueGrey[200],

                    // Colors.blueAccent,
                    //Colors.black26,
                  ],
                ),
              ),
              child: ConditionalBuilder(
                condition: cubit.withdrawCourseAdvisorModel != null ,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>buildStudentDataItemForAdvisor3(
                      cubit.withdrawCourseAdvisorModel.data[index],
                      context,
                    ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: cubit.withdrawCourseAdvisorModel.data.length,
                  ),
                ),
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildStudentDataItemForAdvisor3(
    WithdrawCourseAdvisor model,
    context,
    ) =>
    InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        margin: EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),

              gradient: LinearGradient(
                colors: [
                  Colors.blueGrey[200].withAlpha(200),
                  Colors.blueGrey[200].withAlpha(200),

                  // Colors.indigo[300],
                  // //Colors.teal[400],
                  // //Colors.brown[400],
                  // Colors.blueGrey[200],

                  // Colors.blueAccent,
                  //Colors.black26,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 300,
                        child: Text(

                          model.name,
                          style: TextStyle(

                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis,

                          ),
                          maxLines: 2,
                        ),
                      ),

                      IconButton(
                          onPressed: () {
                            AdvisorLayoutCubit.get(context)
                                .postIdForViewCoursesForStudent(model.sId);
                            //AdvisorLayoutCubit.get(context).InfoWithdrawCourseAdvisor();

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  // return Advisor1Screen();
                                  return AdvisorRegisterScreen();
                                }));
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: (){
        AdvisorLayoutCubit.get(context)
            .postIdForViewCoursesForStudent(model.sId);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              // return Advisor1Screen();
              return AdvisorRegisterScreen();
            }));
      },
    );