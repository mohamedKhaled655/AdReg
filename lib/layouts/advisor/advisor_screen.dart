import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/advisor_model/get_data_for_advisor.dart';
import '../../shared/component/constains.dart';
import 'advisor_cubit/advisor_cubit.dart';
import 'advisor_cubit/advisor_state.dart';


class AdvisorScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorLayoutCubit,AdvisorLayoutStates>(
      listener: (BuildContext context,state){

      },
      builder: (BuildContext context,state){

        var cubit=AdvisorLayoutCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white70,
          body: ConditionalBuilder(

            condition:cubit.getAdvisorData !=null ,
            builder: (context)=>Padding (

              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(

                itemBuilder: ( context,index)=>buildCourseItemForAdvisor(cubit.getAdvisorData.data[index],context,),
                separatorBuilder: (context,index)=>Divider(),
                itemCount:cubit.getAdvisorData.data.length,
              ),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

Widget buildCourseItemForAdvisor(DataForAdvisor model,context,)=>Card(

  elevation: 0,

  margin:EdgeInsets.all(4.0) ,

  child:   SingleChildScrollView(
    child: Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.black26,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Text(
                     "Name : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
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
            SizedBox(height: 10,),

            Row(
              children: [
                SizedBox(width: 50,),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey[50]),
                  ),
                  child: Text('ACCEPT'),

                  onPressed: (){
                    AdvisorLayoutCubit.get(context).postAdvisorAcceptCaseData(model.sId);


                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (context){
                    //       return GroupScreen();
                    //     }));
                  },
                ),
                SizedBox(width: 50,),

                OutlinedButton(

                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey[50]),
                  ),
                  child: Text('REJECT'),

                  onPressed: (){
                    AdvisorLayoutCubit.get(context).postAdvisorRejectCaseData(model.sId);


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
);