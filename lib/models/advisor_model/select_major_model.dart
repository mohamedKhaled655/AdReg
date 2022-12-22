class SelectMajorModel {
  bool status;
  String message;
  List<SelectMajorData> data;

  SelectMajorModel({this.status, this.message, this.data});

  SelectMajorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<SelectMajorData>();
      json['data'].forEach((v) {
        data.add(new SelectMajorData.fromJson(v));
      });
    }
  }


}

class SelectMajorData {
  String sId;
  String englishName;
  String arabicName;
  int capacity;
  int usedCapacity;
  int iV;
  String syllabusId;



  SelectMajorData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    englishName = json['englishName'];
    arabicName = json['arabicName'];
    capacity = json['capacity'];
    usedCapacity = json['usedCapacity'];
    iV = json['__v'];
    syllabusId = json['syllabusId'];
  }


}
