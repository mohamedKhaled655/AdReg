






import 'package:advising_academy/models/show_degree.dart';
import 'package:advising_academy/models/show_degree_year_model.dart';
import 'package:advising_academy/shared/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/constains.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'degree_states.dart';

class DegreeCubit extends Cubit<DegreeStates>{
  DegreeCubit() : super(DegreeInitialState());



  static DegreeCubit get(context)=>BlocProvider.of(context);





  ShowDegreeYearsModel showDegreeYearsModel;

  void getDegreeYears()
  {
    emit(DegreeLoadingState());
    DioHelper.getData(
      url: studentUrl+GETYEARSDEGREE,
      token: token,
    ).then((value) {

      showDegreeYearsModel=ShowDegreeYearsModel.fromJson(value.data);
      print(showDegreeYearsModel.status);
      print(showDegreeYearsModel.message);


      emit(DegreeSuccessState());
    }).catchError((error){
      emit(DegreeErrorState());
      print(error.toString());
    });
  }

  ViewDegreeModel viewDegreeModel;

  void viewDegree(int academicYear)
  {
    emit(ViewDegreeLoadingState());

    DioHelper.postData(
      url: studentUrl+VIEWDEGREE,
      data: {
        'academicYear':academicYear,


      },
      token: token,
    )
        .then((value) {
      emit(ViewDegreeSuccessState());

      viewDegreeModel=ViewDegreeModel.fromJson(value.data);
      getDegreeYears();
      if(viewDegreeModel.status==false||viewDegreeModel.data.length==null)
        {
          emit(xxState());
        }
      //postCourses(xIdCourse);
      //postAdvisorData(gId,sId,xContext);
      print(value.data);
      print(viewDegreeModel.status);




    }).catchError((error){
      emit(ViewDegreeErrorState());
      print(error.toString());
    });
  }



}
