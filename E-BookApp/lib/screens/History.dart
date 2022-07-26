import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/blocs/state.dart';

import 'Navigationbar.dart';
import '../component.dart';
import '../blocs/cubit.dart';

class History extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<bookscubit,bookstates>(
        listener:(context,state){} ,
    builder:(context,state){
    var list =bookscubit.get(context).category;
    return Scaffold( body: Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 20,width: 10,),Row(
      children:[ IconButton(icon:Icon(Icons.west,color: Colors.black26, size: 35),onPressed: (){
      navigateto(context,MyNavigationBar());}), SizedBox(width: 110,),Text("History", style: GoogleFonts.poppins(
          fontSize: 25, fontWeight: FontWeight.w600, color: Color
          .fromRGBO(19, 10, 105, 0.7)),), SizedBox(width: 90,),IconButton(icon:Icon(Icons.search,color: Colors.black26, size: 35),onPressed: (){bookscubit.get(context).history();
       }),
    ]),Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    height: 200.0, width: 600.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    //set border radius to 50% of square height and width
    image: DecorationImage(
    image: AssetImage("assets/original-4186a286645b53d39a7d9df81ff042ed.jpg"),
    fit: BoxFit.cover,)
            )


            ),Expanded(flex:1,
          child: ConditionalBuilder(condition:state is ! loadingsearchstate ,
              builder: (context)=>ListView.separated(
                itemBuilder: (context,index)=>buildbook(list[index],context),
                separatorBuilder: (context,index)=>Dividor(),
                itemCount:bookscubit.get(context).category.length,
              ),fallback:(context)=>
                  Center(child: CircularProgressIndicator())),
        ), ])
    );});}

}