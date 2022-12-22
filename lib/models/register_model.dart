class RegisterModel{
  bool status;
  String massage;
  UserData data;

  RegisterModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    massage=json['message'];
    data=json['userData'] != null? UserData.fromJson(json["userData"]): null;
  }
}

class UserData{
  // int id;
  String userName;
  String password;
  String ssn;
  String email;
  String name;
  String nationality;
  String _id;
  String __v;
  String token;

  UserData.fromJson(Map<String,dynamic>json){
    //id=json['id'];
    userName=json['userName'];
    password=json['password'];
    ssn=json['ssn'];
    email=json['email'];
    name=json['name'];
    nationality=json['nationality'];
    _id=json['_id'];
    __v=json['__v'];



    // email=json['email'];
    //phone=json['phone'];
    //image=json['image'];
    //point=json['point'];
    //credit=json['credit'];
    token=json['token'];
  }
}