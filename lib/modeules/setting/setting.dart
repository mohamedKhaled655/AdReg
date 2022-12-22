


import 'package:advising_academy/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/home/cubit/home_layout_cubit.dart';
import '../../layouts/home/cubit/home_layout_state.dart';
import '../../shared/component/components.dart';
import '../../shared/component/constains.dart';
import 'button_widet.dart';
import 'pdf_api.dart';




class Settings extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    double viewInset=MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize=size.height-(size.height*.2);
    double defaultRegisterSize=size.height-(size.height*.1);
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener:(BuildContext context,state){} ,
      builder: (BuildContext context,state){
        var cubit=HomeLayoutCubit.get(context);
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                color: Colors.white,
                child: Column(
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: AssetImage('assets/images/pattern.png')
                    //
                    //     ),
                    //   ),
                    //   child: TextButton(
                    //     child: Text('sign out'),
                    //     onPressed: (){
                    //       signOut(context);
                    //       showToast(
                    //         state: ToastStates.SUCCESS,
                    //         text: 'Sign Out',
                    //       );
                    //
                    //     },
                    //   ),
                    // ),
                    Container(
                      height: 400,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                height: 350.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  image: DecorationImage(
                                    image:  AssetImage(
                                        'assets/images/pattern.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  //fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),


                          ButtonWidget(onClicked: ()async
                          {
                            final pdfFile=await PdfApi.generateTable();
                            PdfApi.openFile(pdfFile);

                          },
                              text: "Table PDF"
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kPrimaryColor,
                ),
              ),
            ),
            Positioned(
              top: -60,
              left: -60,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:  kPrimaryColor.withAlpha(150),
                ),
              ),
            ),

            TextButton(
                onPressed: (){
                  cubit.table();
            },
                child: Text("table")),

          ],
        );

      },
    );


  }
}





