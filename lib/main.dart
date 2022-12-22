



import 'package:advising_academy/shared/cubit/cubit_dark_mode.dart';
import 'package:advising_academy/shared/cubit/states_dark_mode.dart';
import 'package:advising_academy/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts/advisor/advisor_cubit/advisor_cubit.dart';
import 'layouts/advisor/advisor_layout.dart';
import 'layouts/advisor/advisor_screen.dart';
import 'layouts/home/cubit/home_layout_cubit.dart';
import 'layouts/home/home_layout.dart';
import 'modeules/degree_screens/cubit/degree_cubit.dart';
import 'modeules/login/login1.dart';
import 'modeules/login/login_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/component/constains.dart';
import 'shared/network/local/cache_Helper.dart';
import 'shared/network/remote/dio_helper.dart';





void main()async {
  WidgetsFlutterBinding.ensureInitialized();


  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  Widget widget;

  await CacheHelper.init();
// bool onBoarding=CacheHelper.getDta(key: 'onBoarding');
// print(onBoarding);
  token=CacheHelper.getDta(key: 'token');

  role=CacheHelper.getDta(key: 'role');

  uId=CacheHelper.getDta(key: 'uId');
  print(token);


  if(token !=null && role!=null)
  {

    if(role == "student")
    {
      widget=HomeLayout();
    }
    else if(role=="advisor")
    {
      widget=AdvisorLayout();
    }
  }
  else
  {
    widget=LoginScreen();
  }
  //widget=HomeLayout();

  runApp(MyApp(startWidget:widget ,));
}

class MyApp extends StatelessWidget{
  //final bool onBoarding;
  final Widget startWidget;

  MyApp({ this.startWidget,});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [

        BlocProvider(create: (BuildContext context)=>HomeLayoutCubit()..GetStudentInfo()..GetCourses()..GetViewCourse()..viewRegisterationCourses()..getWithdrawCoursesForStudent()),
        BlocProvider(create: (BuildContext context)=>AdvisorLayoutCubit()..getCoursesForAdvisor()..getStudentDataForAdvisor()..getStudentInformationData_Advisor()..getAllStudentInformation_Advisor()..InfoWithdrawCourseAdvisor()..InfoWithdrawSemesterAdvisor()..getDataMajor()..GetAdvisorInfo()),
        BlocProvider(create: (BuildContext context)=>DegreeCubit()..getDegreeYears(),),
        BlocProvider(create: (BuildContext context) =>AppChangeTheme(),),


      ],
      child: BlocConsumer<AppChangeTheme,StatesDarkMode>(
        listener: (
            BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,

            darkTheme: darkTheme,
            themeMode: AppChangeTheme.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr,
              // child: OnBoardingScreen()
              child: startWidget,
              //child: SocialLoginScreen(),
            ),

          );
        },

      ),
    );
  }

}