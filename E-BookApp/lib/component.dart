
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/blocs/cubit.dart';
import 'package:untitled/screens/bookinfo.dart';
/*dynamic getBookIndex(String id,context){

  for(var i in bookscubit.get(context).recentbook ){
    if(id==i["id"]){

      return i;}


  }

}*/
Widget buildbook(books,context)=>Padding(
  padding: const EdgeInsets.all(0),
  child: Row(children: [
    Container(
        width: 130, height: 150, decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: NetworkImage(
            "${books["image"]}")))
    ),
    SizedBox(width: 1,),
    Expanded(flex:1,
      child: Column( mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TextButton(onPressed:()async{
           bookscubit.get(context).getbookinfo(books["id"]);

          navigateto(context,
            Bookinfo());
          }
           ,child: Text("${books["title"]}", style: GoogleFonts.poppins(
            fontSize:17,
            fontWeight: FontWeight.w700,
            color:Color
                .fromRGBO(19, 10, 105, 0.7)),
          maxLines: 2,),),
          Text("by ${books['authors']}", style: Theme.of(context).textTheme.bodyText2,
          ), Text(
              "${books["subtitle"]}", style: GoogleFonts.poppins(fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black54))
        ],),
    )
  ],),
);



void navigateto(context,widget)=>
Navigator.push(context, MaterialPageRoute(builder: (context)=>
widget,));

Widget Dividor()=>SizedBox(height: 10,);



