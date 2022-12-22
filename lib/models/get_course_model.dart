//
//
// class GetCoursesModel {
//   bool status;
//   String message;
//   List<DataCourse> data;
//
//   GetCoursesModel({this.status, this.message, this.data});
//
//   GetCoursesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = new List<DataCourse>();
//       json['data'].forEach((v) {
//         data.add(new DataCourse.fromJson(v));
//       });
//     }
//   }
//
//
// }
//
// class DataCourse {
//   String sId;
//   String arabicName;
//   String englishName;
//   String couseCode;
//   int finalDegree;
//   int yearWorkDegree;
//   bool mandatory;
//   int courseHours;
//   int l;
//   int t;
//   int p;
//   List<String> prerequisite;
//   List<String> majors;
//   String requirements;
//   int iV;
//
//
//
//   DataCourse.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     arabicName = json['arabicName'];
//     englishName = json['englishName'];
//     couseCode = json['couseCode'];
//     finalDegree = json['finalDegree'];
//     yearWorkDegree = json['yearWorkDegree'];
//     mandatory = json['mandatory'];
//     courseHours = json['courseHours'];
//     l = json['L'];
//     t = json['T'];
//     p = json['P'];
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
//   }
//
//
// }


////////////////////////
class GetCoursesModel {
  bool status;
  String message;
  List<DataCourse> data;

  GetCoursesModel({this.status, this.message, this.data});

  GetCoursesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<DataCourse>();
      json['data'].forEach((v) {
        data.add(new DataCourse.fromJson(v));
      });
    }
  }


}

class DataCourse {
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

  DataCourse(
      {this.sId,
        this.arabicName,
        this.englishName,
        this.courseCode,
        this.finalDegree,
        this.yearWorkDegree,
        this.status,
        this.details,
        this.courseHours,
        this.l,
        this.t,
        this.p,
        this.prerequisite,
        this.majors,
        this.requirements,
        this.iV});

  DataCourse.fromJson(Map<String, dynamic> json) {
    sId = json['_id']??"Null id";
    arabicName = json['arabicName']??"Null arName";
    englishName = json['englishName']??"Null engName";
    courseCode = json['courseCode']??"Null courseCode";
    finalDegree = json['finalDegree']??"Null fDegree";
    yearWorkDegree = json['yearWorkDegree']??"Null yWork";
    status = json['status']??"Null status";
    if (json['details'] != null) {
      details = <String>[];
      json['details'].forEach((v) {
        details.add((v));
      });
    }
    courseHours = json['courseHours'];
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

