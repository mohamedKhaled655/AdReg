


import 'package:advising_academy/modeules/degree_screens/degree_years_screen.dart';
import 'package:advising_academy/modeules/login/login_screen.dart';
import 'package:advising_academy/modeules/table1_screen.dart';
import 'package:advising_academy/modeules/table_screen.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../modeules/register_courses/register_course_screen1.dart';
import '../../modeules/register_courses/register_form_screen.dart';
import '../../modeules/schudel_screen.dart';
import '../../modeules/student_withdraw_semester_screen.dart';
import '../../modeules/view_registeration_courses.dart';
import '../../modeules/withdraw_course_student_screen.dart';
import '../../shared/component/constains.dart';
import 'cubit/home_layout_cubit.dart';
import 'cubit/home_layout_state.dart';

class HomeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (BuildContext context,state){
        if(token.isEmpty)
          {
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return LoginScreen();
                }));
          }
      },
      builder:(BuildContext context,state){
        var cubit=HomeLayoutCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.blue,

          appBar: NewGradientAppBar(

            gradient: LinearGradient(colors: appBarColorStudent,
              begin: Alignment.bottomLeft ,
              end: Alignment.topRight,
            ),

           ////////دا اللي بيغير لون ال drawer
           leading: Builder(
             builder: (context) {
               return IconButton(
                 color: Colors.white,
                 icon: Icon(Icons.menu_outlined),
                 onPressed: (){
                   Scaffold.of(context).openDrawer();
                 },
               );
             }
           ),
           bottom:PreferredSize(
             preferredSize: Size.fromHeight(10),
             child: SizedBox(height: 5,),
           ) ,
           // backgroundColor: Colors.teal[400],
           // backgroundColor: Colors.transparent,
           // backgroundColor: Colors.blue[300],
            elevation: 1,
            titleSpacing: 0,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [



              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/pattern.png')

                  ),),
                child: Image.asset(
                  "assets/images/logo2.png",
                  scale:4,
                ),
              ),





            ],),


            actions: [
              // Padding(
              //   padding: const EdgeInsets.only(right: 8.0),
              //   child: CircleAvatar(
              //     // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              //
              //     radius: 22.0,
              //
              //     child: CircleAvatar(
              //       radius: 20.0,
              //       backgroundImage: NetworkImage(
              //           'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996'
              //       ),
              //     ),
              //   ),
              // ),
              IconButton(
                icon: Icon(Icons.add_to_home_screen,color: Colors.white,),
                onPressed: (){
                  signOut(context);
                },

              ),
            ],


          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0xFF376b59),
            showSelectedLabels: true,
            currentIndex: cubit.currentIndex,
            iconSize: 25,
            items: const [
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996'),
                ),
                label: 'Profile',
                activeIcon: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage:  NetworkImage(
                          'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996'),
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(icon: Icon(Icons.schedule_send),label: 'courses'),
              BottomNavigationBarItem(icon: Icon(Icons.menu_book),label: 'viewCourses'),
              BottomNavigationBarItem(icon: Icon(Icons.table_chart),label: 'Table'),
              // BottomNavigationBarItem(
              //   icon: CircleAvatar(
              //     radius: 20,
              //     backgroundImage: NetworkImage(
              //         'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996'),
              //   ),
              //   label: 'Profile',
              //   activeIcon: CircleAvatar(
              //     radius: 18,
              //     backgroundColor: Colors.black,
              //     child: CircleAvatar(
              //       radius: 17,
              //       backgroundColor: Colors.white,
              //       child: CircleAvatar(
              //         radius: 15,
              //         backgroundImage:  NetworkImage(
              //             'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996'),
              //       ),
              //     ),
              //   ),
              // ),



            ],
            onTap: (index){
              cubit.changeBottom(index);
            },
          ),
          drawer:Drawer(
backgroundColor: Colors.white,

            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(

                  decoration: BoxDecoration(

                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white70,
                        // Color(0xFF00b0ff),
                        // Color(0xFF40c4ff),
                        // Color(0xFF80d8ff),


                        // Colors.tealAccent.shade700,
                        // Colors.tealAccent.shade400,

                        // Colors.tealAccent.shade100,
                      ],
                    ),
                  ),
                  currentAccountPictureSize: Size(64,64),
                  // margin: EdgeInsets.all(8),
                  accountName:ConditionalBuilder(
                    condition: cubit.studentInfoModel!=null,
                    builder: (context)=>Text(
                      (name !=null)?name:"",
                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(

                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    fallback: (context)=>Text("null"),
                  ),

                  accountEmail: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color:Colors.black54 ,
                        ),
                        SizedBox(width: 5,),
                        ConditionalBuilder(
                          condition: cubit.studentInfoModel!=null,
                          builder: (context)=>Text(email,
                            style: TextStyle(color: Colors.black54),),
                          fallback: (context)=>Text("null"),
                        ),
                      ],
                    ),
                  ),

                  currentAccountPicture: Container(

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      //color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: CircleAvatar(
                      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                      radius: 54.0,

                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996'),
                      ),
                    ),
                  ),
                ),

                ListTile(


                  leading: Icon(Icons.home), title: Text(
                    "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.launch),
                  title: Text("View Courses",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return Scaffold(
                              appBar: NewGradientAppBar(
                                gradient: LinearGradient(colors: appBarColorStudent,),
                                bottom:PreferredSize(
                                  preferredSize: Size.fromHeight(10),
                                  child: SizedBox(height: 5,),
                                ) ,
                                actions: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/images/pattern.png')

                                      ),),
                                    child: Image.asset(
                                      "assets/images/logo2.png",
                                      scale:4,
                                    ),
                                  ),
                                ],
                                leading: Builder(
                                    builder: (context) {
                                      return IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.arrow_back_ios_new_outlined),
                                        onPressed: (){
                                          Navigator.pop(context);

                                        },
                                      );
                                    }
                                ),
                              ),
                              body: ViewRegisterationCousresScreen());
                        }));
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.app_registration),
                  title: Text("Academic Registration",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return Scaffold(
                              appBar:  NewGradientAppBar(
                                gradient: LinearGradient(colors:appBarColorStudent,),
                                bottom:PreferredSize(
                                  preferredSize: Size.fromHeight(10),
                                  child: SizedBox(height: 5,),
                                ) ,
                                actions: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/images/pattern.png')

                                      ),),
                                    child: Image.asset(
                                      "assets/images/logo2.png",
                                      scale:4,
                                    ),
                                  ),
                                ],
                                leading: Builder(
                                    builder: (context) {
                                      return IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.arrow_back_ios_new_outlined),
                                        onPressed: (){
                                          Navigator.pop(context);

                                        },
                                      );
                                    }
                                ),
                              ),
                              body: RegisterFormScreen());
                        }));
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.mark_as_unread_sharp),
                  title: Text("Grades",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return Scaffold(
                              appBar: NewGradientAppBar(
                                title: Text("Grades",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                gradient: LinearGradient(colors: appBarColorStudent,),
                                bottom:PreferredSize(
                                  preferredSize: Size.fromHeight(10),
                                  child: SizedBox(height: 5,),
                                ) ,
                                actions: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/images/pattern.png')

                                      ),),
                                    child: Image.asset(
                                      "assets/images/logo2.png",
                                      scale:4,
                                    ),
                                  ),
                                ],
                                leading: Builder(
                                    builder: (context) {
                                      return IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.arrow_back_ios_new_outlined),
                                        onPressed: (){
                                          Navigator.pop(context);

                                        },
                                      );
                                    }
                                ),
                              ),
                              body: DegreeScreen());
                        }));
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("View Schedule",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return Scaffold(
                            appBar: NewGradientAppBar(
                              title: Text("Schedule",style: TextStyle(color: Colors.white),),
                              gradient: LinearGradient(colors:appBarColorStudent,),
                              bottom:PreferredSize(
                                preferredSize: Size.fromHeight(10),
                                child: SizedBox(height: 5,),
                              ) ,
                              actions: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/images/pattern.png')

                                    ),),
                                  child: Image.asset(
                                    "assets/images/logo2.png",
                                    scale:4,
                                  ),
                                ),
                              ],
                              leading: Builder(
                                  builder: (context) {
                                    return IconButton(
                                      color: Colors.white,
                                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                                      onPressed: (){
                                        Navigator.pop(context);

                                      },
                                    );
                                  }
                              ),
                            ),
                             // body: TableScreen(),
                            body: Table1Screen(),
                          );
                        }));
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.cancel),
                  title: Text("Withdrawal from Course",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {

                    Navigator.pop(context);
                    HomeLayoutCubit.get(context).getWithdrawCoursesForStudent();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return WithdrawCoursesForStudentScreen();
                        }));
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Withdrawal from Semester",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                    // HomeLayoutCubit.get(context).getWithdrawSemesterForStudent();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return WithdrawSemesterForStudentScreen();
                        }));

                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),

                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Sign out",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                    signOut(context);
                  },
                ),
              ],
            ),
          ),


        );
      },

    );


  }
}


