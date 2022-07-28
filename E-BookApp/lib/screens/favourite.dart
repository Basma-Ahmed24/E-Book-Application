

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/blocs/state.dart';
import 'package:untitled/screens/Navigation_Bar.dart';

import '../component.dart';
import '../blocs/cubit.dart';

class FavouriteScreen extends StatelessWidget{


  @override
  void initState(context) {

    init(context);
  }
  var list=[];
  void init(context)async{
    list = await bookscubit.get(context).getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<bookscubit,bookstates>(
      listener:(context,state){} ,
      builder:(context,state){
        return Scaffold(
          body:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              const SizedBox(height: 30,width: 10,),
              Row(
                children:
                [ IconButton(
                    icon:const Icon(
                        Icons.arrow_back_ios_sharp),
                    onPressed: (){
                      navigateto(context,MyNavigationBar());}),
                  const SizedBox(width: 100,),
                  Text("Favourites", style: Theme.of(context).textTheme.headline1,
                  ),

                ],),Container(margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 200.0, width: 600.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //set border radius to 50% of square height and width
                image: const DecorationImage(
                  image: AssetImage("assets/image_processing20200213-19308-g7nxqo.gif"),
                  fit: BoxFit.cover,),),
            ),
              Expanded(flex:1,
                child: ConditionalBuilder(condition:state is ! loadingsearchstate ,
                  builder: (context)=>ListView.separated(
                    itemBuilder: (context,index)=>buildBook(list[index],context),
                    separatorBuilder: (context,index)=>Dividor(),
                    itemCount:list.length,
                  ),fallback:(context)=>
                  const Center(child: CircularProgressIndicator(),),),
              ), ],),
        );},);}

}