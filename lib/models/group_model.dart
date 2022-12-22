//
//
//
// class GroupModel {
//   bool status;
//   String message;
//   List<GroupData> data;
//
//   GroupModel({this.status, this.message, this.data});
//
//   GroupModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//         if (json['data'] != null) {
//       data = new List<GroupData>();
//       json['data'].forEach((v) {
//         data.add(new GroupData.fromJson(v));
//       });
//     }
//     else{
//
//     }
//   }
//   }
//
//
//
//
// class GroupData {
//   String sId;
//   String name;
//   int capacity;
//   int usedCapacity;
//   String courseCode;
//   String courseName;
//   Lecture lecture;
//   Lecture section;
//   Lecture lab;
//   bool inLab;
//   bool inSection;
//   bool open;
//   int iV;
//
//   GroupData(
//       {this.sId,
//         this.name,
//         this.capacity,
//         this.usedCapacity,
//         this.courseCode,
//         this.courseName,
//         this.lecture,
//         this.section,
//         this.lab,
//         this.inLab,
//         this.inSection,
//         this.open,
//         this.iV});
//
//   GroupData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id']??"Null id";
//     name = json['name']??"Null name";
//     capacity = json['capacity']??"Null capacity";
//     usedCapacity = json['usedCapacity'];
//     courseCode = json['courseCode']??"Null CourseCode";
//     courseName = json['courseName']??"Null courseName";
//     lecture =
//     json['lecture'] != null ? new Lecture.fromJson(json['lecture']) : null;
//     section =
//     json['section'] != null ? new Lecture.fromJson(json['section']) : null;
//     lab = json['lab'] != null ? new Lecture.fromJson(json['lab']) : null;
//     inLab = json['inLab'];
//     inSection = json['inSection'];
//     open = json['open'];
//     iV = json['__v'];
//   }
//
//
// }
//
// class Lecture {
//   String instructorId;
//   String instructorName;
//   String roomNumber;
//   String day;
//   int start;
//   int end;
//
//
//
//   Lecture.fromJson(Map<String, dynamic> json) {
//     instructorId = json['instructorId']??"Null instrId";
//     instructorName = json['instructorName']??"InstructorName";
//     roomNumber = json['roomNumber']??"Null roomN";
//     day = json['day']??"Null day";
//     start = json['start']??"Null start";
//     end = json['end']??"Null end";
//   }
//
//
// }
////////////////

class GroupModel {
  bool status;
  String message;
  List<GroupData> data;

  GroupModel({this.status, this.message, this.data});

  GroupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<GroupData>();
      json['data'].forEach((v) {
        data.add(new GroupData.fromJson(v));
      });
    }
  }


}

class GroupData {
  String sId;
  String name;
  int capacity;
  int usedCapacity;
  Lecture lecture;
  Lecture section;
  Lecture lab;
  bool inLab;
  bool inSection;
  bool open;
  int iV;
  String courseId;

  GroupData(
      {this.sId,
        this.name,
        this.capacity,
        this.usedCapacity,
        this.lecture,
        this.section,
        this.inLab,
        this.inSection,
        this.open,
        this.iV,
        this.courseId});

  GroupData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    capacity = json['capacity'];
    usedCapacity = json['usedCapacity'];
    lecture =
    json['lecture'] != null ? new Lecture.fromJson(json['lecture']) : null;
    section = json['section'] != null ? new Lecture.fromJson(json['section']) : null;
    lab = json['lab'] != null ? new Lecture.fromJson(json['lab']) : null;
    inLab = json['inLab'];
    inSection = json['inSection'];
    open = json['open'];
    iV = json['__v'];
    courseId = json['courseId'];
  }


}

class Lecture {
  InstructorId instructorId;
  String roomNumber;
  String day;
  int start;
  int end;

  Lecture({this.instructorId, this.roomNumber, this.day, this.start, this.end});

  Lecture.fromJson(Map<String, dynamic> json) {
    instructorId = json['instructorId'] != null
        ? new InstructorId.fromJson(json['instructorId'])
        : null;
    roomNumber = json['roomNumber'];
    day = json['day'];
    start = json['start'];
    end = json['end'];
  }


}

class InstructorId {
  String sId;
  String arabicName;
  String englishName;

  InstructorId({this.sId, this.arabicName, this.englishName});

  InstructorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    arabicName = json['arabicName'];
    englishName = json['englishName'];
  }


}