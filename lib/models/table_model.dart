

// class TableModel {
//   bool status;
//   String message;
//   List<TableData> data;
//
//   TableModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = new List<TableData>();
//       json['data'].forEach((v) {
//         data.add(new TableData.fromJson(v));
//       });
//     }
//   }
// }
//
// class TableData {
//   String state;
//   String type;
//   String courseName;
//   String drName;
//   String room;
//   int col;
//   TableData.fromJson(Map<String, dynamic> json) {
//     state = json['state'];
//     type = json['type'];
//     courseName = json['courseName'];
//     drName = json['drName'];
//     room = json['room'];
//     col = json['col'];
//   }
// }
//
//

class TableModel {
  bool status;
  String message;
  List<TableData> data;

  TableModel({this.status, this.message, this.data});

  TableModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<TableData>();
      json['data'].forEach((v) {
        data.add(new TableData.fromJson(v));
      });
    }
  }


}

class TableData {
  String state;
  String type;
  String drName;
  String room;
  int col;
  String courseName;

  TableData(
      {this.state,
        this.type,
        this.drName,
        this.room,
        this.col,
        this.courseName,
      });

  TableData.fromJson(Map<String, dynamic> json) {
    state = json['state']??"Null state";
    type = json['type']??"Null type";
    drName = json['drName']??"Null drName";
    room = json['room']??"Null room";
    col = json['col']??"Null col";
    courseName = json['courseName']??"Null courseName";
  }


}



