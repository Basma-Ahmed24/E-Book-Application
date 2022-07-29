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

class page_Content extends StatefulWidget {
  const page_Content({
    Key? key,
    required this.map,
  }) : super(key: key);

  final map;

  @override
  State<page_Content> createState() => _page_ContentState();


}

class _page_ContentState extends State<page_Content> {
  bool click=false;
  @override
  Widget build(BuildContext context) {


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
                  onPressed: ()async {
    {

    (BuildContext context) =>bookscubit().insertToDatabase(


    id: widget.map['id'],
    title:widget.map['title'],
    subtitle: widget.map['subtitle'],
    authors: widget.map['authors'],
    image: widget.map['image'],);
    print(bookscubit().getDataFromDatabase());
    setState(() {

      click=!click;
    });
    }},
                  icon: Icon((click==false)?
                    Icons.favorite_border : Icons.favorite,color: Colors.red,size: 40,
                  )),
              IconButton(
                  onPressed: () {
                    navigateto(context, WebViewScreen(widget.map["url"]));
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
                        image: NetworkImage("${widget.map["image"]}")))),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Column(children: [
              Text(
                "${widget.map["title"]}",
                style: Theme.of(context).textTheme.headline1,
                maxLines: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "By: ${widget.map["authors"]}",
                style: Theme.of(context).textTheme.headline2,
                maxLines: 5,
              )),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Text(
                  "${widget.map["subtitle"]}",
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
            "${widget.map["description"]}",
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
            Text("${widget.map["publisher"]}",
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
            Text("${widget.map["pages"]}",
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
            Text("${widget.map["year"]}", style: Theme.of(context).textTheme.headline2)
          ]),
          /*ElevatedButton (
            child: const Icon(Icons.east_outlined,color: Colors.white70,size: 30,), style: ElevatedButton.styleFrom( primary: Color.fromRGBO(74, 43, 195, 1),)

            ,onPressed: () { map["download"];},),*/
        ]));
  }
}
