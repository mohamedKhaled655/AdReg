class CheckClashModel {
  bool status;
  String message;
  List<List> data;

  CheckClashModel({this.status, this.message, this.data});

  CheckClashModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = <List>[];
      json['data'].forEach((v) {
        data.add((v));
      });
    }
  }


}

class Data {




Data.fromJson(Map<String, dynamic> json) {
}


}
