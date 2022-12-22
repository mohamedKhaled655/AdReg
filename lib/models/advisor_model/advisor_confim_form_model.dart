class AdvisorConfirmModel {
  bool status;
  String message;


  AdvisorConfirmModel({this.status, this.message,});

  AdvisorConfirmModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}
