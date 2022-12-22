import 'package:advising_academy/layouts/advisor/advisor_screens/advisor_home_screen/cubit_for_home_screen_for_advisor/states_home_advisor.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/advisor_model/info_student_advisor.dart';
import '../../../../../models/advisor_model/student_for_advisor.dart';
import '../../../../../modeules/login/login_screen.dart';
import '../../../advisor1_screen.dart';
import '../../../advisor_cubit/advisor_cubit.dart';
import '../../../advisor_cubit/advisor_state.dart';
import '../../../advisor_register_screen.dart';
import '../../../advisor_screen.dart';




import 'cubit_home_screen_advisor.dart';

class StudentData_Advisor_HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AdvisorHomeScreenCubit()..getStudentInformationData_Advisor(),
      child: BlocConsumer<AdvisorHomeScreenCubit, AdvisorHomeScreenStates>(
        listener: (BuildContext context, state) {
          if(AdvisorHomeScreenCubit.get(context).informationStudentForAdvisor.status==false){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return LoginScreen();
                }));
          }

        },
        builder: (BuildContext context, state) {
          var cubit = AdvisorHomeScreenCubit.get(context);

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
                      //Colors.white,
                      Colors.white54,
                      Colors.white54,
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
                  condition: cubit.informationStudentForAdvisor != null ,
                  builder: (context) => (cubit.informationStudentForAdvisor.data.isEmpty )? Padding(
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

                                children: const [
                                  Expanded(
                                    child: Center(
                                      child: Text("student not found ",
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
                  ):Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) => buildStudentDataItemForAdvisor1(
                        cubit.informationStudentForAdvisor.data[index],
                        context,
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.informationStudentForAdvisor.data.length,
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

Widget buildStudentDataItemForAdvisor1(
    StudentInfoForAdvisorData model,
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
                 // Colors.indigo[300].withAlpha(150),
                  //Colors.teal[400],
                  //Colors.brown[400],
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
                        width: 250,
                        child: Text(

                          model.englishName??"Null Name",
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
