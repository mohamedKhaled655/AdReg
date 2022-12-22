

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layouts/home/cubit/home_layout_cubit.dart';
import '../layouts/home/cubit/home_layout_state.dart';
import '../models/view_courses_model.dart';
HomeLayoutStates st;
class ViewCousresScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (BuildContext context,state){
        st =state;
      },
      builder: (BuildContext context,state){

        var cubit=HomeLayoutCubit.get(context);

        return Scaffold(

          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if(state is DeleteCourseDataLoadingState || state is DeleteRegisterCaseLoadingState)
                      ListTile(title: LinearProgressIndicator(),),

                  ],
                ),
              ),

              SliverFillRemaining(
                hasScrollBody: true,
                child: ConditionalBuilder(
                  condition:cubit.viewCourseModel !=null ,
                  builder: (context)=>Padding (

                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(

                      itemBuilder: ( context,index)=>buildViewCourseItem(cubit.viewCourseModel.data[index],context,),
                      separatorBuilder: (context,index)=>Divider(),
                      itemCount:cubit.viewCourseModel.data.length,
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

Widget buildViewCourseItem(ViewCourseData model,context,)=>RefreshIndicator(
  onRefresh: ()async{
    await Future.delayed(Duration(seconds: 3));
    HomeLayoutCubit.get(context).GetViewCourse();

  },
  color: Colors.white,
  backgroundColor: Colors.purple,
  triggerMode: RefreshIndicatorTriggerMode.anywhere,
  child:   Card(

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
                Text(
                  model.courseName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text(
                  model.state,
                  style: (model.state=="accept")?TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green
                  ):TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red
                  )
                ),
              ],
            ),
            SizedBox(height: 15,),
            (model.state=="accept")?Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blueGrey[50]),
                ),
                child: Text('Delete'),
  
                onPressed: (){
                  HomeLayoutCubit.get(context).postDeleteCourse(model.sId);
  
  
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context){
                  //       return GroupScreen();
                  //     }));
                },
              ),
            ):Container(),
            (model.state=="active")?Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blueGrey[50]),
                ),
                child: Text('Remove'),
  
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