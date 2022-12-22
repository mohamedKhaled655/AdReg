class ViewDegreeModel {
  bool status;
  String message;
  List<ViewDegreeData> data;


  ViewDegreeModel({this.status, this.message, this.data});

  ViewDegreeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<ViewDegreeData>();
      json['data'].forEach((v) {
        data.add(new ViewDegreeData.fromJson(v));
      });
    }

  }


}

class ViewDegreeData {
  String courseName;
  dynamic finalDegree;
  dynamic yearWorkDegree;
  dynamic gPA;



  ViewDegreeData.fromJson(Map<String, dynamic> json) {
    courseName = json['courseName']??"Null courseName";
    finalDegree = json['finalDegree']??"Null fDegree";
    yearWorkDegree = json['yearWorkDegree']??"Null yW";
    gPA = json['GPA']??"Null Gpa";
  }


}
