//
//
// class InformationForStudent {
//   bool status;
//   String message;
//   Data data;
//
//   InformationForStudent({this.status, this.message, this.data});
//
//   InformationForStudent.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//
// }
//
// class Data {
//   StudentData studentData;
//
//   List<Registrations> registrations;
//
//   Data({this.studentData, this.registrations});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     studentData = json['studentData'] != null ? new StudentData.fromJson(json['studentData']) : null;
//
//     if (json['registrations'] != null) {
//       registrations = new List<Registrations>();
//       json['registrations'].forEach((v) { registrations.add(new Registrations.fromJson(v)); });
//     }
//   }
//
//
// }
//
// class StudentData {
//   String sId;
//   int ssn;
//   String email;
//   String nationality;
//   Hours hours;
//  // List<String> table;
//   dynamic gPA;
//   bool enroll;
//   bool withdraw;
//
//   StudentData({this.sId, this.ssn, this.email, this.nationality, this.hours,
//      this.gPA, this.enroll, this.withdraw});
//
//   StudentData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id']??"Null id";
//     ssn = json['ssn']??"Null ssn";
//     email = json['email']??"Null email";
//     nationality = json['nationality']??"Null nat";
//     hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
//     //table = json['table'].cast<String>();
//     gPA = json['GPA']??"Null gpa";
//     enroll = json['enroll'];
//     withdraw = json['withdraw'];
//   }
//
//
// }
//
// class Hours {
//   PublicAndUniversity publicAndUniversity;
//   PublicAndUniversity college;
//   PublicAndUniversity specialty;
//   PublicAndUniversity graduationProject;
//   int unknown;
//   int fail;
//   int register;
//   int max;
//   int maxSemester;
//   int min;
//   int minSemester;
//   int maxSummer;
//
//   Hours({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.unknown, this.fail, this.register, this.max, this.maxSemester, this.min, this.minSemester, this.maxSummer});
//
//   Hours.fromJson(Map<String, dynamic> json) {
//     publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
//     college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
//     specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
//     graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
//     unknown = json['unknown'];
//     fail = json['fail'];
//     register = json['register'];
//     max = json['max'];
//     maxSemester = json['maxSemester'];
//     min = json['min'];
//     minSemester = json['minSemester'];
//     maxSummer = json['maxSummer'];
//   }
//
//
// }
//
// class PublicAndUniversity {
//   int mandatory;
//   int optional;
//
//   PublicAndUniversity({this.mandatory, this.optional});
//
//   PublicAndUniversity.fromJson(Map<String, dynamic> json) {
//     mandatory = json['mandatory'];
//     optional = json['optional'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mandatory'] = this.mandatory;
//     data['optional'] = this.optional;
//     return data;
//   }
// }
//
//
//
// class Registrations {
//   String sId;
//   String state;
//   Course course;
//
//   Registrations({this.sId, this.state, this.course});
//
//   Registrations.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     state = json['state'];
//     course = json['course'] != null ? new Course.fromJson(json['course']) : null;
//   }
//
//
// }
//
// class Course {
//   String sId;
//   String arabicName;
//   String englishName;
//   String courseCode;
//   int finalDegree;
//   int yearWorkDegree;
//   String status;
//   List<String> details;
//   int courseHours;
//   int l;
//   int t;
//   int p;
//   List<String> prerequisite;
//   List<String> majors;
//   String requirements;
//   int iV;
//
//   Course({this.sId, this.arabicName, this.englishName, this.courseCode, this.finalDegree, this.yearWorkDegree, this.status, this.details, this.courseHours, this.l, this.t, this.p, this.prerequisite, this.majors, this.requirements, this.iV});
//
//   Course.fromJson(Map<String, dynamic> json) {
//     sId = json['_id']??"Null id";
//     arabicName = json['arabicName']??"Null arName";
//     englishName = json['englishName']??"Null enName";
//     courseCode = json['courseCode']??"Null courseCode";
//     finalDegree = json['finalDegree']??"Null fD";
//     yearWorkDegree = json['yearWorkDegree']??"Null yW";
//     status = json['status']??"Null status";
//         if (json['details'] != null) {
//           details = <String>[];
//       json['details'].forEach((v) {
//         details.add((v));
//       });
//     }
//
//     courseHours = json['courseHours']??"Null courseH";
//     l = json['L'];
//     t = json['T'];
//     p = json['P'];
//     prerequisite = json['prerequisite'].cast<String>();
//     majors = json['majors'].cast<String>();
//     requirements = json['requirements'];
//     iV = json['__v'];
//   }
//
//
// }
//
// class Hours1 {
//   PublicAndUniversity publicAndUniversity;
//   PublicAndUniversity college;
//   PublicAndUniversity specialty;
//   PublicAndUniversity graduationProject;
//   int unknown;
//   int fail;
//   int register;
//   int max;
//   int maxSemester;
//   int min;
//   int minSemester;
//   int maxSummer;
//
//   Hours1({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.unknown, this.fail, this.register, this.max, this.maxSemester, this.min, this.minSemester, this.maxSummer});
//
//   Hours1.fromJson(Map<String, dynamic> json) {
//     publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
//     college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
//     specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
//     graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
//     unknown = json['unknown'];
//     fail = json['fail'];
//     register = json['register'];
//     max = json['max'];
//     maxSemester = json['maxSemester'];
//     min = json['min'];
//     minSemester = json['minSemester'];
//     maxSummer = json['maxSummer'];
//   }
//
//
// }

////////////////////

class InformationForStudent {
  bool status;
  String message;
  Data data;

  InformationForStudent({this.status, this.message, this.data});

  InformationForStudent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  StudentData studentData;

  List<Registrations> registrations;

  Data({this.studentData,  this.registrations});

  Data.fromJson(Map<String, dynamic> json) {
    studentData = json['studentData'] != null ? new StudentData.fromJson(json['studentData']) : null;

    if (json['registrations'] != null) {
      registrations = new List<Registrations>();
      json['registrations'].forEach((v) { registrations.add(new Registrations.fromJson(v)); });
    }
  }


}

class StudentData {
  String sId;
  int ssn;
  String email;
  String englishName;
  String nationality;
  Hours hours;
  //List<String> table;
  double gPA;
  bool enroll;
  bool withdraw;

  StudentData({this.sId, this.ssn, this.email, this.nationality, this.hours,  this.gPA, this.enroll, this.withdraw});

  StudentData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ssn = json['ssn'];
    email = json['email'];
    englishName = json['englishName']??"Null EName";
    nationality = json['nationality'];
    hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
    //table = json['table'].cast<String>();
    gPA = json['GPA'];
    enroll = json['enroll'];
    withdraw = json['withdraw'];
  }


}

class Hours {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  int unknown;
  int fail;
  int register;
  int max;
  int maxSemester;
  int min;
  int minSemester;
  int maxSummer;

  Hours({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.unknown, this.fail, this.register, this.max, this.maxSemester, this.min, this.minSemester, this.maxSummer});

  Hours.fromJson(Map<String, dynamic> json) {
    publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
    college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
    specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
    graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
    unknown = json['unknown'];
    fail = json['fail'];
    register = json['register'];
    max = json['max'];
    maxSemester = json['maxSemester'];
    min = json['min'];
    minSemester = json['minSemester'];
    maxSummer = json['maxSummer'];
  }


}

class PublicAndUniversity {
  int mandatory;
  int optional;

  PublicAndUniversity({this.mandatory, this.optional});

  PublicAndUniversity.fromJson(Map<String, dynamic> json) {
    mandatory = json['mandatory'];
    optional = json['optional'];
  }


}



class Registrations {
  String sId;
  CourseId courseId;
  String groupId;
  String advisorId;
  String studentId;
  String semester;
  int academicYear;
  String state;
  String comment;
  String startTime;
  String endTime;
  int iV;

  Registrations({this.sId, this.courseId, this.groupId, this.advisorId, this.studentId, this.semester, this.academicYear, this.state, this.comment, this.startTime, this.endTime, this.iV});

  Registrations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseId = json['courseId'] != null ? new CourseId.fromJson(json['courseId']) : null;
    groupId = json['groupId'];
    advisorId = json['advisorId'];
    studentId = json['studentId'];
    semester = json['semester'];
    academicYear = json['academicYear'];
    state = json['state'];
    comment = json['comment'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    iV = json['__v'];
  }


}

class CourseId {
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

  CourseId({this.sId, this.arabicName, this.englishName, this.courseCode, this.finalDegree, this.yearWorkDegree, this.status, this.details, this.courseHours, this.l, this.t, this.p, this.prerequisite, this.majors, this.requirements, this.iV});

  CourseId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    arabicName = json['arabicName'];
    englishName = json['englishName'];
    courseCode = json['courseCode'];
    finalDegree = json['finalDegree'];
    yearWorkDegree = json['yearWorkDegree'];
    status = json['status'];

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
    prerequisite = json['prerequisite'].cast<String>();
    majors = json['majors'].cast<String>();
    requirements = json['requirements'];
    iV = json['__v'];
  }


}

class Hours1 {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  int unknown;
  int fail;
  int register;
  int max;
  int maxSemester;
  int min;
  int minSemester;
  int maxSummer;

  Hours1({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.unknown, this.fail, this.register, this.max, this.maxSemester, this.min, this.minSemester, this.maxSummer});

  Hours1.fromJson(Map<String, dynamic> json) {
    publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
    college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
    specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
    graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
    unknown = json['unknown'];
    fail = json['fail'];
    register = json['register'];
    max = json['max'];
    maxSemester = json['maxSemester'];
    min = json['min'];
    minSemester = json['minSemester'];
    maxSummer = json['maxSummer'];
  }


}
