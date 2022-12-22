

import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../layouts/home/cubit/home_layout_cubit.dart';
import '../layouts/home/cubit/home_layout_state.dart';
import '../models/advisor_model/advisor_model.dart';
import '../models/check_clash_model.dart';
import '../models/group_model.dart';
import '../models/register_case_model.dart';
HomeLayoutStates st;

class GroupScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {





    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener:(BuildContext context,state){
        st=state;

        if(state is DoneAcceptGroupSuccessState)
        {
          Fluttertoast.showToast(
            msg: "The group has been added successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Color(0xFF376b59).withAlpha(200),
            textColor: Colors.white,
            fontSize: 16.0,

          );
          Navigator.pop(context);
        }
        else if(state is DoneRejectGroupSuccessState)
        {
          Fluttertoast.showToast(
              msg: "Please, select another group,found clash",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }

        // if(state is RegisterCaseSuccessState){
        //   Fluttertoast.showToast(
        //       msg: "Done",
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.BOTTOM,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16.0
        //   );
        // }



      } ,
      builder: (BuildContext context,state){

        var cubit=HomeLayoutCubit.get(context);
        return Scaffold(
          
          backgroundColor: Colors.white70.withOpacity(.9),
          appBar: NewGradientAppBar(
            //backgroundColor: Colors.teal,
            gradient: LinearGradient(colors: appBarColorStudent,
              begin: Alignment.bottomLeft ,
              end: Alignment.topRight,
            ),
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
            title: Text(
              'Select Group',

              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),
            ),
          ),
          body:(state is GroupErrorState ) ?Padding(
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

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(" Sorry, Not Found Groups",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.red,

                      ),
                    ),



                  ],
                ),


              ),
            ),
          )
              :CustomScrollView(
            slivers: [
              if(state is RegisterCaseLoadingState)
                SliverList(

                  delegate: SliverChildListDelegate(
                    [

                      ListTile(title: LinearProgressIndicator(),),


                    ],
                  ),
                ),



              SliverFillRemaining(
                hasScrollBody: true,
                child: ConditionalBuilder(
                  condition:cubit.groupModel!=null ,
                  //condition: state is GroupLoadingState,
                  builder: (context)=>Padding (

                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(

                      itemBuilder: ( context,index){

                        return buildGroupItem(cubit.groupModel.data[index],cubit.groupModel,cubit.advisorModel,cubit.registerCaseModel,context,);
                      },
                      separatorBuilder: (context,index)=>Divider(),
                      itemCount:cubit.groupModel.data.length,
                    ),
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator()),
                ),
              ),

            ],
          ),
          // floatingActionButton: ConditionalBuilder(
          //   condition:cubit.groupModel!=null,
          //   builder: (context)=>buildButton(cubit.groupModel.data[i],cubit.checkClashModel,context,),
          //   fallback: (context)=>Center(child: CircularProgressIndicator()),
          // ),



        );
      },
    );


  }
}

Widget buildGroupItem(GroupData model,GroupModel xGroupModel,AdvisorModel x,RegisterCaseModel registerCaseModel,context,)=>Card(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xFF557B83),

    ),
    borderRadius: BorderRadius.circular(25),
  ),
  elevation: 10,
  margin:EdgeInsets.all(4.0) ,
 // shadowColor: Colors.blueAccent,




  child:   SingleChildScrollView(
    child: Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //     bottomRight: Radius.circular(25),
      //     topLeft: Radius.circular(25),
      //     topRight: Radius.circular(25),
      //     bottomLeft:Radius.circular(25),
      //   ),
      //   gradient: LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end:Alignment.topRight,
      //     colors: [
      //       //Colors.indigo[300],
      //
      //       // Colors.teal[400],
      //       // Colors.teal[300],
      //       Color(0xFF00b0ff),
      //       Color(0xFF40c4ff),
      //       Color(0xFF80d8ff),
      //       Color(0xFF82f7ff),
      //
      //
      //
      //       //Colors.brown[400],
      //       // Colors.blueGrey[200],
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Group : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  model.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

              ],
            ),
            Divider(
              thickness: .5,
              color: Color(0xFF557B83),

            ),
            SizedBox(height: 10,),
            (model.lecture==null)?Container(): Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 190,
                        child: Row(
                          children: [
                            Text(
                              'Lec : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                             (model.lecture==null)?"-":"${model.lecture.day}",
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                   //Spacer(),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 150,
                        child: Row(

                          children: [
                            // Text(
                            //   'Dr: ',
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 18,
                            //   ),
                            // ),
                            Container(
                              width: 85,
                              child: Text(
                                (model.lecture==null)?"-":model.lecture.instructorId.englishName,
                                maxLines: 3,

                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text(
                        'from : ',
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        (model.lecture==null)?"-":"${model.lecture.start}",
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        ' --> ',
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        (model.lecture==null)?"-":"${model.lecture.end}",
                        style:Theme.of(context).textTheme.caption
                    ),
                  ],
                ),

              ],
            ),

            (model.lecture==null)?Container():Divider(
              thickness: .5,
              color: Color(0xFF557B83),

            ),

            (model.section==null)?Container():Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width:190,
                        child: Row(
                          children: [
                            Text(
                              'Sec : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            Text(
                              (model.section==null)?"-":"${model.section.day}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 150,
                        child: Row(
                          children: [
                            Text(
                              'Dr: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              width: 85,
                              child: Text(
                                (model.section==null)?"-":model.section.instructorId.englishName,
                                maxLines: 3,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text(
                        'from : ',
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        (model.section==null)?"-":"${model.section.start}",
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        ' --> ',
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        (model.section==null)?"-":"${model.section.end}",
                        style:Theme.of(context).textTheme.caption
                    ),
                  ],
                ),
              ],
            ),
            (model.section==null)?Container():Divider(
              thickness: .5,
              color: Color(0xFF557B83),

            ),
            (model.inLab==false)?Container():Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width:190,
                        child: Row(
                          children: [
                            Text(
                              'Lab : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              (model.inLab==false)?"null":"${model.lab.day}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 150,
                        child: Row(
                          children: [
                            Text(
                              'Dr: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            Container(
                              width: 85,
                              child: Text(
                                (model.inLab==false)?"-":model.lab.instructorId.englishName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text(
                        'from : ',
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        (model.inLab==null)?"-":"${model.lab.start}",
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        ' --> ',
                        style:Theme.of(context).textTheme.caption
                    ),
                    Text(
                        (model.inLab==false)?"-":"${model.lab.end}",
                        style:Theme.of(context).textTheme.caption
                    ),
                  ],
                ),
              ],
            ),


            (model.inLab==false)?Container():Divider(
              thickness: .5,
              color: Color(0xFF557B83),

            ),

            Container(
              width: double.infinity,
              child: OutlinedButton(

                style: ButtonStyle(
                  elevation:MaterialStateProperty.all(7) ,
                  backgroundColor: MaterialStateProperty.all<Color>(

                    //Color(0xFF82f7ff),
                    //Color(0xFFC8E0C8),

                   // Color(0xFFD5DDDF),


                    // Color(0xFFC8E0C8),

                    Color(0xFFD99C54).withOpacity(.75),

                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Colors.black,),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'SELECT GROUP',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),

                onPressed: (){

                  HomeLayoutCubit.get(context).registerCase(model.sId,context);



                },
              ),
            ),

          ],
        ),

      ),
    ),
  ),
);

Widget buildButton(GroupData model,CheckClashModel clashModel,context,)=>FloatingActionButton.extended(
  label:  Text("Send"),
  onPressed: (){
    (clashModel.status==false)? HomeLayoutCubit.get(context).postAdvisorData(model.sId,model.sId,context):null;
  },
);






