class StudentForAdvisor {
  bool status;
  String message;
  List<StudentDataForAdvisor> data;



  StudentForAdvisor.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<StudentDataForAdvisor>();
      json['data'].forEach((v) {
        data.add(new StudentDataForAdvisor.fromJson(v));
      });
    }
  }


}

class StudentDataForAdvisor {
  String sId;
  String name;



  StudentDataForAdvisor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }


}