// class InformationStudentForAdvisor {
//   bool status;
//   String message;
//   List<StudentInfoForAdvisorData> data;
//
//   InformationStudentForAdvisor({this.status, this.message, this.data});
//
//   InformationStudentForAdvisor.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = new List<StudentInfoForAdvisorData>();
//       json['data'].forEach((v) {
//         data.add(new StudentInfoForAdvisorData.fromJson(v));
//       });
//     }
//   }
//
//
// }
//
// class StudentInfoForAdvisorData {
//   String sId;
//   String name;
//
//
//
//   StudentInfoForAdvisorData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//   }
//
//
// }


/////////////
class InformationStudentForAdvisor {
  bool status;
  String message;
  List<StudentInfoForAdvisorData> data;

  InformationStudentForAdvisor({this.status, this.message, this.data});

  InformationStudentForAdvisor.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<StudentInfoForAdvisorData>();
      json['data'].forEach((v) {
        data.add(new StudentInfoForAdvisorData.fromJson(v));
      });
    }
  }


}

class StudentInfoForAdvisorData {
  String sId;
  String arabicName;
  String englishName;

  StudentInfoForAdvisorData({this.sId, this.arabicName, this.englishName});

  StudentInfoForAdvisorData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    arabicName = json['arabicName'];
    englishName = json['englishName'];
  }


}
