class StudentWithdrawSemesterModel {
  bool status;
  String message;
  StudentWithdrawSemesterData data;


  StudentWithdrawSemesterModel({this.status, this.message, });

  StudentWithdrawSemesterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new StudentWithdrawSemesterData.fromJson(json['data']) : null;

  }


}

class StudentWithdrawSemesterData {
  bool acknowledged;
  int modifiedCount;
  Null upsertedId;
  int upsertedCount;
  int matchedCount;

  StudentWithdrawSemesterData(
      {this.acknowledged,
        this.modifiedCount,
        this.upsertedId,
        this.upsertedCount,
        this.matchedCount});

  StudentWithdrawSemesterData.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }


}
