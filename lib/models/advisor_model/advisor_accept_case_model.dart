class AdvisorAcceptCaseModel {
  bool status;
  String message;
  DataAcceptCase data;

  AdvisorAcceptCaseModel({this.status, this.message, this.data});

  AdvisorAcceptCaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DataAcceptCase.fromJson(json['data']) : null;
  }


}

class DataAcceptCase {
  String sId;
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
  int iV;



  DataAcceptCase.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    iV = json['__v'];
  }


}