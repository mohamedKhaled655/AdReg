











import 'package:advising_academy/models/advisor_model/AllStudentModel.dart';
import 'package:advising_academy/shared/component/constains.dart';
import 'package:advising_academy/shared/network/end_point.dart';
import 'package:advising_academy/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_student_adv_states.dart';

class AdvisorAllStudentCubit extends Cubit<AdvisorAllStudentStates>{
  AdvisorAllStudentCubit() : super(AdvisorAllStudentInitialState());



  static AdvisorAllStudentCubit get(context)=>BlocProvider.of(context);


  AllStudentForAdvisorModel allStudentForAdvisorModel ;
  void getAllStudentInformation_Advisor()
  {
    emit(AdvisorAllStudentLoadingHomeDataState());
    DioHelper.getData(
      url: advisorUrl+ALLSTUDENT,
      token: token,
    ).then((value) {

      allStudentForAdvisorModel=AllStudentForAdvisorModel.fromJson(value.data);
      print(value.data);

      print(allStudentForAdvisorModel.status);
      print(allStudentForAdvisorModel.message);



      emit(AdvisorAllStudentSuccessHomeDataState());
    }).catchError((error){
      emit(AdvisorAllStudentErrorHomeDataState());
      print(error.toString());
    });
  }


}
