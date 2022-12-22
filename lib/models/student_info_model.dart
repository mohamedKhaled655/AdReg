


class StudentInfoModel {
  bool status;
  String message;
  StudentInfoData data;

  StudentInfoModel({this.status, this.message, this.data});

  StudentInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new StudentInfoData.fromJson(json['data']) : null;
  }


}

class StudentInfoData {
  String englishName;
  String arabicName;
  int ssn;
  int id;
  String address;
  String phone;
  String birthday;
  String joiningDay;
  String nationality;
  Hours hours;
  dynamic gPA;
  String email;
  String role;
  String advisor;
  int totelHours;
  int passedHours;
  int leftHours;
  String major;



  StudentInfoData.fromJson(Map<String, dynamic> json) {
    englishName = json['englishName']??"Null EName";
    arabicName = json['arabicName']??"Null ArName";
    ssn = json['ssn']??"Null ssn";
    id = json['id']??"Null id";
    address = json['address']??"Null address";
    phone = json['phone']??"Null phone";
    birthday = json['birthday']??"Null birthday";
    joiningDay = json['joiningDay']??"Null jDay";
    nationality = json['nationality']??"Null Nat";
    hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
    gPA = json['GPA']??"Null GpA";
    email = json['email']??"Null email";
    role = json['role']??"Null role";
    advisor = json['advisor']??"Null adv";
    totelHours = json['totelHours']??"Null totalH";
    passedHours = json['passedHours']??"Null passedH";
    leftHours = json['leftHours']??"Null lH";
    major = json['major']??"Null major";
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
  int maxSemester;
  int maxSummer;
  int minSemester;
  int unknown;
  int fail;



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
    register = json['register']??"Null regster";
    max = json['max']??"Null max";
    min = json['min']??"Null min";
    maxSemester = json['maxSemester']??"Null maxS";
    maxSummer = json['maxSummer']??"Null maxSummer";
    minSemester = json['minSemester']??"Null mS";
    unknown = json['unknown']??"Null ";
    fail = json['fail']??"Null fail";
  }


}

class PublicAndUniversity {
  int mandatory;
  int optional;

  PublicAndUniversity({this.mandatory, this.optional});

  PublicAndUniversity.fromJson(Map<String, dynamic> json) {
    mandatory = json['mandatory']??"Null mandatory";
    optional = json['optional']??"Null optional";
  }


}
