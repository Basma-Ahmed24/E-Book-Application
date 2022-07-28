import 'package:flutter/material.dart';
import 'package:untitled/screens/favourite.dart';
import 'package:untitled/screens/HomeScreen.dart';
import 'package:untitled/screens/search.dart';

import 'favourite.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _pageindex = 0;

  List<Widget> _widgetOptions = [
    Homescreen(),
    FavouriteScreen(),
    SearchScreen()
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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _pageindex = 0;
                  });
                },
                icon: _pageindex == 0
                    ? const Icon(
                        Icons.home,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.home_outlined,
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
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
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
                        Icons.search,
                        color: Colors.blueGrey,
                      )
                    : const Icon(
                        Icons.search_sharp,
                      ),
              ),
            ],
          ),
        ));
  }
}
