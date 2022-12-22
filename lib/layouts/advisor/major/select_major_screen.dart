

import 'package:advising_academy/models/advisor_model/get_major_model.dart';
import 'package:advising_academy/models/advisor_model/select_major_model.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../advisor_cubit/advisor_cubit.dart';
import '../advisor_cubit/advisor_state.dart';

AdvisorLayoutStates st;
class SelectMajorScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorLayoutCubit, AdvisorLayoutStates>(
      listener: (BuildContext context, state) {
        if(state is MajorSuccessState)
          {
            if(AdvisorLayoutCubit.get(context).majorModel.status==true)
            Fluttertoast.showToast(
                msg: AdvisorLayoutCubit.get(context).majorModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0
            );
            else
              {
                Fluttertoast.showToast(
                    msg: AdvisorLayoutCubit.get(context).majorModel.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
          }
        else if (state is MajorErrorState){
          Fluttertoast.showToast(
              msg:"Found Error !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }

      },
      builder: (BuildContext context, state) {
        var cubit = AdvisorLayoutCubit.get(context);

        return Scaffold(
          appBar: NewGradientAppBar(
            gradient: LinearGradient(colors: appBarColorStudent,
            begin: Alignment.bottomLeft ,
            end: Alignment.topRight,
          ),
            title: Text("Select Major ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), ),
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
                      cubit.getDataMajor();
                    },
                  );
                }
            ),
          ),
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              if(state is MajorLoadingState)
              SliverList(

                delegate: SliverChildListDelegate(
                  [

                    ListTile(title: LinearProgressIndicator(),),

                    // (state is MajorLoadingState)?LinearProgressIndicator():Container(),
                  ],
                ),
              ),

              SliverFillRemaining(
                hasScrollBody: true,
                child: ConditionalBuilder(
                  condition:cubit.selectMajorModel!=null,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) =>buildMajor(cubit.selectMajorModel.data[index],cubit.getMajorModel.data[index],context,state),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.selectMajorModel.data.length,
                    ),
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator()),
                ) ,


              ),
            ],
          ),

        );
      },
    );
  }
}

Widget buildMajor(SelectMajorData model,GetMajorData getMajorData,context,state)=>Card(
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

            Colors.blueGrey[200].withAlpha(150),
            Colors.blueGrey[200].withAlpha(150),


          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  child: Text(

                    model.englishName,
                    style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      overflow: TextOverflow.ellipsis,

                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Container(
                  child: Text(
                    model.arabicName,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.deepOrange.withAlpha(200),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      overflow: TextOverflow.ellipsis,

                    ),
                    maxLines: 2,),
                )

                // IconButton(
                //     onPressed: () {
                //       // AdvisorLayoutCubit.get(context)
                //       //     .selectMajor(model.id);
                //
                //
                //       // Navigator.push(context,
                //       //     MaterialPageRoute(builder: (context) {
                //       //       // return Advisor1Screen();
                //       //       return Scaffold(
                //       //         backgroundColor: Colors.blue,
                //       //         body: Text("nnnnnn"),
                //       //       );
                //       //     }));
                //     },
                //     icon: Icon(Icons.arrow_forward_ios_outlined)),
              ],
            ),
            Divider(color: Colors.black,thickness: .5),
            Container(
              width: 300,
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
                child: Text('Select',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),

                onPressed: (){


                  AdvisorLayoutCubit.get(context)
                      .selectMajorForStudent(getMajorData.id,model.sId);

                },
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);