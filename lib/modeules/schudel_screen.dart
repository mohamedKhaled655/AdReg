
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),

      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              child: Text(
                'schedule',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 700,

            child: ListView(
             scrollDirection:Axis.horizontal,

              children: <Widget>[
                DataTable(

                 headingRowColor: MaterialStateProperty.all<Color>(Colors.black12),
                  dividerThickness: 70,

                  dataRowHeight: 70,
                  columnSpacing: 0,
                 dataRowColor: MaterialStateProperty.all(Colors.blue),

                 // border: TableBorder.all(color: Colors.blueAccent),
                  // dataRowColor: MaterialStateProperty.all<Color>(
                  //  Colors.blueGrey[50]),



                  columns: [

                    DataColumn(
                      label: Text(
                        "day/hour",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,

                      ),


                    ),
                    DataColumn(
                      label: Center(
                        child: Text(
                          "9-10",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,

                        ),
                      ),

                    ),
                    DataColumn(
                      label: Text(
                        "9-10",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,

                      ),

                    ),
                    DataColumn(
                      label: Text(
                        "9-10",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,

                      ),

                    ),
                    DataColumn(
                      label: Text(
                        "12-1",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,

                      ),

                    ),
                    DataColumn(
                      label: Center(
                        child: Text(
                          "1-2",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,

                        ),
                      ),

                    ),




                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 55,
                            child: Text(
                              "saturday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              " ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(
                            
                            width: 55,
                            child: Text(
                              "saturday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,

                            child: Text(
                              "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 55,
                            child: Text(
                              "saturday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 55,
                            child: Text(
                              "saturday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 55,
                            child: Text(
                              "saturday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 55,
                            child: Text(
                              "saturday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(
                            width: 55,
                            child: Text(
                              "saturday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: 70,
                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,

                            ),
                          ),
                        ),

                      ],
                    ),






                    /*
                    DataRow(
                      cells: [
                        DataCell(
                          Container(

                            child: Text(
                              "Sunday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(

                            child: Text(
                              "Monday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(

                            child: Text(
                              "Tuesday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(

                            child: Text(
                              "Wednesday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(

                            child: Text(
                              "Thursday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),

                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Container(

                            child: Text(
                              "Friday ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),
                        DataCell(
                          Container(

                            child: Text(
                              "Algorithms design Analysis ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,

                            ),
                          ),
                        ),

                      ],
                    ),
                    */


                  ],
                ),

              ],

            ),
          ),
        ],
      ),




    );


  }
}