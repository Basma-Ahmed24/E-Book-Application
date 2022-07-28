import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/cubit_theme.dart';
import 'package:untitled/screens/Busniss.dart';
import 'package:untitled/screens/History.dart';
import 'package:untitled/screens/Math.dart';
import 'package:untitled/screens/computer_science.dart';
import 'package:untitled/blocs/cubit.dart';
import 'package:untitled/dio_helper.dart';
import 'package:untitled/screens/search.dart';

import 'package:untitled/blocs/state.dart';
import 'package:untitled/screens/Welcome_page.dart';

import 'Navigation_Bar.dart';
import '../component.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<bookscubit, bookstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var Cubit = bookscubit.get(context);
          var list = bookscubit.get(context).recentbook;
          return Scaffold(
            body:
                //Column(children: [SizedBox(height: 70,),Row(children: [SizedBox(width: 20,),Icon(Icons.widgets_outlined,size: 40,color: Colors.black54,),
                //SizedBox(width: 10,),

                Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios_sharp,
                                  ),
                                  onPressed: () {
                                    navigateto(context, Welcomepage());
                                  }),
                              SizedBox(
                                width: 260,
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: () {
                                    ModeChangeCubit.get(context).changeMode();
                                  },
                                  icon: Icon(
                                    Icons.brightness_4_outlined,
                                  ))
                            ],
                          ),
                          SizedBox(
                            width: 50,
                            height: 0,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                            height: 180.0,
                            width: 410.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                //set border radius to 50% of square height and width
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/untitled-nhg-01_4x.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Categories",
                                style: Theme.of(context).textTheme.headline1,
                              )
                            ],
                          ),
                          Row(children: [
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),

                                  //set border radius to 50% of square height and width
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/040828259b15aa838bfc68b664051db0.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),

                                  //set border radius to 50% of square height and width
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/fa691691526776c99476dc53a2b3d486.png"),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),

                                  //set border radius to 50% of square height and width
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/235626e27bb28fb7b0218bf88bc3f276.png"),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 28,
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                height: 70.0,
                                width: 70.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),

                                    //set border radius to 50% of square height and width
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/original-4186a286645b53d39a7d9df81ff042ed.jpg"),
                                        fit: BoxFit.cover)))
                          ]),
                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        bookscubit.get(context).getBusniss();
                                        navigateto(context, Businuss());
                                      },
                                      child: Text("Business",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2))),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: TextButton(
                                    onPressed: () {
                                      navigateto(context, ComputerScience());
                                      bookscubit.get(context).getComputer();
                                    },
                                    child: Text("Computer Science",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2)),
                              ),
                              Expanded(
                                child: TextButton(
                                    onPressed: () {
                                      navigateto(context, Math());
                                      bookscubit.get(context).getMathimatics();
                                    },
                                    child: Text("Math & Science",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2)),
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              Expanded(
                                child: TextButton(
                                    onPressed: () {
                                      navigateto(context, History());
                                      bookscubit.get(context).getHistory();
                                    },
                                    child: Text("History",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2)),
                              ),
                              SizedBox(
                                width: 12,
                                height: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 7,
                                height: 0,
                              ),
                              Text(
                                "Recently Added",
                                style: Theme.of(context).textTheme.headline1,
                              )
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: ConditionalBuilder(
                                condition: state is! loadingstate,
                                builder: (context) => ListView.separated(
                                      itemBuilder: (context, index) =>
                                          buildBook(list[index], context),
                                      separatorBuilder: (context, index) =>
                                          Dividor(),
                                      itemCount: 20,
                                    ),
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator())),
                          ),
                        ])),
          );
        });
  }
}
