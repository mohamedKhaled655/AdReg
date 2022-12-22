







import 'package:advising_academy/layouts/advisor/advisor_screens/advisor_home_screen/cubit_for_home_screen_for_advisor/states_home_advisor.dart';
import 'package:advising_academy/models/advisor_model/info_student_advisor.dart';
import 'package:advising_academy/shared/component/constains.dart';
import 'package:advising_academy/shared/network/end_point.dart';
import 'package:advising_academy/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class AdvisorHomeScreenCubit extends Cubit<AdvisorHomeScreenStates>{
  AdvisorHomeScreenCubit() : super(AdvisorHomeScreenInitialState());



  static AdvisorHomeScreenCubit get(context)=>BlocProvider.of(context);





  InformationStudentForAdvisor informationStudentForAdvisor;
  void getStudentInformationData_Advisor()
  {
    emit(AdvisorHomeScreenLoadingHomeDataState());
    DioHelper.getData(
      url: advisorUrl+STUDENTDATA,
      token: token,
    ).then((value) {

      informationStudentForAdvisor=InformationStudentForAdvisor.fromJson(value.data);
      print(value.data);

      print(informationStudentForAdvisor.status);
      print(informationStudentForAdvisor.message);





      emit(AdvisorHomeScreenSuccessHomeDataState());
    }).catchError((error){
      emit(AdvisorHomeScreenErrorHomeDataState());
      print(error.toString());
    });
  }











}
