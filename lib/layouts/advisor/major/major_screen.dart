



import 'package:advising_academy/layouts/advisor/major/select_major_screen.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../../models/advisor_model/get_major_model.dart';
import '../advisor_cubit/advisor_cubit.dart';
import '../advisor_cubit/advisor_state.dart';


class GetMajorScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorLayoutCubit, AdvisorLayoutStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AdvisorLayoutCubit.get(context);

        return Scaffold(
          appBar: NewGradientAppBar(
            gradient: LinearGradient(colors: appBarColorStudent,
              begin: Alignment.bottomLeft ,
              end: Alignment.topRight,
            ),
            title: Text("Select Student ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), ),
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
          backgroundColor: Colors.white,
          body: ConditionalBuilder(
           condition:cubit.getMajorModel!=null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) => buildMajor(cubit.getMajorModel.data[index],context),
                separatorBuilder: (context, index) => Divider(),
                itemCount: cubit.getMajorModel.data.length,
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

Widget buildMajor(GetMajorData model,context)=> InkWell(
  child: Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 0,
    margin: EdgeInsets.all(4.0),
    child: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),

          gradient: LinearGradient(
            colors: [

              Colors.blueGrey[200].withAlpha(200),
              Colors.blueGrey[200].withAlpha(150),


            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
           // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 250,
                    child: Text(

                      model.name,
                      style: TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis,

                      ),
                      maxLines: 2,
                    ),
                  ),

                  IconButton(
                      onPressed: () {
                        AdvisorLayoutCubit.get(context)
                            .selectMajor(model.id);


                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              // return Advisor1Screen();
                              return SelectMajorScreen();
                            }));
                      },
                      icon: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ),
  onTap: (){
    AdvisorLayoutCubit.get(context)
        .selectMajor(model.id);


    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          // return Advisor1Screen();
          return SelectMajorScreen();
        }));
  },
);