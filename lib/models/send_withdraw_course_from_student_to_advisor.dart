class WithdrawCousreForStudentToAdvisorModel {
  bool status;
  String message;


  WithdrawCousreForStudentToAdvisorModel(
      {this.status, this.message});

  WithdrawCousreForStudentToAdvisorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}
