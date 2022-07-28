import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/cubit.dart';
import 'package:untitled/blocs/cubit_theme.dart';
import 'blocs/bloc_observer.dart';
import 'blocs/state_theme.dart';
import 'dio_helper.dart';
import 'screens/Welcome_page.dart';

void main() {
  runApp(MyApp());
  BlocOverrides.runZoned(() {
    // Use blocs...
  }, blocObserver: MyBlocObserver());

  Diohelper.init();


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create:(BuildContext context)=> bookscubit()..initialize() ,
          ),
          BlocProvider(create: (context) => ModeChangeCubit()..changeMode())
        ],
        child: BlocConsumer<ModeChangeCubit, ModeChangerStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      appBarTheme: AppBarTheme(
                          backgroundColor: Colors.white, elevation: 0),
                      iconTheme: IconThemeData(color: Colors.black26, size: 40),
                      textTheme: TextTheme(
                        headline1: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                        headline2: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        headline3: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          backgroundColor: Colors.black26,
                          selectedItemColor: Colors.deepPurple,
                          unselectedItemColor: Colors.black45,
                          type: BottomNavigationBarType.shifting)),
                  darkTheme: ThemeData(
                      scaffoldBackgroundColor: Colors.black12,
                      appBarTheme: AppBarTheme(
                          backgroundColor: Colors.black54, elevation: 0),
                      textTheme: TextTheme(
                          headline1: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                          headline2: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                          headline3: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          )),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          backgroundColor: Colors.black26,
                          selectedItemColor: Colors.cyan,
                          unselectedItemColor: Colors.black54,
                          type: BottomNavigationBarType.shifting),
                      iconTheme:
                          IconThemeData(color: Colors.white70, size: 40)),
                  themeMode: ModeChangeCubit.get(context).isdark
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  home: Welcomepage());
            }));
  }
}
