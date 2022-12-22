// class UpdateProfileModel {
//   bool status;
//   String message;
//   UpdateProfileData data;
//
//   UpdateProfileModel({this.status, this.message, this.data});
//
//   UpdateProfileModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new UpdateProfileData.fromJson(json['data']) : null;
//   }
//
//
// }
//
// class UpdateProfileData {
//   String sId;
//   String password;
//   int ssn;
//   String email;
//   String name;
//   String nationality;
//   HoursData hours;
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
//   int id;
//   bool changeMajor;
//   String birthday;
//   String joiningDay;
//   String address;
//   String phone;
//   List<String> ambiguity;
//
//
//
//   UpdateProfileData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     password = json['password'];
//     ssn = json['ssn'];
//     email = json['email'];
//     name = json['name'];
//     nationality = json['nationality'];
//     hours = json['hours'] != null ? new HoursData.fromJson(json['hours']) : null;
//     advisorId = json['advisorId'];
//     majorId = json['majorId'];
//    // registerForm = json['registerForm'].cast<String>();
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
//   //  table = json['table'].cast<String>();
//
//     if (json['table'] != null) {
//       table = <String>[];
//       json['table'].forEach((v) {
//         table.add((v));
//       });
//     }
//
//
//     gPA = json['GPA'];
//     enroll = json['enroll'];
//     withdraw = json['withdraw'];
//     syllabusId = json['syllabusId'];
//     id = json['id'];
//     changeMajor = json['changeMajor'];
//     birthday = json['birthday'];
//     joiningDay = json['joiningDay'];
//     address = json['address'];
//     phone = json['phone'];
//
//
//     if (json['ambiguity'] != null) {
//       ambiguity = <String>[];
//       json['ambiguity'].forEach((v) {
//         ambiguity.add((v));
//       });
//     }
//
//   }
//
//
// }
//
// class HoursData {
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
//   int unknown;
//   int fail;
//
//
//   HoursData.fromJson(Map<String, dynamic> json) {
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
//     unknown = json['unknown'];
//     fail = json['fail'];
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


////////////////////
class UpdateProfileModel {
  bool status;
  String message;
  UpdateProfileData data;

  UpdateProfileModel({this.status, this.message, this.data});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UpdateProfileData.fromJson(json['data']) : null;
  }


}

class UpdateProfileData {
  List<String> ambiguity;
  String sId;
  String password;
  int ssn;
  String email;
  String name;
  String nationality;
  HoursData hours;
  String advisorId;
  String majorId;
  List<String> registerForm;
  List<String> recordedCourses;
  String role;
  int iV;
  int gPA;
  List<String> table;
  bool enroll;
  bool withdraw;
  String syllabusId;
  int id;
  bool changeMajor;
  String birthday;
  String joiningDay;
  String address;
  String phone;

  UpdateProfileData(
      {this.ambiguity,
        this.sId,
        this.password,
        this.ssn,
        this.email,
        this.name,
        this.nationality,
        this.hours,
        this.advisorId,
        this.majorId,
        this.registerForm,
        this.recordedCourses,
        this.role,
        this.iV,
        this.gPA,
        this.table,
        this.enroll,
        this.withdraw,
        this.syllabusId,
        this.id,
        this.changeMajor,
        this.birthday,
        this.joiningDay,
        this.address,
        this.phone});

  UpdateProfileData.fromJson(Map<String, dynamic> json) {

    if (json['ambiguity'] != null) {
      ambiguity = <String>[];
      json['ambiguity'].forEach((v) {
        ambiguity.add((v));
      });
    }

    sId = json['_id'];
    password = json['password'];
    ssn = json['ssn'];
    email = json['email'];
    name = json['name'];
    nationality = json['nationality'];
    hours = json['hours'] != null ? new HoursData.fromJson(json['hours']) : null;
    advisorId = json['advisorId'];
    majorId = json['majorId'];

    if (json['registerForm'] != null) {
      registerForm = <String>[];
      json['registerForm'].forEach((v) {
        registerForm.add((v));
      });
    }

    if (json['recordedCourses'] != null) {
      recordedCourses = <String>[];
      json['recordedCourses'].forEach((v) {
        recordedCourses.add((v));
      });
    }

    role = json['role'];
    iV = json['__v'];
    gPA = json['GPA'];


    if (json['table'] != null) {
      table = <String>[];
      json['table'].forEach((v) {
        table.add((v));
      });
    }


    enroll = json['enroll'];
    withdraw = json['withdraw'];
    syllabusId = json['syllabusId'];
    id = json['id'];
    changeMajor = json['changeMajor'];
    birthday = json['birthday'];
    joiningDay = json['joiningDay'];
    address = json['address'];
    phone = json['phone'];
  }


}

class HoursData {
  PublicAndUniversity publicAndUniversity;
  PublicAndUniversity college;
  PublicAndUniversity specialty;
  PublicAndUniversity graduationProject;
  int register;
  int max;
  int min;
  int maxSemester;
  int maxSummer;
  int minSemester;
  int unknown;
  int fail;



  HoursData.fromJson(Map<String, dynamic> json) {
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
  int mandatory;
  int optional;



  PublicAndUniversity.fromJson(Map<String, dynamic> json) {
    mandatory = json['mandatory'];
    optional = json['optional'];
  }


}
