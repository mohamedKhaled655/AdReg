







import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/show_degree.dart';
import 'cubit/degree_cubit.dart';
import 'cubit/degree_states.dart';



TextStyle style=TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

class ShowDegreeScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    // Size size=MediaQuery.of(context).size;
    // double viewInset=MediaQuery.of(context).viewInsets.bottom;
    // double defaultLoginSize=size.height-(size.height*.2);
    // double defaultRegisterSize=size.height-(size.height*.1);
    return BlocConsumer<DegreeCubit,DegreeStates>(
      listener:(BuildContext context,state){} ,
      builder: (BuildContext context,state){
        var cubit=DegreeCubit.get(context);
        return(state is xxState)?Text("mmmmmmmmmmmmm"): ConditionalBuilder(
            condition: cubit.viewDegreeModel !=null,
          //condition: state is ViewDegreeLoadingState ,
          builder: (context){
            return Padding (

              padding: const EdgeInsets.all(15.0),
              child: ListView.separated(

                itemBuilder: ( context,index)=>Column(
                  children: [

                    viewDegree(cubit.viewDegreeModel.data[index]),
                  ],
                ),
                separatorBuilder: (context,index)=>Divider(),
                itemCount:cubit.viewDegreeModel.data.length,

              ),
            );
          },
          fallback: (context)=>Center(child: CircularProgressIndicator()),

        );


      },
    );


  }
}


Widget viewDegree(ViewDegreeData model){
  String grade="";
  if(model.gPA<=4&&model.gPA>3.7){grade="A";}
  else if(model.gPA<=3.7&&model.gPA>3.3){grade="A-";}
  else if(model.gPA<=3.3&&model.gPA>3.0){grade="B+";}
  else if(model.gPA<=3.0&&model.gPA>2.7){grade="B-";}
  else if(model.gPA<=2.7&&model.gPA>2.3){grade="C+";}
  else if(model.gPA<=2.3&&model.gPA>2.0){grade="C";}
  else if(model.gPA<=2.0&&model.gPA>1.7){grade="C-";}
  else if(model.gPA<=1.7&&model.gPA>1.3){grade="D+";}
  else if(model.gPA<=1.3&&model.gPA>1.0){grade="D";}
  else if(model.gPA<=1.0&&model.gPA>=0){grade="F";}
 return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 10,
    margin:EdgeInsets.all(10.0) ,
    child: Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:250,
                child: Text(
                  model.courseName,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.withAlpha(200),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Final Degree : ",style: style,),
                  Text(model.finalDegree.toString(),style: style,),
                ],
              ),
              Row(
                children: [
                  Text("Year Work : ",style: style,),
                  Text(model.yearWorkDegree.toString(),style: style,),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("grade : ",style: style,),
                  Text(
                    model.gPA.toString(),
                    style: style,),
                ],
              ),
              Row(
                children: [
                  Text("Grade : ",style: style,),
                  Text(grade,style: style,),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 10,),

      ],
    ),
  );
}




