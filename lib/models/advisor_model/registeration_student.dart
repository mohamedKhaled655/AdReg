class RegisterationStudent {
  bool status;
  String message;
  Data data;



  RegisterationStudent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  Student student;
  List<Registration> registration;



  Data.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    if (json['registration'] != null) {
      registration = new List<Registration>();
      json['registration'].forEach((v) {
        registration.add(new Registration.fromJson(v));
      });
    }
  }


}

class Student {
  String sId;
  String userName;
  String password;
  int ssn;
  String email;
  String name;
  String nationality;
  Hours hours;
  String advisorId;
  String majorId;
  List<Null> registerForm;
  List<RecordedCourses> recordedCourses;
  String role;
  int iV;
  List<String> table;
  dynamic gPA;



  Student.fromJson(Map<String, dynamic> json) {
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
    if (json['registerForm'] != null) {
      registerForm = new List<Null>();
      json['registerForm'].forEach((v) {
        //registerForm.add(new Null.fromJson(v));
      });
    }
    if (json['recordedCourses'] != null) {
      recordedCourses = new List<RecordedCourses>();
      json['recordedCourses'].forEach((v) {
        recordedCourses.add(new RecordedCourses.fromJson(v));
      });
    }
    role = json['role'];
    iV = json['__v'];
    table = json['table'].cast<String>();
    gPA = json['GPA'];
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
    recorded = json['recorded'] != null
        ? new PublicAndUniversity.fromJson(json['recorded'])
        : null;
    requested = json['requested'] != null
        ? new PublicAndUniversity.fromJson(json['requested'])
        : null;
    max = json['max'] != null
        ? new PublicAndUniversity.fromJson(json['max'])
        : null;
    min = json['min'] != null
        ? new PublicAndUniversity.fromJson(json['min'])
        : null;
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

class RecordedCourses {
  String courseId;
  String status;
  int finalDegree;
  int workDegree;


  RecordedCourses.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    status = json['status'];
    finalDegree = json['finalDegree'];
    workDegree = json['workDegree'];
  }


}

class Registration {
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



  Registration.fromJson(Map<String, dynamic> json) {
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
