// class LoginModel{
//   bool status;
//   String massage;
//   UserData data;
//
//   LoginModel.fromJson(Map<String,dynamic>json){
//     status=json['status'];
//     massage=json['message'];
//     data=json['data'] != null? UserData.fromJson(json["data"]): null;
//   }
// }
//
// class UserData{
//  // int id;
//   String name;
//
//
//   String token;
//   String role;
//
//
//   UserData.fromJson(Map<String,dynamic>json){
//     //id=json['id'];
//     name=json['name'];
//
//     token=json['token'];
//     role=json['role'];
//
//
//   }
// }

//////
class LoginModel {
  bool status;
  String message;
  UserData data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }


}

class UserData {
  String role;
  bool enroll;
  bool withdraw;
  String token;

  UserData({this.role, this.enroll, this.withdraw, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    enroll = json['enroll'];
    withdraw = json['withdraw'];
    token = json['token'];
  }


}
