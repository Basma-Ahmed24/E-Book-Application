import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/Navigationbar.dart';
import 'package:untitled/component.dart';
import 'package:untitled/blocs/cubit.dart';
import 'package:untitled/screens/homescreen.dart';
import 'package:untitled/blocs/state.dart';

class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //
    var searchcontroller =TextEditingController();
    return BlocConsumer<bookscubit,bookstates>(
      listener:(context,state){} ,
      builder:(context,state){
        var list =bookscubit.get(context).search;
    return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 20,width: 10,),IconButton(icon:Icon(Icons.west,color: Colors.black26, size: 35),onPressed: (){
      navigateto(context,MyNavigationBar());}),Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 250.0,
        width: 600.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            //set border radius to 50% of square height and width
            image: DecorationImage(
              image: AssetImage("assets/516e6a98c13a730c73117b83e381ab51.jpg"),
              fit: BoxFit.cover,
            )),child: TextField(style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.w500,
        fontSize: 17,),
        decoration: InputDecoration(filled: true,
          fillColor: Colors.white38,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.5,
                  color: Color.fromRGBO(19, 10, 105, 0.7))),
          hintText: "Search by book name",
          prefixIcon: Icon(Icons.search_sharp, size: 35,
            color: Colors.black26,),
          suffixIcon: Icon(Icons.tune_sharp, size: 35,
              color: Colors.black26),),controller: searchcontroller
        ,onChanged:(value){
          bookscubit.get(context).getsearch(value);
        },


      ),),SizedBox(height: 0,),



     Expanded(flex:1,
        child: ConditionalBuilder(condition:state is ! loadingsearchstate ,
        builder: (context)=>ListView.separated(
        itemBuilder: (context,index)=>buildbook(list[index],context),
        separatorBuilder: (context,index)=>Dividor(),
        itemCount:bookscubit.get(context).search.length,
        ),fallback:(context)=>
        Center(child: CircularProgressIndicator())),
        ),],),);
  });}

}