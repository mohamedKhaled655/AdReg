
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../models/registeration_for_student.dart';
import 'advisor_cubit/advisor_cubit.dart';
import 'advisor_cubit/advisor_state.dart';




AdvisorLayoutStates st;
class AdvisorRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorLayoutCubit, AdvisorLayoutStates>(
      listener: (BuildContext context, state) {
        st=state;

      },
      builder: (BuildContext context, state) {
        var cubit = AdvisorLayoutCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white70.withOpacity(.94),
          appBar: NewGradientAppBar(
            gradient: LinearGradient(colors:appBarColor,
            ),
            title: Container(
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
            titleSpacing: 5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body:ConditionalBuilder(
            condition: cubit.registerationAdvisorModel != null,
            builder: (context)=> CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if(state is AdvisorAcceptCourseLoadingState || state is AdvisorRejectCourseLoadingState||state is AdvisorConfirmFormLoadingState)
                        ListTile(title: LinearProgressIndicator(),),

                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      buildViewData1(cubit.registerationAdvisorModel.data.studentData),

                    ],
                  ),
                ),


                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Divider(color: Colors.blue,
                          thickness: .5,indent: 20,endIndent: 20),


                    ],
                  ),
                ),

                SliverFillRemaining(
                  hasScrollBody: true,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 12,bottom: 0,right: 12),
                        child: buildCoursesForStudent(cubit.registerationAdvisorModel.data.registrations[index],context),
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.registerationAdvisorModel.data.registrations.length,
                    ),
                  ),
                ),



              ],
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: Text("Submit"),
            backgroundColor: Color(0xFF376b59).withAlpha(200),
            onPressed: (){
              AdvisorLayoutCubit.get(context)
                  .postAdvisorConfirmForm(AdvisorLayoutCubit.get(context).registerationAdvisorModel.data.studentData.sId);
            },
          ),


        );
      },
    );
  }
}

Widget buildCoursesForStudent(Registrations model,BuildContext context)=>SingleChildScrollView(
  child: Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    margin: EdgeInsets.all(4.0),
    child: SingleChildScrollView(
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     bottomRight: Radius.circular(50),
        //     topLeft: Radius.circular(10),
        //     topRight: Radius.circular(10),
        //   ),
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.indigo[300].withAlpha(150),
        //       //Colors.teal[400],
        //       //Colors.brown[400],
        //       Colors.blueGrey[200].withAlpha(150),
        //
        //       // Colors.blueAccent,
        //       //Colors.black26,
        //     ],
        //     begin: Alignment.bottomLeft,
        //     end: Alignment.topRight,
        //
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              (model.courseId.englishName.length>=15||model.courseId.arabicName.length>=15)?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: 150,
                    child: Text(
                      model.courseId.englishName,
                      maxLines: 3,
                      textDirection: TextDirection.ltr,
                      overflow:TextOverflow.ellipsis ,

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (model.courseId.englishName.length>=10)?18:20,
                      ),
                    ),
                  ),

                  Container(
                  width: 150,
                    child: Text(
                      model.courseId.arabicName,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:(model.courseId.arabicName.length>=15)?18: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                ],
              ) :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    model.courseId.englishName,
                    maxLines: 3,
                    overflow:TextOverflow.ellipsis ,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    model.courseId.arabicName,
                    textDirection: TextDirection.ltr,
                    maxLines: 3,
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
              (model.state=="studentActive")? Center(
                child: Column(
                  children: [
                    // SizedBox(
                    //   width: 70,
                    // ),
                    Container(
                      width: double.infinity,

                      child: OutlinedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(7),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            //Colors.indigo[300].withAlpha(150),
                             // Color(0xFF7A86B6).withOpacity(.7),
                            Color(0xFFD99C54).withOpacity(.75),
                          ),
                        ),
                        child: Text('ACCEPT',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                        onPressed: () {
                          AdvisorLayoutCubit.get(context)
                              .postAdvisorAcceptCourse(model.sId);


                          // Navigator.push(context, MaterialPageRoute(

                          //     builder: (context){

                          //       return GroupScreen();

                          //     }));
                        },
                      ),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Container(
                      width: double.infinity,

                      child: OutlinedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(7),
                          backgroundColor: MaterialStateProperty.all<Color>(
                           // Color(0xFF7A86B6).withOpacity(.7),
                            Color(0xFFD99C54).withOpacity(.75),
                          ),
                        ),
                        child: Text('Reject',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                        onPressed: () {
                          AdvisorLayoutCubit.get(context)
                              .postAdvisorRejectCourse(model.sId);


                          // Navigator.push(context, MaterialPageRoute(

                          //     builder: (context){

                          //       return GroupScreen();

                          //     }));
                        },
                      ),
                    ),
                  ],
                ),
              )
                  :
              Center(child: Text(model.state,style: (model.state=="advisorAccept")?TextStyle(
               color: Colors.indigo[600].withAlpha(150),
                fontWeight: FontWeight.bold,
                fontSize: 18,

              ):(model.state=="active")?TextStyle(
                color: Colors.indigo[600].withAlpha(150),
                fontWeight: FontWeight.bold,
                fontSize: 18,

              ):TextStyle(
                //color:  Color(0xFFF44336A4),
                color:Colors.deepOrangeAccent.withAlpha(150),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),)),

              SizedBox(
                height: 5,
              ),
              (model.state=="studentWithdrawingCourse")?Column(
                children: [

                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(7),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            // Colors.blueGrey[50],
                           // Color(0xFF7A86B6).withOpacity(.7),
                          Color(0xFFD99C54).withOpacity(.75),
                          ),
                      ),
                      child: Text('ACCEPT Withdrawing',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: () {
                        // AdvisorLayoutCubit.get(context)
                        //     .postAdvisorAcceptCourse(model.sId);

                        AdvisorLayoutCubit.get(context).postAdvisorAcceptWithdrawCourse(model.sId);
                      },
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(7),
                        backgroundColor: MaterialStateProperty.all<Color>(
                        //  Color(0xFF7A86B6).withOpacity(.7),
                          Color(0xFFD99C54).withOpacity(.75),
                        ),
                      ),
                      child: Text('Reject Withdrawing',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: () {
                        AdvisorLayoutCubit.get(context).postAdvisorRejectWithdrawCourse(model.sId);


                      },
                    ),
                  ),
                  (model.state=="studentWithdrawingCourse"||model.state=="studentWithdrawingSemester")?SizedBox(height: 15,):Container(),
                  (model.state=="studentWithdrawingCourse"||model.state=="studentWithdrawingSemester")? Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("reason : ",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontWeight: FontWeight.bold,fontSize: 16),),
                      Expanded(
                        child: Container(
                            width: 200,
                            child: Text(model.comment,
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.5),
                                  fontWeight: FontWeight.bold,fontSize: 16),)),
                      ),
                    ],
                  ):Container(),
                ],
              ):Text(""),







            ],
          ),
        ),
      ),
    ),
  ),
);


Widget buildViewData1(StudentData model)=>
    Padding (
      padding: const EdgeInsets.all(15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomRight: Radius.circular(50)),
        ),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              colors: [
                // Color(0xFFB2C8DF),
                // Color(0xFFB2C8DF),
                 Colors.white,
                // Colors.indigo[300].withOpacity(.85),

                Colors.blueGrey[200].withAlpha(200),
                Colors.blueGrey[200].withAlpha(200),


                // Colors.indigo[300],

              // Colors.blueGrey[200],

               //  Colors.white,
                // Colors.blue.withOpacity(.9),


                // Colors.blueAccent,

              ],
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,

            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [

                    Text(
                      model.englishName,
                      style: TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),

                  ],
                ),
                SizedBox(height: 10,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
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
                Divider(),
                Row(
                  children: [
                    Text("Max :",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    Text("${model.hours.max}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    Spacer(),
                    Text("Min :",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    Text("${model.hours.min}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text("Recorded hours:",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    Text("${model.hours.register}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),


                  ],
                ),
                Divider(),


              ],
            ),
          ),
        ),
      ),
    );