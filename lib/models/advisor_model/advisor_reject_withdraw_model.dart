class AdvisorRejectWithdrawCourseModel {
  bool status;
  String message;


  AdvisorRejectWithdrawCourseModel({this.status, this.message});

  AdvisorRejectWithdrawCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}
