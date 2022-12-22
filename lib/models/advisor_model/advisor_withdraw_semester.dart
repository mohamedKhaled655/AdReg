class WithdrawSemesterAdvisorModel {
  bool status;
  String message;
  List<WithdrawSemesterAdvisor> data;

  WithdrawSemesterAdvisorModel({this.status, this.message, this.data});

  WithdrawSemesterAdvisorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<WithdrawSemesterAdvisor>();
      json['data'].forEach((v) {
        data.add(new WithdrawSemesterAdvisor.fromJson(v));
      });
    }
  }


}

class WithdrawSemesterAdvisor {
  String sId;
  String name;

  WithdrawSemesterAdvisor({this.sId, this.name});

  WithdrawSemesterAdvisor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }


}
