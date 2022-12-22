

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../layouts/home/cubit/home_layout_cubit.dart';
import '../../layouts/home/cubit/home_layout_state.dart';
import '../../models/get_course_model.dart';
import '../../models/group_model.dart';
import '../models/table_model.dart';

//GroupLoadingState
HomeLayoutStates st;
class TableScreen extends StatelessWidget {

List days=["Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomeLayoutCubit()..table()..tableDay2()..tableDay3()..tableDay4()..tableDay5()..tableDay6(),
      child: BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
        listener: (BuildContext context,state){
          st=state;
        },
        builder: (BuildContext context,state){

          var cubit=HomeLayoutCubit.get(context);
          // return Center(
          //   // Center is a layout widget. It takes a single child and positions it
          //   // in the middle of the parent.
          //     child: WebView(
          //       initialUrl:'https://adreg-adreg.web.app/student/table',javascriptMode: JavascriptMode.unrestricted,
          //     )
          // );
      //     return ListView(
      //       primary: false,
      //       shrinkWrap: true,
      //       children: [
      //         Container(
      //   width: 100,
      //   height: 100,
      //   child: Card(
      //     child: Text("ccccccc"),
      //   ),
      // ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           child: Card(
      //             child: Text("ccccccc"),
      //           ),
      //         ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           child: Card(
      //             child: Text("ccccccc"),
      //           ),
      //         ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           child: Card(
      //             child: Text("ccccccc"),
      //           ),
      //         ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           child: Card(
      //             child: Text("ccccccc"),
      //           ),
      //         ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           child: Card(
      //             child: Text("ccccccc"),
      //           ),
      //         ),
      //         ConditionalBuilder(
      //           condition: true,
      //           builder: (context)=>ListView.separated(
      //             shrinkWrap: true,
      //               primary: false,
      //               itemBuilder: (context,index)=> ListView(
      //                 shrinkWrap: true,
      //                 primary: false,
      //                 scrollDirection: Axis.vertical,
      //                 children: [
      //                   SingleChildScrollView(
      //                     scrollDirection: Axis.horizontal,
      //                     child: Row(
      //                       children: [
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //
      //
      //                 ],
      //               ),
      //               separatorBuilder: (context,index)=>Divider(),
      //               itemCount: 1),
      //           fallback: (context)=>Text("ccccccc"),
      //         ),
      //         ConditionalBuilder(
      //           condition: true,
      //           builder: (context)=>ListView.separated(
      //               shrinkWrap: true,
      //               primary: false,
      //               itemBuilder: (context,index)=> ListView(
      //                 shrinkWrap: true,
      //                 primary: false,
      //                 scrollDirection: Axis.vertical,
      //                 children: [
      //                   SingleChildScrollView(
      //                     scrollDirection: Axis.horizontal,
      //                     child: Row(
      //                       children: [
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                         Container(
      //                           width: 100,
      //                           height: 100,
      //                           child: Card(
      //                             child: Text("nnnnnnnnnnnnnnnn"),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //
      //
      //                 ],
      //               ),
      //               separatorBuilder: (context,index)=>Divider(),
      //               itemCount: 1),
      //           fallback: (context)=>Text("ccccccc"),
      //         ),
      //
      //         // ConditionalBuilder(
      //         //   condition:cubit.tableModel !=null && cubit.day2 !=null && cubit.day3 !=null && cubit.day4 !=null && cubit.day5 !=null && cubit.day6 !=null   ,
      //         //   // condition:state is !GetCoursesLoadingState ,
      //         //   builder: (context)=>ListView.separated(
      //         //     shrinkWrap: true,
      //         //     primary: false,
      //         //     scrollDirection:Axis.horizontal ,
      //         //     itemBuilder: ( context,index){
      //         //       return Column(
      //         //
      //         //         crossAxisAlignment:CrossAxisAlignment.start ,
      //         //         children: [
      //         //           //buildCourseItem(cubit.tableModel.data[index],context,index),
      //         //           // buildCourseSunday(cubit.day2.data[index],context,index),
      //         //           // buildCourseSunday(cubit.day3.data[index],context,index),
      //         //           // buildCourseSunday(cubit.day4.data[index],context,index),
      //         //           // buildCourseSunday(cubit.day5.data[index],context,index),
      //         //
      //         //           buildTable(cubit.tableModel.data[index],context,index),
      //         //           buildTable1(cubit.day2.data[index],context,index),
      //         //           buildTable2(cubit.day3.data[index],context,index),
      //         //           buildTable3(cubit.day4.data[index],context,index),
      //         //           buildTable4(cubit.day5.data[index],context,index),
      //         //           buildTable5(cubit.day6.data[index],context,index),
      //         //
      //         //         ],
      //         //       );
      //         //     },
      //         //     separatorBuilder: (context,index)=>Divider(),
      //         //     itemCount:cubit.tableModel.data.length,
      //         //     //itemCount: 5,
      //         //   ),
      //         //
      //         //   fallback: (context)=>Center(child: CircularProgressIndicator()),
      //         // ),
      //
      //
      //
      //       ],
      //     );
          return Scaffold(
            backgroundColor: Colors.white,
            body:  Align(

              child: ConditionalBuilder(
                condition:cubit.tableModel !=null && cubit.day2 !=null && cubit.day3 !=null && cubit.day4 !=null && cubit.day5 !=null && cubit.day6 !=null   ,
                // condition:state is !GetCoursesLoadingState ,
                builder: (context)=>ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection:Axis.horizontal ,
                  itemBuilder: ( context,index){
                    return SingleChildScrollView(

                      child: Column(
                        textDirection:TextDirection.rtl ,
                        crossAxisAlignment:CrossAxisAlignment.start ,
                        children: [
                          //buildCourseItem(cubit.tableModel.data[index],context,index),
                          // buildCourseSunday(cubit.day2.data[index],context,index),
                          // buildCourseSunday(cubit.day3.data[index],context,index),
                          // buildCourseSunday(cubit.day4.data[index],context,index),
                          // buildCourseSunday(cubit.day5.data[index],context,index),

                          buildTable(cubit.tableModel.data[index],context,index),
                          buildTable1(cubit.day2.data[index],context,index),
                          buildTable2(cubit.day3.data[index],context,index),
                          buildTable3(cubit.day4.data[index],context,index),
                          buildTable4(cubit.day5.data[index],context,index),
                          buildTable5(cubit.day6.data[index],context,index),

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context,index)=>Divider(),
                  itemCount:cubit.tableModel.data.length,
                  //itemCount: 5,
                ),

                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),
            ),

          );
        },
      ),
    );
  }
}


Widget buildTable(TableData model,context,index){

  return Row(
    children: [
      (index==0)?Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Card(child: Center(child: Text("Saturday"))),
          ),

        ],
      ):Container(),
      Container(
        width: 100,
        height: 200,
        padding: EdgeInsets.zero,
        child: Card(
            color:(model.state=="drawing"||model.state=="remove")? Colors.deepOrange.withAlpha(100):Colors.white,

            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      (8+index>12)?"${8+index-12}":"${8+index}",
                    ),
                  ),
                ),
                (model.state=="remove")?Container(): Column(
                  children: [

                    Text(model.type),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 4),
                      child: Container(
                          width: 100,

                          child: Text(model.courseName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(model.drName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    (model.state=="drawing")?Text(model.room):Container(),
                  ],
                ),


              ],
            )),
      ),
    ],
  );
}
Widget buildTable1(TableData model,context,index){

  return Row(
    children: [
      (index==0)?Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Card(child: Center(child: Text("Sunday"))),
          ),

        ],
      ):Container(),
      Container(
        width: 100,
        height: 200,
        child: Card(
            color:(model.state=="drawing"||model.state=="remove")? Colors.deepOrange.withAlpha(100):Colors.white,
            child:  Column(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      (8+index>12)?"${8+index-12}":"${8+index}",
                    ),
                  ),
                ),
                (model.state=="remove")?Container(): Column(
                  children: [

                    Text(model.type),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 4),
                      child: Container(
                          width: 100,

                          child: Text(model.courseName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(model.drName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    (model.state=="drawing")?Text(model.room):Container(),
                  ],
                ),


              ],
            )),
      ),
    ],
  );
}
Widget buildTable2(TableData model,context,index){

  return Row(
    children: [
      (index==0)?Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Card(child: Center(child: Text("Monday"))),
          ),

        ],
      ):Container(),
      Container(
        width: 100,
        height: 200,
        child: Card(
            color:(model.state=="drawing"||model.state=="remove")? Colors.deepOrange.withAlpha(100):Colors.white,
            child:  Column(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      (8+index>12)?"${8+index-12}":"${8+index}",
                    ),
                  ),
                ),
                (model.state=="remove")?Container(): Column(
                  children: [

                    Text(model.type),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 4),
                      child: Container(
                          width: 100,

                          child: Text(model.courseName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(model.drName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    (model.state=="drawing")?Text(model.room):Container(),
                  ],
                ),


              ],
            )),
      ),
    ],
  );
}
Widget buildTable3(TableData model,context,index){

  return Row(
    children: [
      (index==0)?Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Card(child: Center(child: Text("Tuesday"))),
          ),

        ],
      ):Container(),
      Container(
        width: 100,
        height: 200,
        child: Card(
            color:(model.state=="drawing"||model.state=="remove")? Colors.deepOrange.withAlpha(100):Colors.white,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      (8+index>12)?"${8+index-12}":"${8+index}",
                    ),
                  ),
                ),
                (model.state=="remove")?Container(): Column(
                  children: [

                    Text(model.type),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 4),
                      child: Container(
                          width: 100,

                          child: Text(model.courseName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(model.drName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    (model.state=="drawing")?Text(model.room):Container(),
                  ],
                ),


              ],
            )),
      ),
    ],
  );
}
Widget buildTable4(TableData model,context,index){

  return Row(
    children: [
      (index==0)?Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Card(child: Center(child: Text("Tuesday"))),
          ),

        ],
      ):Container(),
      Container(
        width: 100,
        height: 200,
        child: Card(
            color:(model.state=="drawing"||model.state=="remove")? Colors.deepOrange.withAlpha(100):Colors.white,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      (8+index>12)?"${8+index-12}":"${8+index}",
                    ),
                  ),
                ),
                (model.state=="remove")?Container(): Column(
                  children: [

                    Text(model.type),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 4),
                      child: Container(
                          width: 100,

                          child: Text(model.courseName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(model.drName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    (model.state=="drawing")?Text(model.room):Container(),
                  ],
                ),


              ],
            )),
      ),
    ],
  );
}
Widget buildTable5(TableData model,context,index){

  return Row(
    children: [
      (index==0)?Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Card(child: Center(child: Text("Wednesday"))),
          ),

        ],
      ):Container(),
      Container(
        width: 100,
        height: 200,
        child: Card(
            color:(model.state=="drawing"||model.state=="remove")? Colors.deepOrange.withAlpha(100):Colors.white,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      (8+index>12)?"${8+index-12}":"${8+index}",
                    ),
                  ),
                ),
                (model.state=="remove")?Container(): Column(
                  children: [

                    Text(model.type),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 4),
                      child: Container(
                          width: 100,

                          child: Text(model.courseName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(model.drName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    (model.state=="drawing")?Text(model.room):Container(),
                  ],
                ),


              ],
            )),
      ),
    ],
  );
}
Widget buildTable6(TableData model,context,index){

  return Row(
    children: [
      (index==0)?Column(
        children: [
          Container(
            width: 100,
            height: 200,
            child: Card(child: Center(child: Text("Thursday"))),
          ),

        ],
      ):Container(),
      Container(
        width: 100,
        height: 200,
        child: Card(
            color:(model.state=="drawing"||model.state=="remove")? Colors.deepOrange.withAlpha(100):Colors.white,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      (8+index>12)?"${8+index-12}":"${8+index}",
                    ),
                  ),
                ),
                (model.state=="remove")?Container(): Column(
                  children: [

                    Text(model.type),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 4),
                      child: Container(
                          width: 100,

                          child: Text(model.courseName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(model.drName,maxLines: 3,style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    (model.state=="drawing")?Text(model.room):Container(),
                  ],
                ),


              ],
            )),
      ),
    ],
  );
}





Widget buildCourseItem(TableData model,context,index)=>Row(
  children: [
    (index==0)? Column(
      children: [
        Container(
            width: 100,
            height: 50,
            child: Card(
              color: Colors.deepOrange.withAlpha(100),
              child: Center(child: Text("Days/Hours")),),
        ),
        Container(
            width: 100,
            height: 180,
            child: Card(child: Center(child: Text("Saturday")),)),
      ],
    ):Container(),
    (index==0)?SizedBox(width: 10,):Container(),
    (model.state=="active"|| model.state=="drawing")?Column(
      children: [
        Container(
          width:(model.col==2)?200:100,
          // width: 100,

          height: 50,
          child: Card(
            color:  Colors.deepOrange.withAlpha(100),
            child: Center(
              child: Text(
                (model.col+index+7>=13) ?"${model.col+index+7-12}":"${model.col+index+7}",
              ),
            ),
          ),
        ),
        Container(
          width:(model.col==2)?200: 100,
         // width: 100,
          height: 180,
          child: Card(

            shadowColor: Colors.black,


            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 1,
            margin:EdgeInsets.all(5.0) ,

            child: (model.state=="drawing")? Column(
              children: [



                Text(model.courseName,maxLines: 3),
                Text(model.drName,maxLines: 3,),
                Text(model.room),
                Text(model.type),





              ],
            ):Container(),
          ),
        ),
      ],
    ):Container() ,
  ],
);

Widget buildCourseSunday(TableData model,context,index)=>Row(
  children: [
    (index==0)? Container(
        width: 100,
        height: 180,
        child: Card(child: Center(child: Text("Sunday")),)):Container(),
    (index==0)?SizedBox(width: 10,):Container(),
    (model.state=="active"|| model.state=="drawing")?Column(
      children: [

        Container(
          //width:(model.col==2||model.col==3)?(model.col==3)?300:200:(model.state=="remove")?0: 200,
          width: 100,
          height: 180,
          child: Card(


            shadowColor: Colors.black,


            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 1,
            margin:EdgeInsets.all(5.0) ,

            child:   (model.state=="drawing")?Column(
              children: [

              //  Text(model.state),
                Text(model.type),
                SizedBox(height: 10,),
                Text(model.courseName,maxLines: 3,),
                SizedBox(height: 10,),
                Text(model.drName,maxLines: 3,),
                SizedBox(height: 10,),
                Text(model.room),


                //Text("${model.col+index}"),
              ],
            ):Container(),
          ),
        ),
      ],
    ):Container(

    ) ,
  ],
);
