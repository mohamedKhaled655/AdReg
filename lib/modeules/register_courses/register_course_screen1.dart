




import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/home/cubit/home_layout_cubit.dart';
import '../../layouts/home/cubit/home_layout_state.dart';
import '../../models/registeration_for_student.dart';
HomeLayoutStates st;
class Register_Course extends StatelessWidget {
  const Register_Course({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (BuildContext context,state){
        st=state;
      },
      builder: (BuildContext context,state){

        var cubit=HomeLayoutCubit.get(context);

        return Scaffold(


          body: CustomScrollView(

            slivers: [

              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if(state is GetRegisterationCoursesLoadingState)
                      ListTile(title: LinearProgressIndicator(),),

                  ],
                ),
              ),

              SliverFillRemaining(
                hasScrollBody: true,
                child: ConditionalBuilder(
                  condition:cubit.informationForStudent !=null ,
                  // condition:state is !GetCoursesLoadingState ,
                  builder: (context)=>Padding (

                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(

                      itemBuilder: ( context,index)=>buildCourseItem(cubit.informationForStudent.data.registrations[index],context,),
                      separatorBuilder: (context,index)=>Divider(),
                      itemCount:cubit.informationForStudent.data.registrations.length,
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

Widget buildCourseItem(Registrations model,context,)=>Card(
  elevation: 3,
  margin:EdgeInsets.all(4.0) ,

  child:   SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 160,
                child: Text(
                  model.courseId.englishName,
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
                width: 150,
                child: Text(
                  model.courseId.arabicName,
                  style: TextStyle(

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
                    'Credit : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${ model.courseId.courseHours}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    'Mandatory : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    ( model.courseId.status==true)?"mandatory":"optional",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),

            ],

          ),
          SizedBox(height: 15,),
          Center(
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blueGrey[50]),
              ),
              child: Text('Enroll'),

              onPressed: (){
                HomeLayoutCubit.get(context).postCourses(model.courseId.courseCode);



              },
            ),
          ),

          /* Center(
            child: DropdownButton(
              hint: Text("Select Group"),
              items: HomeLayoutCubit.get(context).Groups.map((course){
                return DropdownMenuItem
                  (
                  value: course,
                  child: Text(course),
                );

              }).toList(),
              onChanged:(value){
                HomeLayoutCubit.get(context).selectGroup(value);
              },
              value:HomeLayoutCubit.get(context).indexGroup ,

            ),
          ),*/
        ],
      ),

    ),
  ),
);


