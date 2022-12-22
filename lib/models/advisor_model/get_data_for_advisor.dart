class GetAdvisorData {
  bool status;
  String message;
  List<DataForAdvisor> data;

  GetAdvisorData({this.status, this.message, this.data});

  GetAdvisorData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<DataForAdvisor>();
      json['data'].forEach((v) {
        data.add(new DataForAdvisor.fromJson(v));
      });
    }
  }

}

class DataForAdvisor {
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



  DataForAdvisor.fromJson(Map<String, dynamic> json) {
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