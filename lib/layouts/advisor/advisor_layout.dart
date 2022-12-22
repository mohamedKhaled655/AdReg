
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../shared/component/constains.dart';
import 'advisor_cubit/advisor_cubit.dart';
import 'advisor_cubit/advisor_state.dart';
import 'major/major_screen.dart';

class AdvisorLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdvisorLayoutCubit,AdvisorLayoutStates>(
      listener: (BuildContext context,state){},
      builder:(BuildContext context,state){
        var cubit=AdvisorLayoutCubit.get(context);
        return Scaffold(

          appBar: NewGradientAppBar(
            gradient: LinearGradient(colors: appBarColor,),
           // backgroundColor: Colors.teal[400],
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
            elevation: 1,
            title:  Container(
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
            actions: [
              IconButton(
                icon: Icon(Icons.add_to_home_screen,color: Colors.white,),
                onPressed: (){
                  signOut(context);
                },

              ),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex_Advisor],
          drawer: Drawer(
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
                  accountName:ConditionalBuilder(
                    condition:cubit.advisorInfoModel != null,
                    builder: (context)=>Text(
                      (name !=null)?name:"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(

                        color: Colors.black,
                        fontSize: 16,
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
                          condition: cubit.advisorInfoModel!=null,
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
                  title: Text("Change Major",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return GetMajorScreen();
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
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            showSelectedLabels: true,
            selectedItemColor: Color(0xFF376b59),
            showUnselectedLabels: true,

            currentIndex: cubit.currentIndex_Advisor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.app_registration),label: 'student'),
              BottomNavigationBarItem(icon: Icon(Icons.draw),label: 'withdraw'),
              BottomNavigationBarItem(icon: Icon(Icons.details_rounded),label: 'Semester'),
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


            ],
            onTap: (index){
              cubit.changeBottom_Advisor(index);
            },
          ),


        );
      },

    );


  }
}