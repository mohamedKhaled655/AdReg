class WithdrawCourseAdvisorModel {
  bool status;
  String message;
  List<WithdrawCourseAdvisor> data;

  WithdrawCourseAdvisorModel({this.status, this.message, this.data});

  WithdrawCourseAdvisorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<WithdrawCourseAdvisor>();
      json['data'].forEach((v) {
        data.add(new WithdrawCourseAdvisor.fromJson(v));
      });
    }
  }


}

class WithdrawCourseAdvisor {
  String sId;
  String name;

  WithdrawCourseAdvisor({this.sId, this.name});

  WithdrawCourseAdvisor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }


}
