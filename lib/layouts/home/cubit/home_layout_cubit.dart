



import 'package:advising_academy/models/change_courses_model.dart';
import 'package:advising_academy/models/table_model.dart';
import 'package:advising_academy/modeules/table1_screen.dart';
import 'package:advising_academy/modeules/table_screen.dart';
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
import '../../../models/show_degree.dart';
import '../../../models/student_info_model.dart';
import '../../../models/student_withdraw_semester.dart';
import '../../../models/submit_register_course_model.dart';
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
import '../../advisor/advisor_screen.dart';
import 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{
  HomeLayoutCubit() : super(HomeLayoutInitialState());



  static HomeLayoutCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;



  List<Widget>bottomScreen=[
     HomeScreen(),
    // Register_Course(),
    RegisterFormScreen(),
    ViewRegisterationCousresScreen(),
  //  ViewCousresScreen(),

    Table1Screen()
   // TableScreen(),
    // Settings(),
   // HomeScreen(),

  ];

  void changeBottom(int index)
  {
    currentIndex=index;
    if(currentIndex==2)
      {
        viewRegisterationCourses();
      }
    else if(currentIndex==1)
      {
        GetCourses();
      }
    else if(currentIndex==3)
    {
      GetStudentInfo();
    }

    emit(HomeLayoutChangeBottomNav());
  }

  StudentInfoModel studentInfoModel;

  void GetStudentInfo()
  {
    emit(GetStudentInfoLoadingState());
    DioHelper.getData(
      url: USERDATA,
      token: token,
    ).then((value) {

      studentInfoModel=StudentInfoModel.fromJson(value.data);
      print(studentInfoModel.status);
      print(studentInfoModel.message);


      emit(GetStudentInfoSuccessState());
    }).catchError((error){
      emit(GetStudentInfoErrorState());
      print(error.toString());
    });
  }



  GetCoursesModel getCoursesModel;

  void GetCourses()
  {
    emit(GetCoursesLoadingState());
    DioHelper.getData(
        url: studentUrl+GetCourse,
      token: token,
    ).then((value) {

      getCoursesModel=GetCoursesModel.fromJson(value.data);
      print(getCoursesModel.status);
      print(getCoursesModel.message);
      print(getCoursesModel.data[0].arabicName);
      print(getCoursesModel.data[0].majors);
      print(getCoursesModel.data[0].prerequisite);

      if(value.data==null)
        {
          emit(GetCoursesEmptyState());
        }
      emit(GetCoursesSuccessState());
    }).catchError((error){
      emit(GetCoursesErrorState());
      print(error.toString());
    });
  }




  void reloadData(context){
    emit(ReloadDataState());
    GetCourses();

   // Navigator.pop(context);

   }

  GroupModel groupModel;
var xIdCourse="";
bool xState;
  void postCourses(String courseId)
  {
    emit(GroupLoadingState());

    DioHelper.postData(
        url: postCourse+PostCourse,
        data: {
          'courseId':courseId,

        },
      token: token,
    )
        .then((value) {
          emit(GroupSuccessState());
          groupModel=GroupModel.fromJson(value.data);
xIdCourse=courseId;
xState=groupModel.status;
         print(value.data);
          print(groupModel.status);
          print(groupModel.message);
          print(groupModel.data[0].lecture.day);

    }).catchError((error){
      emit(GroupErrorState());
      print(error.toString());
    });
  }




  AdvisorModel advisorModel;
  var gId="";
  var sId="";
  BuildContext xContext;

  void postAdvisorData(String groupId,String semesterId,context)
  {
    emit(AdvisorGetDataLoadingState());

    DioHelper.postData(
      url: studentUrl+REGISTER_CASE,
      data: {
        'groupId':groupId,
        'semesterId':semesterId

      },
      token: token,
    )
        .then((value) {
      emit(AdvisorGetDataSuccessState());
      // checkClash(groupId);
      reloadData(context);

      advisorModel=AdvisorModel.fromJson(value.data);
      gId=groupId;
      sId=semesterId;
      xContext=context;
      print(value.data);
      print(advisorModel.status);





    }).catchError((error){
      emit(AdvisorGetDataErrorState());
      print(error.toString());
    });
  }



  ViewCourseModel viewCourseModel;

  void GetViewCourse()
  {
    emit(GetViewCoursesLoadingState());
    DioHelper.getData(
      url: studentUrl+VIEWCOURSE,
      token: token,
    ).then((value) {

      viewCourseModel=ViewCourseModel.fromJson(value.data);
      print(viewCourseModel.status);
      print(viewCourseModel.message);
      print(viewCourseModel.data[0].courseName);



      emit(GetViewCoursesSuccessState());
    }).catchError((error){
      emit(GetViewCoursesErrorState());
      print(error.toString());
    });
  }





  DeleteCourseModel deleteCourseModel;

  void postDeleteCourse(String registerCasesId)
  {
    emit(DeleteCourseDataLoadingState());

    DioHelper.postData(
      url: studentUrl+DELETE_COURSE,
      data: {
        'registerCasesId':registerCasesId,


      },
      token: token,
    )
        .then((value) {
      emit(DeleteCourseDataSuccessState());
      reloadRemoveRegisterCAse();
      deleteCourseModel=DeleteCourseModel.fromJson(value.data);
      print(value.data);
      print(deleteCourseModel.status);



    }).catchError((error){
      emit(DeleteCourseDataErrorState());
      print(error.toString());
    });
  }

  RemoveRegisterCase removeRegisterCase;

  void postRemoveRegisterCase(String registerCasesId)
  {
    emit(DeleteRegisterCaseLoadingState());

    DioHelper.postData(
      url: studentUrl+REMOVE_REGISTER_CASE,
      data: {
        'registerCasesId':registerCasesId,


      },
      token: token,
    )
        .then((value) {
      emit(DeleteRegisterCaseSuccessState());
      reloadRemoveRegisterCAse();
      removeRegisterCase=RemoveRegisterCase.fromJson(value.data);
      print(value.data);
      print(removeRegisterCase.status);



    }).catchError((error){
      emit(DeleteRegisterCaseErrorState());
      print(error.toString());
    });
  }
  InformationForStudent informationForStudent;
  bool issu=false;
  void viewRegisterationCourses()
  {
    emit(GetRegisterationCoursesLoadingState());
    DioHelper.getData(
      url: studentUrl+INFORMATIONS,
      token: token,
    ).then((value) {

      informationForStudent=InformationForStudent.fromJson(value.data);

      print(informationForStudent.status);
      print(informationForStudent.message);
      print(value.data);

var l=informationForStudent.data.registrations;
var ll=l.map((e) {return e.state;}).toList();
print("ll"+ll.toString());

      for(int i=0;i<ll.length;i++)
        {
          if(ll[i]=="accept")
          {
            issu=true;
            emit(ChangeRegisterationCoursesSuccessState());
          }
        }



      emit(GetRegisterationCoursesSuccessState());
    }).catchError((error){
      emit(GetRegisterationCoursesErrorState());
      print(error.toString());
    });
  }

  ChangeCoursesModel changeCoursesModel;
  void changeCourses()
  {
    emit(ChangeCoursesLoadingState());
    DioHelper.getData(
      url: studentUrl+CHANGE_COURSE,
      token: token,
    ).then((value) {

      changeCoursesModel=ChangeCoursesModel.fromJson(value.data);
      viewRegisterationCourses();
      print(changeCoursesModel.status);
      print(changeCoursesModel.message);

      emit(ChangeCoursesSuccessState());
    }).catchError((error){
      emit(ChangeCoursesErrorState());
      print(error.toString());
    });
  }


  SubmitRegisterCousreModel submitRegisterCousreModel;

  void submitRegisterationCourses()
  {
    emit(SubmitRegisterationCoursesLoadingState());
    DioHelper.getData(
      url: studentUrl+SUBMIT_RESITER_COURSE,
      token: token,
    ).then((value) {

      submitRegisterCousreModel=SubmitRegisterCousreModel.fromJson(value.data);
      reloadRemoveRegisterCAse();
      print(submitRegisterCousreModel.status);
      print(submitRegisterCousreModel.message);


      emit(SubmitRegisterationCoursesSuccessState());
    }).catchError((error){
      emit(SubmitRegisterationCoursesErrorState());
      print(error.toString());
    });
  }




  void reloadRemoveRegisterCAse(){
    emit(ReloadDataState());
    viewRegisterationCourses();
    GetViewCourse();


  }




 /* String indexGroup;
  List<String>Groups=[
    'Group1 Section1 lab1','Group2 Section2 lab2','Group2 Section2 lab3','Group4 Section4 lab4'
  ];

  void selectGroup( index){
    indexGroup=index;
    emit(HomeLayoutChangeGroup());
  }
*/

  CheckClashModel checkClashModel;

  void checkClash(String groupId)
  {
    emit(CheckClashLoadingState());

    DioHelper.postData(
      url: studentUrl+CHECK_CLASH,
      data: {
        'groupId':groupId,


      },
      token: token,
    )
        .then((value) {
      emit(CheckClashSuccessState());

      checkClashModel=CheckClashModel.fromJson(value.data);
      //postCourses(xIdCourse);
       //postAdvisorData(gId,sId,xContext);
      print(value.data);
      print(checkClashModel.status);
      print("Status is ${checkClashModel.status}");



    }).catchError((error){
      emit(CheckClashErrorState());
      print(error.toString());
    });
  }



  // RegisterCaseModel registerCaseModel;
  //
  // void registerCase(String groupId,String semesterId,BuildContext context)
  // {
  //   emit(RegisterCaseLoadingState());
  //
  //   DioHelper.postData(
  //     url: studentUrl+REGISTERCASE,
  //     data: {
  //       'groupId':groupId,
  //       'semesterId':semesterId,
  //
  //
  //     },
  //     token: token,
  //   )
  //       .then((value) {
  //     emit(RegisterCaseSuccessState());
  //
  //     registerCaseModel=RegisterCaseModel.fromJson(value.data);
  //     reloadData(context);
  //
  //     print(value.data);
  //     print(registerCaseModel.status);
  //     if(registerCaseModel.status==true)
  //       {
  //         emit(DoneAcceptGroupSuccessState());
  //       }
  //     else if(registerCaseModel.status==false)
  //       {
  //         emit(DoneRejectGroupSuccessState());
  //       }
  //     print("Status is ${registerCaseModel.status}");
  //
  //
  //
  //   }).catchError((error){
  //     emit(RegisterCaseErrorState());
  //     print(error.toString());
  //   });
  // }

  RegisterCaseModel registerCaseModel;

  void registerCase(String groupId,BuildContext context)
  {
    emit(RegisterCaseLoadingState());

    DioHelper.postData(
      url: studentUrl+REGISTERCASE,
      data: {
        'groupId':groupId,

      },
      token: token,
    )
        .then((value) {
      emit(RegisterCaseSuccessState());

      registerCaseModel=RegisterCaseModel.fromJson(value.data);
      reloadData(context);

      print(value.data);
      print(registerCaseModel.status);
      if(registerCaseModel.status==true)
      {
        emit(DoneAcceptGroupSuccessState());
      }
      else if(registerCaseModel.status==false)
      {
        emit(DoneRejectGroupSuccessState());
      }
      print("Status is ${registerCaseModel.status}");



    }).catchError((error){
      emit(RegisterCaseErrorState());
      print(error.toString());
    });
  }


  WithdrawCoursesForStudentModel withdrawCoursesForStudentModel;

  void getWithdrawCoursesForStudent()
  {
    emit(WithdrawCoursesForStudentLoadingState());
    DioHelper.getData(
      url: studentUrl+WITHDRAWCOURSESYUDENT,
      token: token,
    ).then((value) {

      withdrawCoursesForStudentModel=WithdrawCoursesForStudentModel.fromJson(value.data);
     // reloadRemoveRegisterCAse();
      print(withdrawCoursesForStudentModel.status);
      print(withdrawCoursesForStudentModel.message);
      print(value.data);


      emit(WithdrawCoursesForStudentSuccessState());
    }).catchError((error){
      emit(WithdrawCoursesForStudentErrorState());
      print(error.toString());
    });
  }

var reasonController=TextEditingController();
  WithdrawCousreForStudentToAdvisorModel withdrawCousreForStudentToAdvisorModel;

  void postWithdrawCousreToAdvisor(String courseCode,String reason)
  {
    emit(PostWithdrawCoursesToAdvisorLoadingState());

    DioHelper.postData(
      url: studentUrl+SENDWITHDRAWCOURSESYUDENTTOADVISOR,
      data: {
        'courseCode':courseCode,
        'reason':reason,


      },
      token: token,
    )
        .then((value) {
      emit(PostWithdrawCoursesToAdvisorSuccessState());

      withdrawCousreForStudentToAdvisorModel=WithdrawCousreForStudentToAdvisorModel.fromJson(value.data);
      getWithdrawCoursesForStudent();
      //postCourses(xIdCourse);
      //postAdvisorData(gId,sId,xContext);
      print(value.data);
      print(withdrawCousreForStudentToAdvisorModel.status);
      print("Status is ${withdrawCousreForStudentToAdvisorModel.status}");



    }).catchError((error){
      emit(PostWithdrawCoursesToAdvisorErrorState());
      print(error.toString());
    });
  }
  var formKey=GlobalKey<FormState>();

var dropSemesterController=TextEditingController();

  StudentWithdrawSemesterModel studentWithdrawSemesterModel;

  void postWithdrawSemesterForStudent(String reason)
  {
    emit(WithdrawSemesterForStudentLoadingState());
    DioHelper.postData(
      url: studentUrl+WITHDRAWSEMESTERSYUDENT,
      data: {
        'reason':reason,
      },
      token: token,
    ).then((value) {

      studentWithdrawSemesterModel=StudentWithdrawSemesterModel.fromJson(value.data);
      // reloadRemoveRegisterCAse();
      print(studentWithdrawSemesterModel.status);
      if(studentWithdrawSemesterModel.status==false)
        {
          emit(RejectWithdrawingSemState());
        }
      else{
        emit(AcceptWithdrawingSemState());
      }
      print(studentWithdrawSemesterModel.message);
      print(value.data);


      emit(WithdrawSemesterForStudentSuccessState());
    }).catchError((error){
      emit(WithdrawSemesterForStudentErrorState());
      print(error.toString());
    });
  }





  ViewDegreeModel viewDegreeModel;

  void viewDegree(String academicYear)
  {
    emit(ViewDegreeLoadingState1());

    DioHelper.postData(
      url: studentUrl+VIEWDEGREE,
      data: {
        'academicYear':academicYear,


      },
      token: token,
    )
        .then((value) {
      emit(ViewDegreeSuccessState1());

      viewDegreeModel=ViewDegreeModel.fromJson(value.data);
      //getDegreeYears();
      //postCourses(xIdCourse);
      //postAdvisorData(gId,sId,xContext);
      print(value.data);
      print(viewDegreeModel.status);




    }).catchError((error){
      emit(ViewDegreeErrorState1());
      print(error.toString());
    });
  }



  TableModel tableModel;

  void table()
  {
    emit(TableLoadingState());
    DioHelper.getData(
      url: studentUrl+TABLE+"saturday",
      token: token,
    ).then((value) {

      tableModel=TableModel.fromJson(value.data);
      print(value.data);
      print(tableModel.data[0].state);
      print(tableModel.status);
      print(tableModel.message);
      print("ttttttttttttttttype=+${tableModel.data[11].state}");



      emit(TableSuccessState());
    }).catchError((error){
      emit(TableErrorState());
      print(error.toString());
    });
  }

  TableModel day2;

  void tableDay2()
  {
    emit(SunDayLoadingState());
    DioHelper.getData(
      url: studentUrl+TABLE+"sunday",
      token: token,
    ).then((value) {

      day2=TableModel.fromJson(value.data);
      print(value.data);
      print(day2.data[0].state);
      print(day2.status);
      print(day2.message);



      emit(SunDaySuccessState());
    }).catchError((error){
      emit(SunDayErrorState());
      print(error.toString());
    });
  }

  TableModel day3;

  void tableDay3()
  {
    emit(MondayLoadingState());
    DioHelper.getData(
      url: studentUrl+TABLE+"monday",
      token: token,
    ).then((value) {

      day3=TableModel.fromJson(value.data);
      print(value.data);
      print(day3.data[0].state);
      print(day3.status);
      print(day3.message);



      emit(MondaySuccessState());
    }).catchError((error){
      emit(MondayErrorState());
      print(error.toString());
    });
  }

  TableModel day4;

  void tableDay4()
  {
    emit(TuesdayLoadingState());
    DioHelper.getData(
      url: studentUrl+TABLE+"Tuesday",
      token: token,
    ).then((value) {

      day4=TableModel.fromJson(value.data);
      print(value.data);
      print("dddddddddddddddddd=${day4.data[0].state}");
      print("dddddddddddddddddd=${day4.data[1].state}");
      print(day4.status);
      print(day4.message);



      emit(TuesdaySuccessState());
    }).catchError((error){
      emit(TuesdayErrorState());
      print(error.toString());
    });
  }

  TableModel day5;

  void tableDay5()
  {
    emit(WednesdayLoadingState());
    DioHelper.getData(
      url: studentUrl+TABLE+"wednesday",
      token: token,
    ).then((value) {

      day5=TableModel.fromJson(value.data);
      print(value.data);
      print(day5.data[0].state);
      print(day5.status);
      print(day5.message);



      emit(WednesdaySuccessState());
    }).catchError((error){
      emit(WednesdayErrorState());
      print(error.toString());
    });
  }

  TableModel day6;

  void tableDay6()
  {
    emit(WednesdayLoadingState());
    DioHelper.getData(
      url: studentUrl+TABLE+"Thursday",
      token: token,
    ).then((value) {

      day6=TableModel.fromJson(value.data);
      print(value.data);
      print(day6.data[0].state);
      print(day6.status);
      print(day6.message);



      emit(WednesdaySuccessState());
    }).catchError((error){
      emit(WednesdayErrorState());
      print(error.toString());
    });
  }

}
