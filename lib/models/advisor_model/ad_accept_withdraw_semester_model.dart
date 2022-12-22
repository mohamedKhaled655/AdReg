class AdvisorAcceptWithdrawSemesterModel {
  bool status;
  String message;
  // List<Null> data;

  AdvisorAcceptWithdrawSemesterModel({this.status, this.message, });

  AdvisorAcceptWithdrawSemesterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // if (json['data'] != null) {
    //   data = new List<Null>();
    //   json['data'].forEach((v) {
    //     data.add(new Null.fromJson(v));
    //   });
    // }
  }


}
