import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/blocs/state.dart';
import 'package:untitled/screens/Navigationbar.dart';
import 'package:untitled/screens/homescreen.dart';

import '../component.dart';
import '../blocs/cubit.dart';

class Bookinfo extends StatelessWidget{
  @override
  dynamic map ;

  Widget build(BuildContext context) {



return Scaffold(body: BlocConsumer<bookscubit,bookstates>(listener: (context,state){},
    builder: (context,state) =>
ConditionalBuilder(condition:state is ! loadingstate ,
    builder: (context)=>page_Content(map: bookscubit.get(context).bookinformation),fallback:(context)=>
        Center(child: CircularProgressIndicator())),
    ));
  }

}

class page_Content extends StatelessWidget {
  const page_Content({
    Key? key,
    required this.map,
  }) : super(key: key);

  final map;

  @override
  Widget build(BuildContext context) {
    print (map.toString());
    return     Padding(
    padding: const EdgeInsets.all(0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children:[ SizedBox(height: 30,),Row(children: [ IconButton(onPressed: (){navigateto(context, Homescreen());}, icon: Icon(Icons.arrow_back_ios_sharp,size: 40,color: Colors.black26,)),
              SizedBox(width: 240,)
            ,IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,size: 40,color: Colors.black26,)),
              IconButton(onPressed: (){map["download"];}, icon: Icon(Icons.download_outlined,size: 40,color: Colors.black26,))],)
              ,SizedBox(height: 20,),Row(mainAxisAlignment: MainAxisAlignment.start,children:[Container(
                width: 170, height: 220, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(
                    "${map["image"]}")))
            ),Column(children:[Text("${map["title"]}", style: GoogleFonts.poppins(
        fontSize:20,
        fontWeight: FontWeight.w700,
        color:Color
            .fromRGBO(19, 10, 105, 0.7)),maxLines: 5,)])]),SizedBox(width: 0,),
      SizedBox(height: 15,),SizedBox(height:10,),Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
            ]),
            SizedBox(width: 0 ),

      Text(
          "Description ", style: GoogleFonts.poppins(fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.deepPurple),),SizedBox(height: 4,),
             Text(
            "${map["description"]}", style: GoogleFonts.poppins(fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black54),
               maxLines: 8,    ),
              SizedBox(height: 4,),
            Row(
              children:[  Text("Puublisher: ", style: GoogleFonts.poppins(fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple),), Text(
              "${map["publisher"]}", style: GoogleFonts.poppins(fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54))]),SizedBox(height: 4,),
        Row(
            children:[  Text("No of Pages: ", style: GoogleFonts.poppins(fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple),), Text(
                "${map["pages"]}", style: GoogleFonts.poppins(fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54))]),SizedBox(height: 4,),
              Row(
                  children:[  Text("Year: ", style: GoogleFonts.poppins(fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple),), Text(
                      "${map["year"]}", style: GoogleFonts.poppins(fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54))]),
            /*ElevatedButton (
            child: const Icon(Icons.east_outlined,color: Colors.white70,size: 30,), style: ElevatedButton.styleFrom( primary: Color.fromRGBO(74, 43, 195, 1),)

            ,onPressed: () { map["download"];},),*/

            ]));
  }
}