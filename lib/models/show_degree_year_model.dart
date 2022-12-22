class ShowDegreeYearsModel {
  bool status;
  String message;
  List<int> data;



  ShowDegreeYearsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    //data = json['data'].cast<int>();

    if (json['data'] != null) {
      data = <int>[];
      json['data'].forEach((v) {
        data.add((v));
      });
    }


  }


}
