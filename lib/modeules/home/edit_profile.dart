import 'package:advising_academy/shared/component/components.dart';
import 'package:advising_academy/shared/component/constains.dart';
import 'package:advising_academy/shared/styles/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';


import '../../layouts/home/home_layout.dart';
import '../../models/student_info_model.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

StudentInfoStates st;
class EditProfile extends StatelessWidget {

  const EditProfile({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>StudentInfoCubit()..GetStudentInfo(),
      child: BlocConsumer<StudentInfoCubit, StudentInfoStates>(
        listener: (BuildContext context, state) {

        },
        builder: (BuildContext context, state) {
          var cubit = StudentInfoCubit.get(context);


          return Scaffold(
            appBar:  NewGradientAppBar(
              title: Text("Edit Profile"),
          titleSpacing: 5.0,
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              // cubit.reloadProfileData();
              // cubit.GetStudentInfo();
              StudentInfoCubit.get(context).loadResources();
              // BlocProvider(create: (BuildContext context)=>StudentInfoCubit()..GetStudentInfo(),);
             // Navigator.pop(context);

              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return HomeLayout();
                  }));

            },
          ),
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextButton(
            //       onPressed: (){
            //       //  cubit.updateProfile();
            //
            //       },
            //       child: Text("UPDATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            //     style:ButtonStyle(
            //       //backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            //     ) ,
            //   ),
            // ),
          ],
          gradient: LinearGradient(colors: appBarColorStudent,),

          ),

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

  var cubit = StudentInfoCubit.get(context);

 cubit.emailController.text=model.email;
  cubit.phoneController.text=model.phone;
  cubit.addressController.text=model.address;
  cubit.ssnController.text=model.ssn.toString();
  cubit.nationalityController.text=model.nationality;

  Color color=Color(0xFFDF7861);
  name=model.englishName;
  email=model.email;
  imageProfile='https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1656758279~exp=1656758879~hmac=80bee82db76b0849e112e081e824a39f80a90c393aaf404c0417248900555118&w=996';
  return SingleChildScrollView(
    child: Column(
      children: [

        (st is UpdateProfileLoadingState)?LinearProgressIndicator(color: Colors.blue):Container(),


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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          onPressed: (){},
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
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
                  CircleAvatar(
                    radius: 20,

                    child: IconButton(
                      icon: Icon(Icons.camera_alt_outlined),
                      onPressed: (){},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10.0,
        ),

        Text(
          (model.englishName !=null)? model.englishName:"",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        SizedBox(
          height: 5.0,
        ),

        Divider(),



        SizedBox(
          height: 5.0,
        ),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defTextFormField(
                controller: cubit.emailController,
                label: "Email",
                keyType: TextInputType.emailAddress,
                prefix: Icons.email_outlined,

                validate: (String value){
                  if(value.isEmpty)
                  {
                    return "Enter Your user Email ";
                  }
                  return null;
                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defTextFormField(
                controller: cubit.phoneController,
                label: "Phone",
                keyType: TextInputType.phone,
                prefix: Icons.phone,

                validate: (String value){
                  if(value.isEmpty)
                  {
                    return "Enter Your user Phone Number ";
                  }
                  return null;
                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defTextFormField(
                controller: cubit.addressController,
                label: "Address",
                keyType: TextInputType.text,
                prefix: Icons.location_city_rounded,

                validate: (String value){
                  if(value.isEmpty)
                  {
                    return "Enter Your user Address ";
                  }
                  return null;
                },

              ),
            ),

            Row(
              children: [Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: (){
                      cubit.updateProfile(
                        cubit.emailController.text,
                        cubit.ssnController.text,
                        cubit.addressController.text,
                        cubit.phoneController.text,
                        cubit.nationalityController.text,
                        "123456",
                      );

                      cubit.reloadProfileData();
                      StudentInfoCubit.get(context).loadResources();

                    },
                    child: Text("UPDATE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.withAlpha(50)),
                    ) ,
                  ),
                ),
              ),],
            ),



          ],
        ),
      ],
    ),
  );
}

