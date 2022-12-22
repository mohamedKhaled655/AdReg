import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/home/cubit/home_layout_cubit.dart';
import '../../layouts/home/cubit/home_layout_state.dart';
import '../../models/get_course_model.dart';
import '../../models/group_model.dart';
import '../Select_group_screen.dart';
//GroupLoadingState
HomeLayoutStates st;
class RegisterFormScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (BuildContext context,state){
        st=state;
      },
      builder: (BuildContext context,state){

        var cubit=HomeLayoutCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          body: Material(
            // color: Colors.teal[400],
            // elevation: 0,
            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(220)),
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //    // bottomRight: Radius.circular(10),
              //     //topLeft: Radius.circular(10),
              //     //topRight: Radius.circular(10),
              //     bottomLeft:Radius.circular(200),
              //   ),
              //   gradient: LinearGradient(
              //     colors: [
              //       Color(0xFF0091ea),
              //       Color(0xFF00b0ff),
              //       Color(0xFF40c4ff),
              //       Color(0xFF80d8ff),
              //       Color(0xFF82f7ff),
              //
              //
              //       // Colors.teal[300],
              //       //
              //       // Colors.blueGrey[200],
              //       // Colors.tealAccent.shade700,
              //       // Colors.tealAccent.shade100,
              //       //Colors.indigo[300],
              //       // Colors.teal[400],
              //       // Colors.teal[200],
              //       // //Colors.brown[400],
              //       // Colors.blueGrey[200],
              //
              //       // Colors.blueAccent,
              //       //Colors.black26,
              //     ],
              //   ),
              // ),
              child: CustomScrollView(
                slivers: [

                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        if(state is GroupLoadingState)
                          ListTile(title: LinearProgressIndicator(),),

                      ],
                    ),
                  ),


                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: ConditionalBuilder(
                      condition:cubit.getCoursesModel !=null ,
                      // condition:state is !GetCoursesLoadingState ,
                      builder: (context)=>Padding (

                        padding: const EdgeInsets.all(15.0),
                        child:(cubit.getCoursesModel.data.isEmpty)?
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(

                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center ,
                              children: [
                                Center(child: Text(cubit.getCoursesModel.message,style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),)),
                                Divider(),
                              ],
                            ),
                          ),
                        ):
                        ListView.separated(

                          itemBuilder: ( context,index)=>buildCourseItem(cubit.getCoursesModel.data[index],context,),
                          separatorBuilder: (context,index)=>Divider(),
                          itemCount:cubit.getCoursesModel.data.length,
                        ),
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildCourseItem(DataCourse model,context,)=>Card(

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
                Expanded(
                  child: Container(
                    width: 160,
                    child: Text(
                      model.englishName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
                //Spacer(),
                Expanded(
                  child: Container(

                    alignment: Alignment.centerRight,
                    width: 150,
                    child: Text(
                      model.arabicName,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),
                      maxLines: 2,
                      textAlign:TextAlign.right ,
                    ),
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
                      'State : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        (model.status=="mandatory")?"mandatory":"optional",
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                 Spacer(),
                
                Row(

                  children: [
                    Text(
                      'Credit : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Container(
                      width: 15,
                      child: Text(
                         "${model.courseHours}",

                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),

                  ],
                ),



              ],

            ),

            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all<Color>(
                   // Color(0xFF00b0ff),

                     // Color(0xFFC8E0C8),
                    Color(0xFFD99C54).withOpacity(.75),

                    //Color(0xFF0091ea),
                   // Color(0xFF80d8ff),
                   // Color(0xFF82f7ff),
                  ),
                ),
                child: Text('Enroll',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),

                onPressed: (){
                  HomeLayoutCubit.get(context).postCourses(model.sId);


                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return GroupScreen();
                      }));
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
  ),
);