class SubmitRegistrationForm {
  bool status;
  String message;
  List<Data> data;

  SubmitRegistrationForm({this.status, this.message, this.data});

  SubmitRegistrationForm.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
       // data.add(new Data.fromJson(v));
      });
    }
  }


}
class Data{

}
