class SubmitRegisterCousreModel {
  bool status;
  String message;




  SubmitRegisterCousreModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}
