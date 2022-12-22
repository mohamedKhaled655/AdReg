
import 'package:advising_academy/layouts/advisor/profile_for_adv.dart';
import 'package:advising_academy/models/advisor_model/get_major_model.dart';
import 'package:advising_academy/models/advisor_model/major_model.dart';
import 'package:advising_academy/models/advisor_model/select_major_model.dart';
import 'package:advising_academy/models/student_info_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/advisor_model/AllStudentModel.dart';
import '../../../models/advisor_model/ad_accept_withdraw_semester_model.dart';
import '../../../models/advisor_model/ad_reject_withdraw_semester_model.dart';
import '../../../models/advisor_model/advisor_accept_case_model.dart';
import '../../../models/advisor_model/advisor_accept_course_model.dart';
import '../../../models/advisor_model/advisor_accept_withdraw_model.dart';
import '../../../models/advisor_model/advisor_confim_form_model.dart';
import '../../../models/advisor_model/advisor_reject_course_model.dart';
import '../../../models/advisor_model/advisor_reject_withdraw_model.dart';
import '../../../models/advisor_model/advisor_withdraw_semester.dart';
import '../../../models/advisor_model/get_data_for_advisor.dart';
import '../../../models/advisor_model/info_student_advisor.dart';
import '../../../models/advisor_model/registerationAdvisor_model.dart';
import '../../../models/advisor_model/registeration_student.dart';
import '../../../models/advisor_model/student_for_advisor.dart';
import '../../../models/advisor_model/submit_form.dart';
import '../../../models/advisor_model/withdraw_course_advisor_model.dart';
import '../../../models/registeration_for_student.dart';
import '../../../modeules/setting/setting.dart';
import '../../../shared/component/constains.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../StudentDataForAdvisorScreen.dart';
import '../advisor_screen.dart';
import '../advisor_screens/advisor_home_screen/cubit_for_home_screen_for_advisor/student_advisor_homeScreen.dart';
import '../advisor_screens/all_student_for_advisor/all_student_screen.dart';

import '../withdraw_course_advisor_screen.dart';
import '../withdraw_semester_advisor_screen.dart';
import 'advisor_state.dart';

class AdvisorLayoutCubit extends Cubit<AdvisorLayoutStates> {
  AdvisorLayoutCubit() : super(AdvisorLayoutInitialState());


  static AdvisorLayoutCubit get(context) => BlocProvider.of(context);




  int currentIndex_Advisor=0;

  List<Widget>bottomScreen=[

    StudentData_Advisor_HomeScreen(),
    AllStudentForAdvisorScreen(),
    //StudentDataForAdvisorScreen(),
    StudentWithdrawCourseAdvisorScreen(),
    StudentWithdrawSemesterAdvisorScreen(),
    ProfileForAdvisor(),
    //Settings(),

   // AdvisorScreen(),
  ];

  void changeBottom_Advisor(int index)
  {
    currentIndex_Advisor=index;
    if(currentIndex_Advisor==0)
      {
        getStudentInformationData_Advisor();

      }
    else if(currentIndex_Advisor==1)
      {
        getAllStudentInformation_Advisor();
      }
    else if(currentIndex_Advisor==2)
      {
        InfoWithdrawCourseAdvisor();
      }
    else if(currentIndex_Advisor==3)
      {
        InfoWithdrawSemesterAdvisor();
      }
    emit(AdvisorLayoutChangeBottomNav());
  }


  GetAdvisorData getAdvisorData;


  void getCoursesForAdvisor()
  {
    emit(GetCourseForAdvisorLoadingState());
    DioHelper.getData(
      url: advisorUrl+GET_REGISTER_CASE,
      token: token,
    ).then((value) {

      getAdvisorData=GetAdvisorData.fromJson(value.data);
      print(value.data);

      print(getAdvisorData.status);
      print(getAdvisorData.message);
      print(getAdvisorData.data[0].studentName);





      emit(GetCourseForAdvisorSuccessState());
    }).catchError((error){
      emit(GetCourseForAdvisorErrorState());
      print(error.toString());
    });
  }

  StudentForAdvisor studentForAdvisor;


  void getStudentDataForAdvisor()
  {
    emit(GetStudentDataForAdvisorLoadingState());
    DioHelper.getData(
      url: advisorUrl+STUDENTDATA,
      token: token,
    ).then((value) {

      studentForAdvisor=StudentForAdvisor.fromJson(value.data);
      print(value.data);

      print(studentForAdvisor.status);
      print(studentForAdvisor.message);






      emit(GetStudentDataForAdvisorSuccessState());
    }).catchError((error){
      emit(GetStudentDataForAdvisorErrorState());
      print(error.toString());
    });
  }


  AdvisorAcceptCaseModel advisorAcceptCaseModel;

  void postAdvisorAcceptCaseData(String registerCasesId)
  {
    emit(AdvisorAcceptCaseLoadingState());

    DioHelper.postData(
      url: accept_registerCases+ACCEPT_REGISTER_CASE,
      data: {
        'registerCasesId':registerCasesId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorAcceptCaseSuccessState());
      reloadDataForAdvisor();
      advisorAcceptCaseModel=AdvisorAcceptCaseModel.fromJson(value.data);
      print(value.data);
      print(advisorAcceptCaseModel.status);
      print(advisorAcceptCaseModel.data.state);



    }).catchError((error){
      emit(AdvisorAcceptCaseErrorState());
      print(error.toString());
    });
  }



  RegisterationStudent registerationStudent;

  void postRegisterationStudentData(String studentId)
  {
    emit(AdvisorRegisterationSteudentLoadingState());

    DioHelper.postData(
      url: advisorUrl+REGISTERATION_STUDENT,
      data: {
        'studentId':studentId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorRegisterationSteudentSuccessState());
     // reloadDataForAdvisor();
      registerationStudent=RegisterationStudent.fromJson(value.data);
      print(value.data);
      print(registerationStudent.status);
      print(registerationStudent.data.student.name);



    }).catchError((error){
      emit(AdvisorRegisterationSteudentErrorState());
      print(error.toString());
    });
  }


  AdvisorAcceptCaseModel advisorRejectCaseModel;


  void postAdvisorRejectCaseData(String registerCasesId)
  {
    emit(AdvisorRejectCaseLoadingState());

    DioHelper.postData(
      url: accept_registerCases+REJECT_REGISTER_CASE,
      data: {
        'registerCasesId':registerCasesId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorRejectCaseSuccessState());
      reloadDataForAdvisor();
      advisorRejectCaseModel=AdvisorAcceptCaseModel.fromJson(value.data);
      print(value.data);
      print(advisorRejectCaseModel.status);
      print(advisorRejectCaseModel.data.state);



    }).catchError((error){
      emit(AdvisorRejectCaseErrorState());
      print(error.toString());
    });
  }



  SubmitRegistrationForm submitRegistrationForm;

  void postSubmitRegisterationForm(String studentId)
  {
    emit(SubmitRegisterationFormLoadingState());

    DioHelper.postData(
      url: advisorUrl+SUBMIT_REGISTRATION_FORM,
      data: {
        'studentId':studentId,

      },
      token: token,
    )
        .then((value) {
      emit(SubmitRegisterationFormtSuccessState());
      reloadDataForAdvisor();
      submitRegistrationForm=SubmitRegistrationForm.fromJson(value.data);
      print(value.data);
      print(submitRegistrationForm.status);




    }).catchError((error){
      emit(SubmitRegisterationFormErrorState());
      print(error.toString());
    });
  }

  void reloadDataForAdvisor(){
    emit(ReloadDataForAdvisorState());
    getStudentDataForAdvisor();
    getCoursesForAdvisor();
  }

  bool isReload=false;

  void changeData({advisorAcceptCaseModel,advisorRejectCaseModel}){


    isReload !=isReload;
    emit(ChangeDataForAdvisorState());
  }

  /////////////////////////////////////////////////////
///////////////////////////////////////////////////////

  InformationStudentForAdvisor informationStudentForAdvisor;
  void getStudentInformationData_Advisor()
  {
    emit(GetStudentInfoForAdvisorLoadingState());
    DioHelper.getData(
      url: advisorUrl+STUDENTDATA,
      token: token,
    ).then((value) {

      informationStudentForAdvisor=InformationStudentForAdvisor.fromJson(value.data);
      print(value.data);

      print(informationStudentForAdvisor.status);
      print(informationStudentForAdvisor.message);





      emit(GetStudentInfoForAdvisorSuccessState());
    }).catchError((error){
      emit(GetStudentInfoForAdvisorErrorState());
      print(error.toString());
    });
  }


 // RegisterationAdvisorModel registerationAdvisorModel;

  InformationForStudent registerationAdvisorModel;
String xId="";
  void postIdForViewCoursesForStudent(String studentId)
  {
    emit(PostInformationStudentForAdvisorLoadingState());

    DioHelper.postData(
      url: advisorUrl+INFORMATION_ADVISOR,
      data: {
        'studentId':studentId,

      },
      token: token,
    )
        .then((value) {
      emit(PostInformationStudentForAdvisorSuccessState());
      registerationAdvisorModel=InformationForStudent.fromJson(value.data);
      print(value.data);
      print("comment+${registerationAdvisorModel.data.registrations[0].comment}");
      xId=studentId;

      print(registerationAdvisorModel.status);
      print(registerationAdvisorModel.message);
     // print(registerationAdvisorModel.data.registrations[0].courseName+"11111111111");





    }).catchError((error){
      emit(PostInformationStudentForAdvisorErrorState());
      print(error.toString());
    });
  }




  AdvisorAcceptCourseModel advisorAcceptCourseModel ;

  void postAdvisorAcceptCourse(String registerCasesId,)
  {
    emit(AdvisorAcceptCourseLoadingState());

    DioHelper.postData(
      url: advisorUrl+ACCEPTCOURSE,
      data: {
        'registerCasesId':registerCasesId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorAcceptCourseSuccessState());
      advisorAcceptCourseModel=AdvisorAcceptCourseModel.fromJson(value.data);
      postIdForViewCoursesForStudent(xId);
      print(value.data);
      print(advisorAcceptCourseModel.status);
      print(advisorAcceptCourseModel.message);


    }).catchError((error){
      emit(AdvisorAcceptCourseErrorState());
      print(error.toString());
    });
  }

  AdvisorRejectCourseModel  advisorRejectCourseModel  ;

  void postAdvisorRejectCourse(String registerCasesId,)
  {
    emit(AdvisorRejectCourseLoadingState());

    DioHelper.postData(
      url: advisorUrl+REJECTCOURSE,
      data: {
        'registerCasesId':registerCasesId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorRejectCourseSuccessState());
      advisorRejectCourseModel=AdvisorRejectCourseModel.fromJson(value.data);
      postIdForViewCoursesForStudent(xId);
      print(value.data);
      print(advisorRejectCourseModel.status);
      print(advisorRejectCourseModel.message);


    }).catchError((error){
      emit(AdvisorRejectCourseErrorState());
      print(error.toString());
    });
  }


  AdvisorConfirmModel  advisorConfirmModel  ;

  void postAdvisorConfirmForm(String studentId,)
  {
    emit(AdvisorConfirmFormLoadingState());

    DioHelper.postData(
      url: advisorUrl+AdvisorConfirm,
      data: {
        'studentId':studentId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorConfirmFormSuccessState());
      advisorConfirmModel=AdvisorConfirmModel.fromJson(value.data);
      postIdForViewCoursesForStudent(xId);
      print(value.data);
      print(advisorConfirmModel.status);
      print(advisorConfirmModel.message);


    }).catchError((error){
      emit(AdvisorConfirmFormErrorState());
      print(error.toString());
    });
  }




  AllStudentForAdvisorModel allStudentForAdvisorModel ;
  void getAllStudentInformation_Advisor()
  {
    emit(GetAllStudentForAdvisorLoadingState());
    DioHelper.getData(
      url: advisorUrl+ALLSTUDENT,
      token: token,
    ).then((value) {

      allStudentForAdvisorModel=AllStudentForAdvisorModel.fromJson(value.data);
      print(value.data);

      print(allStudentForAdvisorModel.status);
      print(allStudentForAdvisorModel.message);



      emit(GetAllStudentForAdvisorSuccessState());
    }).catchError((error){
      emit(GetAllStudentForAdvisorErrorState());
      print(error.toString());
    });
  }



  WithdrawCourseAdvisorModel withdrawCourseAdvisorModel ;
  void InfoWithdrawCourseAdvisor()
  {
    emit(WithdrawCourseAdvisorLoadingState());
    DioHelper.getData(
      url: advisorUrl+WITHDRAWCOURSEADVISOR,
      token: token,
    ).then((value) {

      withdrawCourseAdvisorModel=WithdrawCourseAdvisorModel.fromJson(value.data);
      print(value.data);

      print(withdrawCourseAdvisorModel.status);
      print(withdrawCourseAdvisorModel.message);



      emit(WithdrawCourseAdvisorSuccessState());
    }).catchError((error){
      emit(WithdrawCourseAdvisorErrorState());
      print(error.toString());
    });
  }



  AdvisorAcceptWithdrawCourseModel  advisorAcceptWithdrawCourseModel  ;

  void postAdvisorAcceptWithdrawCourse(String registerCasesId,)
  {
    emit(AdvisorAcceptWithdrawCourseLoadingState());

    DioHelper.postData(
      url: advisorUrl+ACCEPTWITHDRAWCOURSE,
      data: {
        'registerCasesId':registerCasesId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorAcceptWithdrawCourseSuccessState());
      advisorAcceptWithdrawCourseModel=AdvisorAcceptWithdrawCourseModel.fromJson(value.data);
      postIdForViewCoursesForStudent(xId);
      InfoWithdrawCourseAdvisor();
      print(value.data);
      print(advisorAcceptWithdrawCourseModel.status);
      print(advisorAcceptWithdrawCourseModel.message);


    }).catchError((error){
      emit(AdvisorAcceptWithdrawCourseErrorState());
      print(error.toString());
    });
  }


  AdvisorRejectWithdrawCourseModel  advisorRejectWithdrawCourseModel  ;

  void postAdvisorRejectWithdrawCourse(String registerCasesId,)
  {
    emit(AdvisorRejectWithdrawCourseLoadingState());

    DioHelper.postData(
      url: advisorUrl+REJECTWITHDRAWCOURSE,
      data: {
        'registerCasesId':registerCasesId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorRejectWithdrawCourseSuccessState());
      advisorAcceptWithdrawCourseModel=AdvisorAcceptWithdrawCourseModel.fromJson(value.data);
      postIdForViewCoursesForStudent(xId);
      InfoWithdrawCourseAdvisor();
      print(value.data);
      print(advisorAcceptWithdrawCourseModel.status);
      print(advisorAcceptWithdrawCourseModel.message);


    }).catchError((error){
      emit(AdvisorRejectWithdrawCourseErrorState());
      print(error.toString());
    });
  }


  WithdrawSemesterAdvisorModel withdrawSemesterAdvisorModel ;
  void InfoWithdrawSemesterAdvisor()
  {
    emit(WithdrawSemesterAdvisorLoadingState());
    DioHelper.getData(
      url: advisorUrl+WITHDRAWSEMESTERADVISOR,
      token: token,
    ).then((value) {

      withdrawSemesterAdvisorModel=WithdrawSemesterAdvisorModel.fromJson(value.data);
      print(value.data);

      print(withdrawSemesterAdvisorModel.status);
      print(withdrawSemesterAdvisorModel.message);



      emit(WithdrawSemesterAdvisorSuccessState());
    }).catchError((error){
      emit(WithdrawSemesterAdvisorErrorState());
      print(error.toString());
    });
  }


  AdvisorAcceptWithdrawSemesterModel  advisorAcceptWithdrawSemesterModel  ;

  void postAdvisorAcceptWithdrawSemester(String studentId,)
  {
    emit(AdvisorAcceptWithdrawSemesterLoadingState());

    DioHelper.postData(
      url: advisorUrl+ACCEPTWITHDRAWSEMESTER,
      data: {
        'studentId':studentId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorAcceptWithdrawSemesterSuccessState());
      advisorAcceptWithdrawSemesterModel=AdvisorAcceptWithdrawSemesterModel.fromJson(value.data);
      postIdForViewCoursesForStudent(xId);
      InfoWithdrawSemesterAdvisor();
      print(value.data);
      print(advisorAcceptWithdrawSemesterModel.status);
      print(advisorAcceptWithdrawSemesterModel.message);


    }).catchError((error){
      emit(AdvisorAcceptWithdrawSemesterErrorState());
      print(error.toString());
    });
  }


  AdvisorRejectWithdrawSemesterModel  advisorRejectWithdrawSemesterModel  ;

  void postAdvisorRejectWithdrawSemester(String studentId,)
  {
    emit(AdvisorRejectWithdrawSemesterLoadingState());

    DioHelper.postData(
      url: advisorUrl+REJECTWITHDRAWSEMESTER,
      data: {
        'studentId':studentId,

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorRejectWithdrawSemesterSuccessState());
      advisorRejectWithdrawSemesterModel=AdvisorRejectWithdrawSemesterModel.fromJson(value.data);
      postIdForViewCoursesForStudent(xId);
      InfoWithdrawSemesterAdvisor();
      print(value.data);
      print(advisorRejectWithdrawSemesterModel.status);
      print(advisorRejectWithdrawSemesterModel.message);


    }).catchError((error){
      emit(AdvisorRejectWithdrawSemesterErrorState());
      print(error.toString());
    });
  }


  GetMajorModel getMajorModel ;
  void getDataMajor()
  {
    emit(GetMajorLoadingState());
    DioHelper.getData(
      url: advisorUrl+GET_MAJOR,
      token: token,
    ).then((value) {

      getMajorModel=GetMajorModel.fromJson(value.data);
      print(value.data);

      print(getMajorModel.status);
      print(getMajorModel.message);



      emit(GetMajorSuccessState());
    }).catchError((error){
      emit(GetMajorErrorState());
      print(error.toString());
    });
  }


  SelectMajorModel  selectMajorModel  ;

  void selectMajor(int studentId,)
  {
    emit(SelectMajorLoadingState());

    DioHelper.postData(
      url: advisorUrl+SELECT_MAJOR,
      data: {
        'studentId':studentId,

      },
      token: token,
    )
        .then((value) {
      emit(SelectMajorSuccessState());
      selectMajorModel=SelectMajorModel.fromJson(value.data);


      print(value.data);
      print(selectMajorModel.status);
      print(selectMajorModel.message);


    }).catchError((error){
      emit(SelectMajorErrorState());
      print(error.toString());
    });
  }


  MajorModel  majorModel  ;

  void selectMajorForStudent(int studentId,String majorId)
  {
    emit(MajorLoadingState());

    DioHelper.postData(
      url: advisorUrl+MAJOR,
      data: {
        'studentId':studentId,
        'majorId':majorId,

      },
      token: token,
    )
        .then((value) {
      emit(MajorSuccessState());
      majorModel=MajorModel.fromJson(value.data);


      print(value.data);
      print(majorModel.status);
      print(majorModel.message);


    }).catchError((error){
      emit(MajorErrorState());
      print(error.toString());
    });
  }


  StudentInfoModel advisorInfoModel;

  void GetAdvisorInfo()
  {
    emit(AdvisorInfoLoadingState());
    DioHelper.getData(
      url: USERDATA,
      token: token,
    ).then((value) {

      advisorInfoModel=StudentInfoModel.fromJson(value.data);
      print(advisorInfoModel.status);
      print(advisorInfoModel.message);


      emit(AdvisorInfoSuccessState());
    }).catchError((error){
      emit(AdvisorInfoErrorState());
      print(error.toString());
    });
  }

}

