class MajorModel {
  bool status;
  String message;




  MajorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}


