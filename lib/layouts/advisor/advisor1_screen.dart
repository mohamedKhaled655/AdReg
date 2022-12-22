import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/advisor_model/registeration_student.dart';
import 'advisor_cubit/advisor_cubit.dart';
import 'advisor_cubit/advisor_state.dart';

AdvisorLayoutStates st;
class Advisor1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorLayoutCubit, AdvisorLayoutStates>(
      listener: (BuildContext context, state) {
        st=state;

      },
      builder: (BuildContext context, state) {
        var cubit = AdvisorLayoutCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.registerationStudent != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) => buildCourseItemForAdvisor(
                  cubit.registerationStudent.data.registration[index],
                  context,
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: cubit.registerationStudent.data.registration.length,
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: ConditionalBuilder(
            condition: cubit.registerationStudent != null,
            builder: (context) =>
                Buttom(context, cubit.registerationStudent.data.student),
          ),
        );
      },
    );
  }
}

Widget buildCourseItemForAdvisor(
    Registration model,
    context,
    ) =>
    SingleChildScrollView(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(st is AdvisorAcceptCaseLoadingState)
                    LinearProgressIndicator(),
                  SizedBox(height: 20,),
                  Row(
                    children: [

                      Row(
                        children: [
                          Text(
                            model.studentName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        model.courseName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  (model.state=="accept" || model.state=="reject" ||model.state=="delete")?Row(
                    children: [
                      SizedBox(width: 140,),
                      ( model.state=="accept")?Text(
                        "accept",
                        style: TextStyle(
                          color: Colors.green[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,

                        ),
                      ):Text(""),

                      ( model.state=="reject")?Text(
                        "reject",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ):Text(""),
                      ( model.state=="delete")?Text(
                        "delete",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ):Text("")
                    ],
                  ):
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),

                      (model.state=="accpet")?Text("accept"):OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueGrey[50]),
                        ),
                        child: Text('ACCEPT'),
                        onPressed: () {
                          AdvisorLayoutCubit.get(context)
                              .postAdvisorAcceptCaseData(model.sId);


                          // Navigator.push(context, MaterialPageRoute(

                          //     builder: (context){

                          //       return GroupScreen();

                          //     }));
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      (model.state=="reject")?Container(color: Colors.red,child: Text("reject"),):OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueGrey[50]),
                        ),
                        child: Text('REJECT'),
                        onPressed: () {
                          AdvisorLayoutCubit.get(context)
                              .postAdvisorRejectCaseData(model.sId);

                          // Navigator.push(context, MaterialPageRoute(

                          //     builder: (context){

                          //       return GroupScreen();

                          //     }));
                        },
                      ),

                    ],
                  ),




                ],
              ),
            ),
          ),
        ),
      ),
    );

Widget Buttom(context, Student model) => FloatingActionButton.extended(
  backgroundColor: Colors.indigo[300],
  icon: Icon(Icons.add),
  label: Text('Submit'),
  onPressed: () {

    AdvisorLayoutCubit.get(context).postSubmitRegisterationForm(model.sId);
  },
);
