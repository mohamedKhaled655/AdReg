



import 'package:advising_academy/shared/component/constains.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layouts/home/cubit/home_layout_cubit.dart';
import '../layouts/home/cubit/home_layout_state.dart';
import '../models/registeration_for_student.dart';

HomeLayoutStates st;
class ViewRegisterationCousresScreen extends StatelessWidget {

bool isChange=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (BuildContext context,state){
        st =state;

      },
      builder: (BuildContext context,state){

        var cubit=HomeLayoutCubit.get(context);


        return Scaffold(
          backgroundColor: Colors.white,
          body: Material(
            //color: Color(0xFFe8eaf6),
            // elevation: 0,
            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(220)),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if(state is DeleteCourseDataLoadingState || state is DeleteRegisterCaseLoadingState ||state is SubmitRegisterationCoursesLoadingState)
                        ListTile(title: LinearProgressIndicator(),),

                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ConditionalBuilder(condition:cubit.informationForStudent !=null,
                        builder: (context){
                        return Column(
                          children: [
                            buildViewData(cubit.informationForStudent.data.studentData,context,state),

                          ],
                        );
                        },
                        fallback: (context)=>Center(child: Container()),
                      ),


                    ],
                  ),
                ),

                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Divider(color: Colors.black,
                          thickness: .5,indent: 20,endIndent: 20),


                    ],
                  ),
                ),

                SliverFillRemaining(
                  hasScrollBody: true,
                  child: ConditionalBuilder(
                    condition:cubit.informationForStudent !=null ,
                    builder: (context)=>Padding (

                      padding: const EdgeInsets.all(15.0),
                      child: ListView.separated(

                        itemBuilder: ( context,index){

                          return Column(
                            children: [


                              buildViewCourseItem(cubit.informationForStudent.data.registrations[index],context,),


                            ],
                          );
                        },
                        separatorBuilder: (context,index)=>Divider(),
                        itemCount:cubit.informationForStudent.data.registrations.length,
                      ),
                    ),
                    fallback: (context)=>Center(child: CircularProgressIndicator()),
                  ),
                ),



              ],
            ),
          ),

          // floatingActionButton: buildSubmitButton(cubit.informationForStudent.data.studentData),
          floatingActionButton:ConditionalBuilder(
            condition: cubit.informationForStudent !=null,
            fallback: (context)=>Center(child: Container()),
            builder: (context)=>(cubit.informationForStudent.data.studentData.hours.max-cubit.informationForStudent.data.studentData.hours.min>=cubit.informationForStudent.data.studentData.hours.register&&cubit.informationForStudent.data.studentData.enroll==true )?
            FloatingActionButton.extended(
              backgroundColor:  Color(0xFFD99C54).withOpacity(.75),
              label: Text("Submit"),


              onPressed: (){
                cubit.submitRegisterationCourses();
              },
            )
                :Container(),
            // FloatingActionButton.extended(
            //
            //   label: Text("Can't Submit"),
            //   backgroundColor: Colors.grey.withAlpha(100),
            //   enableFeedback: false,
            //
            //   onPressed: null,
            // ),
          ),

        );
      },
    );
  }
}

Widget buildViewCourseItem(Registrations model,context,){

  course=model.courseId.englishName;
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),

    ),

    elevation: 7,
    margin:EdgeInsets.all(4.0) ,
    // color: Color(0xFF40c4ff),
    // color:  Color(0xFFe0e3ed),
    color: Colors.white,

    child:   SingleChildScrollView(
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     bottomRight: Radius.circular(10),
        //     topLeft: Radius.circular(10),
        //     topRight: Radius.circular(10),
        //     bottomLeft:Radius.circular(70),
        //   ),
        //   gradient: LinearGradient(
        //     colors: [
        //       Color(0xFF00b0ff),
        //       Color(0xFF40c4ff),
        //       Color(0xFF80d8ff),
        //       //Color(0xFF82f7ff),
        //
        //       //Colors.indigo[300],
        //
        //       //Colors.teal[400],
        //       // Colors.teal[300],
        //       //
        //       // Colors.blueGrey[200],
        //       //  Colors.tealAccent.shade700,
        //       // // Colors.tealAccent.shade100,
        //       //  Colors.blueGrey[200],
        //
        //       // Color(0xFF23443B),
        //       // Color(0xFF467966),
        //       // Color(0xFF467966),
        //       // Color(0xFF467966),
        //       // Color(0xFF73BA99),
        //       // Color(0xFF73BA99),
        //       // Color(0xFF93EAC0),
        //
        //     ],
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                model.courseId.englishName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Credit : ${model.courseId.courseHours}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Text(
                      (model.state=="studentActive"||model.state=="advisorAccept"||model.state=="advisorReject"||model.state=="studentWithdrawingCourse")?(model.state=="studentWithdrawingCourse")?"Waiting for withdrawal":"waiting":model.state,
                      maxLines: 2,
                      overflow:TextOverflow.ellipsis ,
                      style: (model.state=="accept")?TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green
                      ):TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:(model.state=="studentWithdrawingSemester"||model.state=="rejectWithdrawingSemester"||model.state=="acceptWithdrawingSemester"||model.state=="acceptWithdrawingCourse"||model.state=="rejectWithdrawingCourse")?14: 16,
                          color: Colors.red[900]
                      ),
                  ),
                ],
              ),
              SizedBox(height: 15,),

              // (model.state=="accept")?
              // Center(
              //   child: OutlinedButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(
              //           Colors.blueGrey[50]),
              //     ),
              //     child: Text('Delete'),
              //
              //     onPressed: (){
              //       HomeLayoutCubit.get(context).postDeleteCourse(model.sId);
              //
              //
              //       // Navigator.push(context, MaterialPageRoute(
              //       //     builder: (context){
              //       //       return GroupScreen();
              //       //     }));
              //     },
              //   ),
              // ):Container(),
              (model.state=="active")?Container(
                width: double.infinity,
                child: OutlinedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(7),

                    backgroundColor: MaterialStateProperty.all<Color>(
                      //Colors.blueGrey[50],
                      //  Colors.white,
                   //   Color(0xFFC8E0C8),
                      Color(0xFFD99C54).withOpacity(.6),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_circle_outlined,color: Colors.black,),
                      SizedBox(width: 7,),
                      Text(
                        'Remove',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  onPressed: (){
                    HomeLayoutCubit.get(context).postRemoveRegisterCase(model.sId);


                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (context){
                    //       return GroupScreen();
                    //     }));
                  },
                ),
              ):Container(),
            ],
          ),

        ),
      ),
    ),
  );
}

Widget buildViewData(StudentData model,context,state)=>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(


       // color: Colors.white54,
        //color: Color(0xFF00b0ff),
        color: Color(0xFFD5DDDF),
        shadowColor: Colors.black,
        shape:  RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(20,),
            side: BorderSide(
              color: Colors.green,
            ),
        ),
        elevation: 15,
        child: Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.only(
          //     bottomRight: Radius.circular(90),
          //     topLeft: Radius.circular(10),
          //     topRight: Radius.circular(10),
          //     bottomLeft:Radius.circular(10),
          //   ),
          //   gradient: LinearGradient(
          //     colors: [
          //       Color(0xFF00b0ff),
          //       Color(0xFF40c4ff),
          //       Color(0xFF80d8ff),
          //       // Color(0xFF82f7ff),
          //
          //       //Colors.indigo[300],
          //
          //       // Colors.teal[400],
          //       // Colors.teal[300],
          //       //
          //       //
          //       // //Colors.brown[400],
          //       // Colors.blueGrey[200],
          //
          //       // Colors.blueAccent,
          //       //Colors.black26,
          //     ],
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment:Alignment.center ,
                  child: Text(
                    model.email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                    overflow:TextOverflow.ellipsis ,
                  ),
                ),
                Divider(
                  color:Colors.white70 ,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center ,
                  children: [
                    Text("GPA: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                    Text("${model.gPA}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                  ],
                ),

                Divider(
                  color:Colors.white70 ,
                  thickness: 1.2,
                ),
                Row(
                  children: [
                    Text("Max Hours :",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    Text("${model.hours.max}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    Spacer(),
                    Text("Min Hours :",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    Text("${model.hours.min}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  ],
                ),
                Divider(
                  color:Colors.white70 ,
                  thickness: 1.5,

                ),
              Row(
                children: [
                  Text("Recorded Hours : ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  Text("${model.hours.max-model.hours.register}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                ],
              ),
              //  Divider(),
                // Row(
                //   children: [
                //     Text("Requested Mandatory:",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //     Text("${model.hours.requested.mandatory}",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //     Spacer(),
                //     Text("Requested Optional:",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //     Text("${model.hours.requested.optional}",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //   ],
                // ),
                Divider(),
                // Row(
                //   children: [
                //     Text("Recorded Mandatory:",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //     Text("${model.hours.recorded.mandatory}",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //     Spacer(),
                //     Text("Recorded Optional:",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //     Text("${model.hours.recorded.optional}",style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),),
                //   ],
                // ),
//state is ChangeRegisterationCoursesSuccessState
                (HomeLayoutCubit.get(context).issu==true)? Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.cancel),
                    TextButton(onPressed: (){

                      HomeLayoutCubit.get(context).changeCourses();
                    }, child: Text("Change Courses",style: TextStyle(color: Colors.blue),)),
                 ],
               ):Container(),

              ],
            ),
          ),
        ),
      ),
    );

