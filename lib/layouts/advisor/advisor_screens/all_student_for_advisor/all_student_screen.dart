

import 'package:advising_academy/layouts/advisor/advisor_screens/all_student_for_advisor/cubit/all_student_adv_cubit.dart';
import 'package:advising_academy/layouts/advisor/advisor_screens/all_student_for_advisor/cubit/all_student_adv_states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/advisor_model/AllStudentModel.dart';
import '../../advisor_cubit/advisor_cubit.dart';
import '../../advisor_cubit/advisor_state.dart';

class AllStudentForAdvisorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AdvisorAllStudentCubit()..getAllStudentInformation_Advisor(),
      child: BlocConsumer<AdvisorAllStudentCubit, AdvisorAllStudentStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AdvisorAllStudentCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: Material(
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
                  condition: cubit.allStudentForAdvisorModel != null,
                //  condition: state is GetAllStudentForAdvisorLoadingState,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) => buildAllStudentDataItemForAdvisor2(
                        cubit.allStudentForAdvisorModel.data[index],
                        context,
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.allStudentForAdvisorModel.data.length,
                    ),
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildAllStudentDataItemForAdvisor2
    (
    AllStudentForAdvisorData model,
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
                 // Colors.blueAccent.withAlpha(100),
                 //  Colors.indigo[300].withAlpha(150),
                 //  //Colors.teal[400],
                 //  //Colors.brown[400],
                 //  Colors.blueGrey[200].withAlpha(150),
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
              padding: const EdgeInsets.all(15.0),
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
                            // AdvisorLayoutCubit.get(context)
                            //     .postIdForViewCoursesForStudent(model.sId);
                            //
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //       // return Advisor1Screen();
                            //       return AdvisorRegisterScreen();
                            //     }));
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
        // AdvisorLayoutCubit.get(context)
        //     .postIdForViewCoursesForStudent(model.sId);
        //
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) {
        //       // return Advisor1Screen();
        //       return AdvisorRegisterScreen();
        //     }));
      },
    );
