class ChangeCoursesModel {
  bool status;
  String message;




  ChangeCoursesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }


}


