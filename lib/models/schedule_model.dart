class ScheduleModel
{
  bool status;
  String massage;


  ScheduleModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    massage=json['message'];

  }
}