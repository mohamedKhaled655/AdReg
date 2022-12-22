class AdvisorRejectCourseModel {
  bool status;
  String message;


  AdvisorRejectCourseModel({this.status, this.message});

  AdvisorRejectCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}
