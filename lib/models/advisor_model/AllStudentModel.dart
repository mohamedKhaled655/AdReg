//
//
//
//
// class AllStudentForAdvisorModel {
//   bool status;
//   String message;
//   List<AllStudentForAdvisorData> data;
//
//   AllStudentForAdvisorModel({this.status, this.message, this.data});
//
//   AllStudentForAdvisorModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = new List<AllStudentForAdvisorData>();
//       json['data'].forEach((v) {
//         data.add(new AllStudentForAdvisorData.fromJson(v));
//       });
//     }
//   }
//
//
// }
//
// class AllStudentForAdvisorData {
//   String sId;
//   String userName;
//   String password;
//   int ssn;
//   String email;
//   String name;
//   String nationality;
//   Hours hours;
//   String advisorId;
//   String majorId;
//   List<String> registerForm;
//   List<String> recordedCourses;
//   String role;
//   int iV;
//   List<String> table;
//   dynamic gPA;
//   bool enroll;
//   bool withdraw;
//   String syllabusId;
//   String currentSemester;
//   int currentAcademicYear;
//
//   AllStudentForAdvisorData(
//       {this.sId,
//         this.userName,
//         this.password,
//         this.ssn,
//         this.email,
//         this.name,
//         this.nationality,
//         this.hours,
//         this.advisorId,
//         this.majorId,
//         this.registerForm,
//         this.recordedCourses,
//         this.role,
//         this.iV,
//         this.table,
//         this.gPA,
//         this.enroll,
//         this.withdraw,
//         this.syllabusId,
//         this.currentSemester,
//         this.currentAcademicYear});
//
//   AllStudentForAdvisorData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     userName = json['userName'];
//     password = json['password'];
//     ssn = json['ssn'];
//     email = json['email'];
//     name = json['name'];
//     nationality = json['nationality'];
//     hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
//     advisorId = json['advisorId'];
//     majorId = json['majorId'];
//     if (json['registerForm'] != null) {
//       registerForm = <String>[];
//       json['registerForm'].forEach((v) {
//         registerForm.add((v));
//       });
//     }
//
//     if (json['recordedCourses'] != null) {
//       recordedCourses = <String>[];
//       json['recordedCourses'].forEach((v) {
//         recordedCourses.add((v));
//       });
//     }
//
//     role = json['role'];
//     iV = json['__v'];
//     table = json['table'].cast<String>();
//     gPA = json['GPA'];
//     enroll = json['enroll'];
//     withdraw = json['withdraw'];
//     syllabusId = json['syllabusId'];
//     currentSemester = json['currentSemester'];
//     currentAcademicYear = json['currentAcademicYear'];
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
//   int register;
//   int max;
//   int min;
//   int maxSemester;
//   int maxSummer;
//   int minSemester;
//   PublicAndUniversity recorded;
//   PublicAndUniversity requested;
//
//   Hours(
//       {this.publicAndUniversity,
//         this.college,
//         this.specialty,
//         this.graduationProject,
//         this.register,
//         this.max,
//         this.min,
//         this.maxSemester,
//         this.maxSummer,
//         this.minSemester,
//         this.recorded,
//         this.requested});
//
//   Hours.fromJson(Map<String, dynamic> json) {
//     publicAndUniversity = json['publicAndUniversity'] != null
//         ? new PublicAndUniversity.fromJson(json['publicAndUniversity'])
//         : null;
//     college = json['college'] != null
//         ? new PublicAndUniversity.fromJson(json['college'])
//         : null;
//     specialty = json['specialty'] != null
//         ? new PublicAndUniversity.fromJson(json['specialty'])
//         : null;
//     graduationProject = json['graduationProject'] != null
//         ? new PublicAndUniversity.fromJson(json['graduationProject'])
//         : null;
//     register = json['register'];
//     max = json['max'];
//     min = json['min'];
//     maxSemester = json['maxSemester'];
//     maxSummer = json['maxSummer'];
//     minSemester = json['minSemester'];
//     recorded = json['recorded'] != null
//         ? new PublicAndUniversity.fromJson(json['recorded'])
//         : null;
//     requested = json['requested'] != null
//         ? new PublicAndUniversity.fromJson(json['requested'])
//         : null;
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
//
// }

////////////////

class AllStudentForAdvisorModel {
  bool status;
  String message;
  List<AllStudentForAdvisorData> data;

  AllStudentForAdvisorModel({this.status, this.message, this.data});

  AllStudentForAdvisorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<AllStudentForAdvisorData>();
      json['data'].forEach((v) {
        data.add(new AllStudentForAdvisorData.fromJson(v));
      });
    }
  }


}

class AllStudentForAdvisorData {
  String sId;
  String userName;
  String password;
  dynamic ssn;
  String email;
  String name;
  String nationality;
  Hours hours;
  String advisorId;
  String majorId;
  List<String> registerForm;
  List<RecordedCourses> recordedCourses;
  String role;
  int iV;
  dynamic gPA;
  List<String> table;
  bool enroll;
  bool withdraw;
  String syllabusId;
  dynamic id;
  bool changeMajor;



  AllStudentForAdvisorData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    password = json['password'];
    ssn = json['ssn'];
    email = json['email'];
    name = json['name'];
    nationality = json['nationality'];
    hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
    advisorId = json['advisorId'];
    majorId = json['majorId'];
    registerForm = json['registerForm'].cast<String>();
    if (json['recordedCourses'] != null) {
      recordedCourses = new List<RecordedCourses>();
      json['recordedCourses'].forEach((v) {
        recordedCourses.add(new RecordedCourses.fromJson(v));
      });
    }
    role = json['role'];
    iV = json['__v'];
    gPA = json['GPA'];
    table = json['table'].cast<String>();
    enroll = json['enroll'];
    withdraw = json['withdraw'];
    syllabusId = json['syllabusId'];
    id = json['id'];
    changeMajor = json['changeMajor'];
  }


}

class Hours {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  dynamic register;
  dynamic max;
  dynamic min;
  dynamic maxSemester;
  dynamic maxSummer;
  dynamic minSemester;
  dynamic unknown;
  dynamic fail;



  Hours.fromJson(Map<String, dynamic> json) {
    publicAndUniversity = json['publicAndUniversity'] != null
        ? new PublicAndUniversity.fromJson(json['publicAndUniversity'])
        : null;
    college = json['college'] != null
        ? new PublicAndUniversity.fromJson(json['college'])
        : null;
    specialty = json['specialty'] != null
        ? new PublicAndUniversity.fromJson(json['specialty'])
        : null;
    graduationProject = json['graduationProject'] != null
        ? new PublicAndUniversity.fromJson(json['graduationProject'])
        : null;
    register = json['register'];
    max = json['max'];
    min = json['min'];
    maxSemester = json['maxSemester'];
    maxSummer = json['maxSummer'];
    minSemester = json['minSemester'];
    unknown = json['unknown'];
    fail = json['fail'];
  }


}

class PublicAndUniversity {
  dynamic mandatory;
  dynamic optional;

  PublicAndUniversity({this.mandatory, this.optional});

  PublicAndUniversity.fromJson(Map<String, dynamic> json) {
    mandatory = json['mandatory'];
    optional = json['optional'];
  }


}

class RecordedCourses {
  String courseCode;
  String status;
  dynamic finalDegree;
  dynamic yearWorkDegree;
  dynamic gPA;



  RecordedCourses.fromJson(Map<String, dynamic> json) {
    courseCode = json['courseCode'];
    status = json['status'];
    finalDegree = json['finalDegree'];
    yearWorkDegree = json['yearWorkDegree'];
    gPA = json['GPA'];
  }


}
