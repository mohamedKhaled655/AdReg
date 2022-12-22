// class WithdrawCoursesForStudentModel {
//   bool status;
//   String message;
//   List<WithdrawCoursesForStudentData> data;
//
//
//
//   WithdrawCoursesForStudentModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = new List<WithdrawCoursesForStudentData>();
//       json['data'].forEach((v) {
//         data.add(new WithdrawCoursesForStudentData.fromJson(v));
//       });
//     }
//   }
//
//
// }
//
// class WithdrawCoursesForStudentData {
//   String sId;
//   String arabicName;
//   String englishName;
//   String couseCode;
//   int finalDegree;
//   int yearWorkDegree;
//   bool mandatory;
//   int courseHours;
//   List<String> prerequisite;
//   List<String> majors;
//   String requirements;
//   int iV;
//   int l;
//   int t;
//   int p;
//
//
//
//   WithdrawCoursesForStudentData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     arabicName = json['arabicName'];
//     englishName = json['englishName'];
//     couseCode = json['couseCode'];
//     finalDegree = json['finalDegree'];
//     yearWorkDegree = json['yearWorkDegree'];
//     mandatory = json['mandatory'];
//     courseHours = json['courseHours'];
//     if (json['prerequisite'] != null) {
//       prerequisite = <String>[];
//       json['prerequisite'].forEach((v) {
//         prerequisite.add((v));
//       });
//     }
//     if (json['majors'] != null) {
//       majors = <String>[];
//       json['majors'].forEach((v) {
//         majors.add((v));
//       });
//     }
//     requirements = json['requirements'];
//     iV = json['__v'];
//     l = json['L'];
//     t = json['T'];
//     p = json['P'];
//   }
//
//
// }

/////
class WithdrawCoursesForStudentModel {
  bool status;
  String message;
  List<WithdrawCoursesForStudentData> data;

  WithdrawCoursesForStudentModel({this.status, this.message, this.data});

  WithdrawCoursesForStudentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<WithdrawCoursesForStudentData>();
      json['data'].forEach((v) {
        data.add(new WithdrawCoursesForStudentData.fromJson(v));
      });
    }
  }


}

class WithdrawCoursesForStudentData {
  String sId;
  String arabicName;
  String englishName;
  String courseCode;
  int finalDegree;
  int yearWorkDegree;
  String status;
  List<String> details;
  int courseHours;
  int l;
  int t;
  int p;
  List<String> prerequisite;
  List<String> majors;
  String requirements;
  int iV;



  WithdrawCoursesForStudentData.fromJson(Map<String, dynamic> json) {
    sId = json['_id']??"Null id";
    arabicName = json['arabicName']??"Null arName";
    englishName = json['englishName']??"Null enName";
    courseCode = json['courseCode']??"Null courseCode";
    finalDegree = json['finalDegree']??"Null fD";
    yearWorkDegree = json['yearWorkDegree']??"Null yw";
    status = json['status']??"Null status";


    if (json['details'] != null) {
      details = <String>[];
      json['details'].forEach((v) {
        details.add((v));
      });
    }
    courseHours = json['courseHours']??"Null courseHours";
    l = json['L'];
    t = json['T'];
    p = json['P'];
    if (json['prerequisite'] != null) {
      prerequisite = <String>[];
      json['prerequisite'].forEach((v) {
        prerequisite.add((v));
      });
    }

    if (json['majors'] != null) {
      majors = <String>[];
      json['majors'].forEach((v) {
        majors.add((v));
      });
    }
    requirements = json['requirements'];
    iV = json['__v'];
  }


}
