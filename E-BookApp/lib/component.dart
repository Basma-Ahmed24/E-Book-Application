import 'package:flutter/material.dart';
import 'package:untitled/blocs/cubit.dart';
import 'package:untitled/screens/book_information.dart';

Widget buildBook(books, context) => Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Container(
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage("${books["image"]}")))),
          SizedBox(
            width: 1,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () async {
                    bookscubit.get(context).getBookinfo(books["id"]);

                    navigateto(context,BookInformation());
                  },
                  child: Text(
                    "${books["title"]}",
                    style: Theme.of(context).textTheme.headline1,
                    maxLines: 2,
                  ),
                ),
                Text(
                  "by ${books['authors']}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text("${books["subtitle"]}",
                    style: Theme.of(context).textTheme.headline3)
              ],
            ),
          )
        ],
      ),
    );

void navigateto(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

Widget Dividor() => SizedBox(
      height: 10,
    );
