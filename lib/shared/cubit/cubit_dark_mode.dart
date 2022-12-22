import 'package:bloc/bloc.dart';




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states_dark_mode.dart';




class AppChangeTheme extends Cubit<StatesDarkMode>{
  AppChangeTheme() : super(InitialDark());

static AppChangeTheme get(context)=>BlocProvider.of(context);

  //ThemeMode appMode=ThemeMode.dark;
  bool isDark=false;

  void changeThemeMode(){
    isDark=!isDark;
   // CacheHelper.putDta(key: 'isDark', value: isDark).then((value) => null);
    emit(AppChangeModeState());
  }

}