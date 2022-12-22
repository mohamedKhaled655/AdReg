




import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  @required Function function,
  @required String text,
  double radius = 0.0,
}) =>
    Container(
      width: width,
      height: 35.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(text.toUpperCase()),
        //color: background,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defTextFormField({
  @required TextEditingController controller,
  @required TextInputType keyType,

  bool obscureText = false,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function funSuffix,
  Function onsubmitte,
  Function onChange,
  Function onTap,
  @required Function validate,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
          color: kPrimaryColor,
        ),
        suffixIcon: MaterialButton(
            child: Icon(suffix,color: kPrimaryColor,),
          onPressed: funSuffix,
        ),
        ),
      onFieldSubmitted: onsubmitte,
      onChanged: onChange,
      validator: validate,
      onTap: onTap,
    );

void showToast({@required String text,@required ToastStates state,})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.black,
    fontSize: 16.0
);

enum ToastStates {SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      return  color= Colors.green;
      break;
    case ToastStates.ERROR:
      return  color= Colors.red;
      break;
    case ToastStates.WARNING:
      return  color= Colors.amber;
      break;
  }
  return color;
}

/*
Widget BuildTaskItem(Map model,context) => Dismissible(
  key:Key(model["id"].toString()),
  child:Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius: 40.0,

          child: Text("${model["time"]}"),

        ),

        SizedBox(width: 20,),

        Expanded(

          child:   Column(



            mainAxisSize: MainAxisSize.min,



            children: [



              Text(



                "${model["title"]}",



                style: TextStyle(



                    fontSize: 18,



                    fontWeight: FontWeight.bold



                ),



              ),



              Text(



                "${model["date"]}",



                style: TextStyle(







                    color: Colors.grey



                ),



              ),



            ],



          ),

        ),

        SizedBox(width: 20,),



        IconButton(icon: Icon(Icons.done), onPressed: ()

        {

          AppCubit.get(context).updateDataBase(

            status: "done",

            id: model["id"],

          );

        }),

        IconButton(icon: Icon(Icons.archive), onPressed: ()

        {

          AppCubit.get(context).updateDataBase(

            status: "archive",

            id: model["id"],

          );

        }),



      ],

    ),

  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteDataBase(id: model["id"]);
  },
);


/*
Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    Navigator.push(
        context,
        MaterialPageRoute(builder:(context){return WebViewScreen(article['url']);}));
  },
  child:   Padding(



  padding: EdgeInsets.all(20.0),

  child: Row(

  children: [

  Container(

  height: 120.0,

  width: 120.0,

  decoration: BoxDecoration(

  borderRadius: BorderRadiusDirectional.circular(20.0),

  image: DecorationImage(

  image: NetworkImage('${article['urlToImage']}'),

  fit: BoxFit.cover,

  ),

  ),

  ),

  SizedBox(width: 20.0,),

  Expanded(

  child: Container(



  height: 120.0,

  child: Column(

  crossAxisAlignment: CrossAxisAlignment.start,

  mainAxisAlignment: MainAxisAlignment.start,

  children: [

  Expanded(

  child: Text(

  '${article['title']} ',

  maxLines: 3,

  overflow: TextOverflow.ellipsis,

  style: TextStyle(

  fontSize: 18.0,

  fontWeight: FontWeight.w800,

  ),),

  ),

  Text('${article['publishedAt']}',

  style: TextStyle(

  color: Colors.grey

  ),),

  ],

  ),

  ),

  ),

  ],

  ),

  ),
);


Widget articleBuilder(list,context)=>ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=>ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=> Divider(
        color: Colors.deepOrange,
      ),
      itemCount: 10
  ),
  fallback: (context)=> Center(child: CircularProgressIndicator()),
);
*/
*/