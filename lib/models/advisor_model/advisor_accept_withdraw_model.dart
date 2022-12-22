class AdvisorAcceptWithdrawCourseModel {
  bool status;
  String message;


  AdvisorAcceptWithdrawCourseModel({this.status, this.message});

  AdvisorAcceptWithdrawCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}
