import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:untitled/screens/favouritescreen.dart';
import 'package:untitled/screens/homescreen.dart';


class MyNavigationBar extends StatefulWidget {


  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _pageindex = 0;
  List<Widget>  _widgetOptions =
  [
   Homescreen(),
    Favouritescreen(),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_pageindex),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(

          color: Colors.white10,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),),
        child:
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    IconButton(
    enableFeedback: false,
    onPressed: () {
    setState(() {
    _pageindex = 0;
    });
    },
    icon: _pageindex== 0
    ? const Icon(
    Icons.home,
    color:Color.fromRGBO(19, 10, 105, 0.7),
    size: 40,
    )
        : const Icon(
    Icons.home_outlined,
    color: Colors.black26,
    size: 35,
    ),
    ),
    IconButton(
    enableFeedback: false,
    onPressed: () {
    setState(() {
    _pageindex = 1;
    });
    },
    icon: _pageindex == 1
    ? const Icon(
    Icons.favorite,
    color: Color.fromRGBO(19, 10, 105, 0.7),
    size: 40,
    )
        : const Icon(
        Icons.favorite_border,
    color: Colors.black26,
    size: 35,
    ),
    ),
    IconButton(
    enableFeedback: false,
    onPressed: () {
    setState(() {
    _pageindex = 2;
    });
    },
    icon: _pageindex == 2
    ? const Icon(
    Icons.download,
    color: Color.fromRGBO(19, 10, 105, 0.7),
    size: 40,
    )
        : const Icon(
    Icons.download_outlined,
    color: Colors.black26,
    size: 35,
    ),
    ),
    ],
    ),)
    );
  }
}











