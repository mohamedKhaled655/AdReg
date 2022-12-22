class AdvisorAcceptCourseModel {
  bool status;
  String message;
  advisorAcceptCourseData data;

  AdvisorAcceptCourseModel({this.status, this.message, this.data});

  AdvisorAcceptCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new advisorAcceptCourseData.fromJson(json['data']) : null;
  }


}

class advisorAcceptCourseData {
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

  advisorAcceptCourseData(
      {this.sId,
        this.studentName,
        this.courseName,
        this.groupId,
        this.advisorId,
        this.studentId,
        this.semesterId,
        this.state,
        this.comment,
        this.startTime,
        this.endTime,
        this.iV});

  advisorAcceptCourseData.fromJson(Map<String, dynamic> json) {
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