//
//
// class RegisterCaseModel {
//   bool status;
//   String message;
//   RegisterCaseData data;
//
//   RegisterCaseModel({this.status, this.message, this.data});
//
//   RegisterCaseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new RegisterCaseData.fromJson(json['data']) : null;
//   }
//
//
// }
//
// class RegisterCaseData {
//   String studentName;
//   String courseName;
//   String courseCode;
//   String groupId;
//   String advisorId;
//   String studentId;
//   String semester;
//   int academicYear;
//   String state;
//   String comment;
//   String startTime;
//   String endTime;
//   String sId;
//   int iV;
//
//
//
//   RegisterCaseData.fromJson(Map<String, dynamic> json) {
//     studentName = json['studentName'];
//     courseName = json['courseName'];
//     courseCode = json['courseCode'];
//     groupId = json['groupId'];
//     advisorId = json['advisorId'];
//     studentId = json['studentId'];
//     semester = json['semester'];
//     academicYear = json['academicYear'];
//     state = json['state'];
//     comment = json['comment'];
//     startTime = json['startTime'];
//     endTime = json['endTime'];
//     sId = json['_id'];
//     iV = json['__v'];
//   }
//
//
// }


////////////////

class RegisterCaseModel {
  bool status;
  String message;
  RegisterCaseData data;

  RegisterCaseModel({this.status, this.message, this.data});

  RegisterCaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new RegisterCaseData.fromJson(json['data']) : null;
  }


}

class RegisterCaseData {
  String courseId;
  String groupId;
  String advisorId;
  String studentId;
  String semester;
  int academicYear;
  String state;
  String comment;
  String startTime;
  String endTime;
  String sId;
  int iV;

  RegisterCaseData(
      {this.courseId,
        this.groupId,
        this.advisorId,
        this.studentId,
        this.semester,
        this.academicYear,
        this.state,
        this.comment,
        this.startTime,
        this.endTime,
        this.sId,
        this.iV});

  RegisterCaseData.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    groupId = json['groupId'];
    advisorId = json['advisorId'];
    studentId = json['studentId'];
    semester = json['semester'];
    academicYear = json['academicYear'];
    state = json['state'];
    comment = json['comment'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    sId = json['_id'];
    iV = json['__v'];
  }


}