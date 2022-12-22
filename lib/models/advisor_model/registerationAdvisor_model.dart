/*
class RegisterationAdvisorModel {
  bool status;
  String message;
  RegisterationAdvisorData data;



  RegisterationAdvisorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new RegisterationAdvisorData.fromJson(json['data']) : null;
  }


}

class RegisterationAdvisorData {
  StudentData1 studentData;
  List<List> table;
  List<Registrations1> registrations;



  RegisterationAdvisorData.fromJson(Map<String, dynamic> json) {
    studentData = json['studentData'] != null ? new StudentData1.fromJson(json['studentData']) : null;
    if (json['table'] != null) {
      table = <List>[];
      json['table'].forEach((v) {
        table.add((v));
      });
    }
    if (json['registrations'] != null) {
      registrations = new List<Registrations1>();
      json['registrations'].forEach((v) { registrations.add(new Registrations1.fromJson(v)); });
    }
  }


}

class StudentData1 {
  String sId;
  int ssn;
  String email;
  String name;
  String nationality;
  HoursStudentData hours;
  int gPA;
  List<String> table;

  StudentData1({this.sId, this.ssn, this.email, this.name, this.nationality, this.hours, this.gPA, this.table});

  StudentData1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ssn = json['ssn'];
    email = json['email'];
    name = json['name'];
    nationality = json['nationality'];
    hours = json['hours'] != null ? new HoursStudentData.fromJson(json['hours']) : null;
    gPA = json['GPA'];
    table = json['table'].cast<String>();
  }


}

class HoursStudentData {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  PublicAndUniversity recorded;
  PublicAndUniversity requested;
  PublicAndUniversity max;
  PublicAndUniversity min;

  HoursStudentData({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.recorded, this.requested, this.max, this.min});

  HoursStudentData.fromJson(Map<String, dynamic> json) {
    publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
    college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
    specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
    graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
    recorded = json['recorded'] != null ? new PublicAndUniversity.fromJson(json['recorded']) : null;
    requested = json['requested'] != null ? new PublicAndUniversity.fromJson(json['requested']) : null;
    max = json['max'] != null ? new PublicAndUniversity.fromJson(json['max']) : null;
    min = json['min'] != null ? new PublicAndUniversity.fromJson(json['min']) : null;
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

class Table {




Table.fromJson(Map<String, dynamic> json) {
}


}

class Registrations1 {
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


  Registrations1.fromJson(Map<String, dynamic> json) {
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

class Hours {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  PublicAndUniversity recorded;
  PublicAndUniversity requested;
  PublicAndUniversity max;
  PublicAndUniversity min;

  Hours({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.recorded, this.requested, this.max, this.min});

  Hours.fromJson(Map<String, dynamic> json) {
    publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
    college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
    specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
    graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
    recorded = json['recorded'] != null ? new PublicAndUniversity.fromJson(json['recorded']) : null;
    requested = json['requested'] != null ? new PublicAndUniversity.fromJson(json['requested']) : null;
    max = json['max'] != null ? new PublicAndUniversity.fromJson(json['max']) : null;
    min = json['min'] != null ? new PublicAndUniversity.fromJson(json['min']) : null;
  }


}
*/



/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
// class RegisterationAdvisorModel {
//   bool status;
//   String message;
//   RegisterationAdvisorData data;
//
//
//
//   RegisterationAdvisorModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new RegisterationAdvisorData.fromJson(json['data']) : null;
//   }
//
//
// }
//
// class RegisterationAdvisorData {
//   StudentData1 studentData;
//   List<List> table;
//   List<Registrations1> registrations;
//
//   RegisterationAdvisorData({this.studentData, this.table, this.registrations});
//
//   RegisterationAdvisorData.fromJson(Map<String, dynamic> json) {
//     studentData = json['studentData'] != null ? new StudentData1.fromJson(json['studentData']) : null;
//     if (json['table'] != null) {
//       table = <List>[];
//       json['table'].forEach((v) {
//         table.add((v));
//       });
//     }
//
//     if (json['registrations'] != null) {
//       registrations = new List<Registrations1>();
//       json['registrations'].forEach((v) { registrations.add(new Registrations1.fromJson(v)); });
//     }
//   }
//
//
// }
//
// class StudentData1 {
//   String sId;
//   int ssn;
//   String email;
//   String name;
//   String nationality;
//   Hours hours;
//   int gPA;
//   List<String> table;
//   bool enroll;
//   bool withdraw;
//
//   StudentData1({this.sId, this.ssn, this.email, this.name, this.nationality, this.hours, this.gPA, this.table, this.enroll, this.withdraw});
//
//   StudentData1.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     ssn = json['ssn'];
//     email = json['email'];
//     name = json['name'];
//     nationality = json['nationality'];
//     hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
//     gPA = json['GPA'];
//     table = json['table'].cast<String>();
//     enroll = json['enroll'];
//     withdraw = json['withdraw'];
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
//   PublicAndUniversity recorded;
//   PublicAndUniversity requested;
//   PublicAndUniversity max;
//   PublicAndUniversity min;
//
//   Hours1({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.recorded, this.requested, this.max, this.min});
//
//   Hours1.fromJson(Map<String, dynamic> json) {
//     publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
//     college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
//     specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
//     graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
//     recorded = json['recorded'] != null ? new PublicAndUniversity.fromJson(json['recorded']) : null;
//     requested = json['requested'] != null ? new PublicAndUniversity.fromJson(json['requested']) : null;
//     max = json['max'] != null ? new PublicAndUniversity.fromJson(json['max']) : null;
//     min = json['min'] != null ? new PublicAndUniversity.fromJson(json['min']) : null;
//   }
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
//
// class Table {
//
//
//
//
// Table.fromJson(Map<String, dynamic> json) {
// }
//
//
// }
//
// class Registrations1 {
//   String sId;
//   String state;
//   Course course;
//
//   Registrations1({this.sId, this.state, this.course});
//
//   Registrations1.fromJson(Map<String, dynamic> json) {
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
//   String couseCode;
//   int finalDegree;
//   int yearWorkDegree;
//   bool mandatory;
//   int courseHours;
//   List<String> prerequisite;
//   List<String> majors;
//   String requirements;
//   int iV;
//
//   Course({this.sId, this.arabicName, this.englishName, this.couseCode, this.finalDegree, this.yearWorkDegree, this.mandatory, this.courseHours, this.prerequisite, this.majors, this.requirements, this.iV});
//
//   Course.fromJson(Map<String, dynamic> json) {
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
//   PublicAndUniversity recorded;
//   PublicAndUniversity requested;
//   PublicAndUniversity max;
//   PublicAndUniversity min;
//
//   Hours({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.recorded, this.requested, this.max, this.min});
//
//   Hours.fromJson(Map<String, dynamic> json) {
//     publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
//     college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
//     specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
//     graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
//     recorded = json['recorded'] != null ? new PublicAndUniversity.fromJson(json['recorded']) : null;
//     requested = json['requested'] != null ? new PublicAndUniversity.fromJson(json['requested']) : null;
//     max = json['max'] != null ? new PublicAndUniversity.fromJson(json['max']) : null;
//     min = json['min'] != null ? new PublicAndUniversity.fromJson(json['min']) : null;
//   }
//
//
// }

/////////////////////////////////////////////
//////////////////////////////////////////////

class RegisterationAdvisorModel {
  bool status;
  String message;
  RegisterationAdvisorData data;

  RegisterationAdvisorModel({this.status, this.message, this.data});

  RegisterationAdvisorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new RegisterationAdvisorData.fromJson(json['data']) : null;
  }


}

class RegisterationAdvisorData {
  StudentData1 studentData;
  List<List> table;
  List<Registrations1> registrations;

  RegisterationAdvisorData({this.studentData, this.table, this.registrations});

  RegisterationAdvisorData.fromJson(Map<String, dynamic> json) {
    studentData = json['studentData'] != null ? new StudentData1.fromJson(json['studentData']) : null;
        if (json['table'] != null) {
      table = <List>[];
      json['table'].forEach((v) {
        table.add((v));
      });
    }

    if (json['registrations'] != null) {
      registrations = new List<Registrations1>();
      json['registrations'].forEach((v) { registrations.add(new Registrations1.fromJson(v)); });
    }
  }

  }





class StudentData1 {
  String sId;
  int ssn;
  String email;
  String name;
  String nationality;
  Hours1 hours;
  dynamic gPA;
  List<String> table;
  bool enroll;
  bool withdraw;

  StudentData1({this.sId, this.ssn, this.email, this.name, this.nationality, this.hours, this.gPA, this.table, this.enroll, this.withdraw});

  StudentData1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ssn = json['ssn'];
    email = json['email'];
    name = json['name'];
    nationality = json['nationality'];
    hours = json['hours'] != null ? new Hours1.fromJson(json['hours']) : null;
    gPA = json['GPA'];
    table = json['table'].cast<String>();
    enroll = json['enroll'];
    withdraw = json['withdraw'];
  }


}

class Hours1 {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  int register;
  int max;
  int min;

  Hours1({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.register, this.max, this.min});

  Hours1.fromJson(Map<String, dynamic> json) {
    publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
    college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
    specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
    graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
    register = json['register'];
    max = json['max'];
    min = json['min'];
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

class Table {




Table.fromJson(Map<String, dynamic> json) {
}


}
class Registrations1 {
  String sId;
  String state;
  Course course;
  String comment;
  Registrations1({this.sId, this.state, this.course});

  Registrations1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    comment = json['comment'];
    course = json['course'] != null ? new Course.fromJson(json['course']) : null;
  }


}
class Course {
  String sId;
  String arabicName;
  String englishName;
  String couseCode;
  int finalDegree;
  int yearWorkDegree;
  bool mandatory;
  int courseHours;
  List<String> prerequisite;
  List<String> majors;
  String requirements;
  int iV;

  Course({this.sId, this.arabicName, this.englishName, this.couseCode, this.finalDegree, this.yearWorkDegree, this.mandatory, this.courseHours, this.prerequisite, this.majors, this.requirements, this.iV});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    arabicName = json['arabicName'];
    englishName = json['englishName'];
    couseCode = json['couseCode'];
    finalDegree = json['finalDegree'];
    yearWorkDegree = json['yearWorkDegree'];
    mandatory = json['mandatory'];
    courseHours = json['courseHours'];
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



class Hours {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  int register;
  int max;
  int min;

  Hours({this.publicAndUniversity, this.college, this.specialty, this.graduationProject, this.register, this.max, this.min});

  Hours.fromJson(Map<String, dynamic> json) {
    publicAndUniversity = json['publicAndUniversity'] != null ? new PublicAndUniversity.fromJson(json['publicAndUniversity']) : null;
    college = json['college'] != null ? new PublicAndUniversity.fromJson(json['college']) : null;
    specialty = json['specialty'] != null ? new PublicAndUniversity.fromJson(json['specialty']) : null;
    graduationProject = json['graduationProject'] != null ? new PublicAndUniversity.fromJson(json['graduationProject']) : null;
    register = json['register'];
    max = json['max'];
    min = json['min'];
  }


}


