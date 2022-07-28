import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/state.dart';
import 'package:untitled/screens/Navigation_Bar.dart';
import 'package:untitled/web_view.dart';
import '../component.dart';
import '../blocs/cubit.dart';

class BookInformation extends StatelessWidget {
  @override
  String? map;
  bool click =false ;
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<bookscubit, bookstates>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
          condition: state is! loadingstate,
          builder: (context) =>
              page_Content(map: bookscubit.get(context).bookinformation),
          fallback: (context) => Center(child: CircularProgressIndicator())),
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
    print(map.toString());
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    navigateto(context, MyNavigationBar());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                  )),
              SizedBox(
                width: 220,
              ),
              IconButton(
                  onPressed: () {
    {

    (BuildContext context) =>bookscubit().insertToDatabase(
    id: map['id'],
    title:map['title'],
    subtitle: map['subtitle'],
    authors: map['authors'],
    image: map['image'],);
    }},
                  icon: Icon(
                    Icons.favorite_border,
                  )),
              IconButton(
                  onPressed: () {
                    navigateto(context, WebViewScreen(map["url"]));
                  },
                  icon: Icon(
                    Icons.chrome_reader_mode_outlined,
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                width: 200,
                height: 290,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage("${map["image"]}")))),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Column(children: [
              Text(
                "${map["title"]}",
                style: Theme.of(context).textTheme.headline1,
                maxLines: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "By: ${map["authors"]}",
                style: Theme.of(context).textTheme.headline2,
                maxLines: 5,
              )),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Text(
                  "${map["subtitle"]}",
                  style: Theme.of(context).textTheme.headline3,
                  maxLines: 5,
                ),
              )
            ])),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: []),
          ]),
          SizedBox(
            height: 10,
          ),
          Text(
            "Description ",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "${map["description"]}",
            style: Theme.of(context).textTheme.headline2,
            maxLines: 8,
          ),
          SizedBox(
            height: 4,
          ),
          Row(children: [
            SizedBox(
              width: 2,
            ),
            Text(
              "Puublisher: ",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text("${map["publisher"]}",
                style: Theme.of(context).textTheme.headline2)
          ]),
          SizedBox(
            height: 4,
          ),
          Row(children: [
            Text(
              "No of Pages: ",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text("${map["pages"]}",
                style: Theme.of(context).textTheme.headline2)
          ]),
          SizedBox(
            height: 4,
          ),
          Row(children: [
            Text(
              "Year: ",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text("${map["year"]}", style: Theme.of(context).textTheme.headline2)
          ]),
          /*ElevatedButton (
            child: const Icon(Icons.east_outlined,color: Colors.white70,size: 30,), style: ElevatedButton.styleFrom( primary: Color.fromRGBO(74, 43, 195, 1),)

            ,onPressed: () { map["download"];},),*/
        ]));
  }
}
