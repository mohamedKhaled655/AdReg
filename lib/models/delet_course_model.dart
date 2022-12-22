class DeleteCourseModel {
  bool status;
  String message;
  DeleteCourse data;

  DeleteCourseModel({this.status, this.message, this.data});

  DeleteCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DeleteCourse.fromJson(json['data']) : null;
  }


}

class DeleteCourse {
  bool acknowledged;
  int modifiedCount;
  Null upsertedId;
  int upsertedCount;
  int matchedCount;



  DeleteCourse.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }


}