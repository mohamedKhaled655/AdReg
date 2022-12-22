


import 'package:advising_academy/modeules/degree_screens/show_degree_screen.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../../layouts/home/cubit/home_layout_cubit.dart';
import '../../../layouts/home/cubit/home_layout_state.dart';
import '../../../shared/component/components.dart';
import '../../../shared/component/constains.dart';
import '../../models/show_degree_year_model.dart';
import 'cubit/degree_cubit.dart';
import 'cubit/degree_states.dart';





class DegreeScreen extends StatelessWidget {




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
        return (state is DegreeErrorState)? Padding(
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

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Row(

                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("There is no degrees for you",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.red,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),


            ),
          ),
        ):ConditionalBuilder(
            condition: cubit.showDegreeYearsModel !=null,
            builder: (context)=>Padding (

              padding: const EdgeInsets.all(15.0),
              child: ListView.separated(

                itemBuilder: ( context,index)=>Column(
                  children: [

                    // buildDegreeYears(cubit.showDegreeYearsModel.data[index].toString()),
                    InkWell(
                      onTap: (){
                        DegreeCubit.get(context).viewDegree(cubit.showDegreeYearsModel.data[index]);

                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return Scaffold(
                                appBar:  NewGradientAppBar(
                                  title: Text("Grades",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  gradient: LinearGradient(colors: appBarColorStudent,),
                                  bottom:PreferredSize(
                                    preferredSize: Size.fromHeight(10),
                                    child: SizedBox(height: 5,),
                                  ) ,
                                  actions: [
                                    Container(
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
                                  ],
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
                                ),
                                body: ShowDegreeScreen(),

                              );
                            }));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),


                        ),
                        child: Card(

                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Center(
                                  child: Text(
                                      cubit.showDegreeYearsModel.data[index].toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),


                                Icon(Icons.arrow_circle_right_outlined,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                separatorBuilder: (context,index)=>Divider(),
                itemCount:cubit.showDegreeYearsModel.data.length,

              ),
            ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),

        );


      },
    );


  }
}







