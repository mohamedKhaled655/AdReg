class ViewCourseModel {
  bool status;
  String message;
  List<ViewCourseData> data;



  ViewCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<ViewCourseData>();
      json['data'].forEach((v) {
        data.add(new ViewCourseData.fromJson(v));
      });
    }
  }


}

class ViewCourseData {
  String sId;
  String courseName;
  String state;
  String comment;



  ViewCourseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseName = json['courseName']??"Null courseName";
    state = json['state'];
    comment = json['comment'];
  }


}