



import 'package:advising_academy/modeules/home/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/advisor_model/advisor_model.dart';
import '../../../models/advisor_model/get_data_for_advisor.dart';
import '../../../models/check_clash_model.dart';
import '../../../models/delet_course_model.dart';
import '../../../models/get_course_model.dart';
import '../../../models/group_model.dart';
import '../../../models/register_case_model.dart';
import '../../../models/registeration_for_student.dart';
import '../../../models/remove_course_model.dart';
import '../../../models/schedule_model.dart';
import '../../../models/send_withdraw_course_from_student_to_advisor.dart';
import '../../../models/student_info_model.dart';
import '../../../models/student_withdraw_semester.dart';
import '../../../models/submit_register_course_model.dart';
import '../../../models/update_profile_model.dart';
import '../../../models/view_courses_model.dart';
import '../../../models/withdraw_coursesFor_student_model.dart';
import '../../../modeules/home/home_screen.dart';
import '../../../modeules/register_courses/register_course_screen1.dart';
import '../../../modeules/register_courses/register_form_screen.dart';
import '../../../modeules/setting/setting.dart';
import '../../../modeules/view_course_screen.dart';
import '../../../modeules/view_registeration_courses.dart';
import '../../../modeules/withdraw_course_student_screen.dart';
import '../../../shared/component/constains.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';


class StudentInfoCubit extends Cubit<StudentInfoStates>{
  StudentInfoCubit() : super(StudentInfoCubitInitialState());



  static StudentInfoCubit get(context)=>BlocProvider.of(context);





  StudentInfoModel studentInfoModel;

  void GetStudentInfo()
  {
    emit(StudentInfoLoadingHomeDataState());
    DioHelper.getData(
      url: USERDATA,
      token: token,
    ).then((value) {

      studentInfoModel=StudentInfoModel.fromJson(value.data);
      print(studentInfoModel.status);
      print(studentInfoModel.message);


      emit(StudentInfoSuccessHomeDataState());
    }).catchError((error){
      emit(StudentInfoErrorHomeDataState());
      print(error.toString());
    });
  }



  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var addressController=TextEditingController();
  var ssnController=TextEditingController();
  var nationalityController=TextEditingController();
  var passwordController=TextEditingController();



void reloadProfileData(){
  GetStudentInfo();
  emit(ReloadUpdateProfileState());
}

  UpdateProfileModel updateProfileModel;

  void updateProfile(String email,String ssn,String address,String phone,String nationality,String password)
  {
    emit(UpdateProfileLoadingState());

    DioHelper.postData(
      url: studentUrl+UPDATEPROFILE,
      data: {
        'email':email,
        'ssn':ssn,
        'address':address,
        'phone':phone,
        'nationality':nationality,
        'password':password,


      },
      token: token,
    )
        .then((value) {
      emit(UpdateProfileSuccessState());

      updateProfileModel=UpdateProfileModel.fromJson(value.data);
      reloadProfileData();
      print(value.data);
      print(updateProfileModel.status);



    }).catchError((error){
      emit(UpdateProfileErrorState());
      print(error.toString());
    });
  }


  Future loadResources() async {
   return await GetStudentInfo();

  }

}
