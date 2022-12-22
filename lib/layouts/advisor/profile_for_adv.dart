
import 'package:advising_academy/models/student_info_model.dart';
import 'package:advising_academy/modeules/home/cubit/home_cubit.dart';
import 'package:advising_academy/modeules/home/cubit/home_state.dart';
import 'package:advising_academy/shared/component/constains.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modeules/home/edit_profile.dart';

class ProfileForAdvisor extends StatelessWidget {
  const ProfileForAdvisor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>StudentInfoCubit()..GetStudentInfo(),
      child: BlocConsumer<StudentInfoCubit, StudentInfoStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = StudentInfoCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            body: ConditionalBuilder(
              condition: cubit.studentInfoModel != null,
              builder: (context) => BuildInfo(cubit.studentInfoModel.data,context),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

Widget BuildInfo(StudentInfoData model,context) {
  Color color=Color(0xFFDF7861);
  name=model.englishName;
  email=model.email;
  imageProfile='https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996';
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 190,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [

              Align(
                alignment: AlignmentDirectional.topCenter,
                child:Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        height: 140.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_23-2149009911.jpg?w=996&t=st=1656850608~exp=1656851208~hmac=d4c92389f30fdea788c03c8cdd08713e57d7a3a529b42d54101bb8a480982c84',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // TextButton(
                    //   child: Text("Edit",style: TextStyle(color: Colors.black),),
                    //
                    //   onPressed: (){
                    //     Navigator.push(context, MaterialPageRoute(
                    //         builder: (context){
                    //           return EditProfile();
                    //         }));
                    //   },
                    // ),
                  ],
                ),

              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  //color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: CircleAvatar(
                  // backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                  radius: 53.0,

                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996'),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10.0,
        ),



        Text(
          (model.englishName !=null)? model.englishName:" ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        SizedBox(
          height: 5.0,
        ),

        Divider(),

        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  child: Text("Edit Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return EditProfile();
                        }));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.withAlpha(50)),
                  ),

                ),
              ),
              SizedBox(width: 10,),
              OutlinedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return EditProfile();
                      }));
                },
                child: Icon(Icons.edit,color: Colors.black,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.withAlpha(50)),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 5.0,
        ),

        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(

                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 4.0, 8.0, 0),
                                child: Text(
                                  'Email :',
                                  style: TextStyle(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.email,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Phone :',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.phone,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),


                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.location_city_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Address :',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.address,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Nationality :',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.nationality,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.add_card,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'SSN :',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.ssn.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.black,
                              thickness: .3),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.perm_identity_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'ID :',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.id.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.black,
                            thickness: .5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.grade_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'GPA :',
                                  style: TextStyle(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.gPA.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          Divider(color: Colors.black,
                              thickness: .3),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.perm_identity_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Birthday :',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.birthday,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.perm_identity_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Joining Day :',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.joiningDay,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.perm_identity_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Passing Hours:',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.passedHours.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.perm_identity_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Major:',
                                  style: TextStyle(
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                model.major,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

