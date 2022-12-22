class GetMajorModel {
  bool status;
  String message;
  List<GetMajorData> data;

  GetMajorModel({this.status, this.message, this.data});

  GetMajorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<GetMajorData>();
      json['data'].forEach((v) {
        data.add(new GetMajorData.fromJson(v));
      });
    }
  }


}

class GetMajorData {
  String sId;
  String name;
  int id;

  GetMajorData({this.sId, this.name, this.id});

  GetMajorData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    id = json['id'];
  }


}
