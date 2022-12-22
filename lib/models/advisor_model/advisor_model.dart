

class AdvisorModel {
  bool status;
  String message;
  AdvisorData data;



  AdvisorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    message = json['message'];
    data = json['data'] != null ? new AdvisorData.fromJson(json['data']) : null;
  }


}

class AdvisorData {
  String studentName;
  String courseName;
  String groupId;
  String advisorId;
  String studentId;
  String semesterId;
  String state;
  String comment;
  String startTime;
  String endTime;
  String sId;




  AdvisorData.fromJson(Map<String, dynamic> json) {
    studentName = json['studentName'];
    courseName = json['courseName'];
    groupId = json['groupId'];
    advisorId = json['advisorId'];
    studentId = json['studentId'];
    semesterId = json['semesterId'];
    state = json['state'];
    comment = json['comment'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    sId = json['_id'];

  }


}