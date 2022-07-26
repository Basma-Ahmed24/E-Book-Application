import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/cubit.dart';
import 'package:untitled/blocs/state.dart';
import 'blocs/bloc_observer.dart';
import 'dio_helper.dart';
import 'screens/welcomepage.dart';

void main() {
  runApp(MyApp());
  BlocOverrides.runZoned(
        () {
      // Use blocs...
    },
    blocObserver: MyBlocObserver()
  );

Diohelper.init();

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

return BlocProvider(create:(BuildContext context)=>
bookscubit()..recentbooks() ,
 child:
      MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:  Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black12,
      ) ,iconTheme: IconThemeData(color: Colors.black12)
          ,textTheme:TextTheme
          ( bodyText2: TextStyle(fontWeight:FontWeight.w700,fontSize: 17,color: Colors.black54)

      )),
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black,

      backgroundColor: Colors.black,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white60,

          backgroundColor: Colors.black,

        ),textTheme:TextTheme
            ( bodyText2: TextStyle(fontWeight:FontWeight.w600,fontSize: 17,color: Colors.white)

          ),iconTheme: IconThemeData(color: Colors.white)



      ),

      home:Welcomepage())) ;}}






