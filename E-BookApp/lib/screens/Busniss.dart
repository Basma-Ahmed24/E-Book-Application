import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/state.dart';
import 'package:untitled/screens/search.dart';
import 'Navigation_Bar.dart';
import '../component.dart';
import '../blocs/cubit.dart';

class Businuss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<bookscubit, bookstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = bookscubit.get(context).business;
          return Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                Row(children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        navigateto(context, MyNavigationBar());
                      }),
                  SizedBox(
                    width: 90,
                  ),
                  Text("Business",
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(
                    width: 90,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        navigateto(context, SearchScreen());
                      }),
                ]),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 200.0,
                    width: 600.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //set border radius to 50% of square height and width
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/040828259b15aa838bfc68b664051db0.jpg"),
                          fit: BoxFit.cover,
                        ))),
                Expanded(
                  flex: 1,
                  child: ConditionalBuilder(
                      condition: state is! loadingsearchstate,
                      builder: (context) => ListView.separated(
                            itemBuilder: (context, index) =>
                                buildBook(list[index], context),
                            separatorBuilder: (context, index) => Dividor(),
                            itemCount: bookscubit.get(context).business.length,
                          ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator())),
                ),
              ]));
        });
  }
}
