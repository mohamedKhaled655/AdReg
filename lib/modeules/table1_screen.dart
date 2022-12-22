import 'package:advising_academy/shared/styles/colors.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../layouts/home/cubit/home_layout_cubit.dart';
import '../layouts/home/cubit/home_layout_state.dart';
import '../models/table_model.dart';

class Table1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
    //   listener: (BuildContext context,state){
    //
    //   },
    //   builder: (BuildContext context,state){
    //
    //     var cubit=HomeLayoutCubit.get(context);
    //
    //     return Center(
    //       // Center is a layout widget. It takes a single child and positions it
    //       // in the middle of the parent.
    //         child: WebView(
    //           initialUrl:'https://adreg-adreg.web.app/student/table',javascriptMode: JavascriptMode.unrestricted,
    //         )
    //     );
    //
    //
    //   },
    // );

    return BlocProvider(
      create: (BuildContext context) => HomeLayoutCubit()
        ..table()
        ..tableDay2()
        ..tableDay3()
        ..tableDay4()
        ..tableDay5()
        ..tableDay6(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("Days/Hours",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("8-9",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("9-10",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("10-11",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("11-12",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("12-1",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("1-2",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("2-3",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("3-4",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("4-5",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("5-6",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("6-7",style: TextStyle(color: colorForTable),)),
                          ),
                        ),
                        Container(
                          width: 125,
                          height: 50,
                          child: Card(
                            color: colorForAppBarTable,
                            child: Center(child: Text("7-8",style: TextStyle(color: colorForTable),)),
                          ),
                        ),

                      ],
                    ),
                    ConditionalBuilder(
                      condition: cubit.tableModel != null,
                      builder: (context) =>
                          rowTable(cubit.tableModel, "Saturday"),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    ConditionalBuilder(
                      condition: cubit.day2 != null,
                      builder: (context) =>
                          rowTable(cubit.day2, "Sunday"),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    ConditionalBuilder(
                      condition: cubit.day3 != null,
                      builder: (context) =>
                          rowTable(cubit.day3, "Monday"),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    ConditionalBuilder(
                      condition: cubit.day4 != null,
                      builder: (context) =>
                          rowTable(cubit.day4, "Tuesday"),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    ConditionalBuilder(
                      condition: cubit.day5 != null,
                      builder: (context) =>
                          rowTable(cubit.day5, "Wednesday"),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    ConditionalBuilder(
                      condition: cubit.day6 != null,
                      builder: (context) =>
                          rowTable(cubit.day6, "Thursday"),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget rowTable(
  TableModel model,
  String name,
) =>
    Row(
      children: [
        Container(
          width: 100,
          height: 150,
          child: Card(
            color: colorForAppBarTable,
            child: Center(
                child: Text(
              name,
                  style: TextStyle(color: colorForTable,
                  fontWeight: FontWeight.bold,),
            )),
          ),
        ),

        (model.data[0].state == "remove")
            ? Container()
            : Container(
          width: (model.data[0].state == "drawing")
              ? model.data[0].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[1].state == "drawing" ||
                model.data[0].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[0].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[0].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[0].drName),
                ),
                //Divider(),
                Center(
                  child: Text(model.data[0].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[1].state == "remove")
            ? Container()
            : Container(
          width: (model.data[1].state == "drawing")
              ? model.data[1].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[1].state == "drawing" ||
                model.data[1].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[1].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[1].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[1].drName),
                ),
                //Divider(),
                Center(
                  child: Text(model.data[1].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[2].state == "remove")
            ? Container()
            : Container(
          width: (model.data[2].state == "drawing")
              ? (model.data[2].col.toDouble() * 125.0)
              : 125,
          height: 150,
          child: Card(
            color: (model.data[2].state == "drawing" ||
                model.data[2].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[2].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[2].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[2].drName),
                ),
                // Divider(),
                Center(
                  child: Text(model.data[2].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[3].state == "remove")
            ? Container()
            : Container(
          width: (model.data[3].state == "drawing")
              ? model.data[3].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[3].state == "drawing" ||
                model.data[3].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[3].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[3].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                //Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[3].drName),
                ),
                //Divider(),
                Center(
                  child: Text(model.data[3].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[4].state == "remove")
            ? Container()
            : Container(
          width: (model.data[4].state == "drawing")
              ? model.data[4].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[4].state == "drawing" ||
                model.data[4].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[4].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[4].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[4].drName),
                ),
                //Divider(),
                Center(
                  child: Text(model.data[4].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[5].state == "remove")
            ? Container()
            : Container(
          width: (model.data[5].state == "drawing")
              ? model.data[5].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[5].state == "drawing" ||
                model.data[5].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[5].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[5].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[5].drName),
                ),
                // Divider(),
                Center(
                  child: Text(model.data[5].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[6].state == "remove")
            ? Container()
            : Container(
          width: (model.data[6].state == "drawing")
              ? model.data[6].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[6].state == "drawing" ||
                model.data[6].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[6].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[6].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                //  Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[6].drName),
                ),
                //  Divider(),
                Center(
                  child: Text(model.data[6].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[7].state == "remove")
            ? Container()
            : Container(
          width: (model.data[7].state == "drawing")
              ? model.data[7].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[7].state == "drawing" ||
                model.data[7].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[7].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[7].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[7].drName),
                ),
                // Divider(),
                Center(
                  child: Text(model.data[7].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[8].state == "remove")
            ? Container()
            : Container(
          width: (model.data[8].state == "drawing")
              ? model.data[8].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[8].state == "drawing" ||
                model.data[8].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[8].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[8].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[8].drName),
                ),
                // Divider(),
                Center(
                  child: Text(model.data[8].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[9].state == "remove")
            ? Container()
            : Container(
          width: (model.data[9].state == "drawing")
              ? model.data[9].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[9].state == "drawing" ||
                model.data[9].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[9].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[9].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                //  Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[9].drName),
                ),
                // Divider(),
                Center(
                  child: Text(model.data[9].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[10].state == "remove")
            ? Container()
            : Container(
          width: (model.data[10].state == "drawing")
              ? model.data[10].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[10].state == "drawing" ||
                model.data[10].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[10].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[10].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                //  Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[10].drName),
                ),
                //  Divider(),
                Center(
                  child: Text(model.data[10].room),
                ),
              ],
            ),
          ),
        ),
        (model.data[11].state == "remove")
            ? Container()
            : Container(
          width: (model.data[11].state == "drawing")
              ? model.data[11].col.toDouble() * 125.0
              : 125,
          height: 150,
          child: Card(
            color: (model.data[11].state == "drawing" ||
                model.data[11].state == "remove")
                ? Colors.white
                : Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[10].type,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      model.data[11].courseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                //  Divider(),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(model.data[11].drName),
                ),
                //  Divider(),
                Center(
                  child: Text(model.data[11].room),
                ),
              ],
            ),
          ),
        ),



      ],
    );
