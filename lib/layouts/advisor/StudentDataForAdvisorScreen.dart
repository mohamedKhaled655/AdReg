import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/advisor_model/student_for_advisor.dart';
import 'advisor1_screen.dart';
import 'advisor_cubit/advisor_cubit.dart';
import 'advisor_cubit/advisor_state.dart';
import 'advisor_screen.dart';

class StudentDataForAdvisorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorLayoutCubit, AdvisorLayoutStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AdvisorLayoutCubit.get(context);

        return Scaffold(
          //backgroundColor: Colors.white70,
          body: ConditionalBuilder(
            condition: cubit.studentForAdvisor != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) => buildStudentDataItemForAdvisor(
                  cubit.studentForAdvisor.data[index],
                  context,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: cubit.studentForAdvisor.data.length,
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

Widget buildStudentDataItemForAdvisor(
  StudentDataForAdvisor model,
  context,
) =>
    InkWell(
      child: Card(

        elevation: 0,
        margin: EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.indigo[300],
                  //Colors.teal[400],
                  //Colors.brown[400],
                  Colors.blueGrey[200],

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
                                .postRegisterationStudentData(model.sId);

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Advisor1Screen();
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
            .postRegisterationStudentData(model.sId);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return Advisor1Screen();
            }));
      },
    );
