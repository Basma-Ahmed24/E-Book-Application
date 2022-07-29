
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/blocs/state.dart';
import '../dio_helper.dart';

class bookscubit extends Cubit<bookstates> {
  bookscubit() : super(bookinitialstate());
  List<dynamic> recentbook = [];
  List<dynamic> history = [];
  List<dynamic> business = [];
  List<dynamic> math = [];
  List<dynamic> computer = [];

  List<dynamic> search = [];
  Map<String,dynamic> bookinformation = {};

  static bookscubit get(context) => BlocProvider.of(context);

  void recentBooks() {
    emit(loadingstate());

    Diohelper.getdata("recent").then((value) {
      recentbook = value.data['books'];

      emit(booksgetrecentbookssucess());
    });
  }

  void getBookinfo(String id) {
    emit(loadingsearchstate());
    Diohelper.getdata("book/$id").then((value) {
      bookinformation = value.data;

      emit(bookinfossucess());
    });
  }

  void getSearch(String valu) {
    emit(loadingsearchstate());
    Diohelper.getdata("search/$valu").then((value) {
      search = value.data['books'];

      emit(searchbookssucess());
    });
  }

  void getHistory() {
    emit(loadingcategorystate());
    Diohelper.getdata("search/History").then((value) {
      history = value.data['books'];

      emit(historyssucess());
    });
  }

  void getBusniss() {
    emit(loadingbusinseestate());
    Diohelper.getdata("search/Business").then((value) {
      business = value.data['books'];

      emit(businessssucess());
    });
  }

  void getMathimatics() {
    emit(loadingmathstate());
    Diohelper.getdata("search/Science & Mathimatics").then((value) {
      math = value.data['books'];

      emit(mathsucess());
    });
  }

  void getComputer() {
    emit(loadingcomputerstate());
    Diohelper.getdata("search/Computer Science").then((value) {
      computer = value.data['books'];

      emit(computerssucess());
    });
  }
  late Database database;
  List<Map> tasks = [];
// data base


  Future<void> createDatabase()
  async {
    await openDatabase(
        'fav.db',
        version: 1,
        onCreate: (database, version)
        {
          print('database created');
          database.execute('''
    CREATE TABLE fav (
    id TEXT NOT NULL PRIMARY KEY,
    title TEXT ,
    subtitle TEXT ,
    authors TEXT  ,
    image TEXT 
     )''').then((value) {
            print('table created');
          }).catchError((error){
            print('Error when Creating Table ${error.toString()}');
          });
        },
        onOpen: (database){
          print('database opened');
        }
    ).then((value)
    {
      database = value;
      emit(CreateDatabaseState());
    });
    print(database.toString());
  }

  Future <void> insertToDatabase ({
    required String id,
    required String title,
    required String subtitle,
    required String authors,
    required String image,
  })
  async {
    database.transaction((txn)
    {
      txn.rawInsert(
          'INSERT INTO fav(id,title,subtitle,authors,image)VALUES("$id","$title","$subtitle","$authors","$image")'
      ).then((value) {
        print('inserted successfully');
        emit(InsertDatabaseState());

      }).catchError((error)
      {
        print('Error when Inserting Record ${error.toString()}');
      });

      return Future(() => null);
    });
  }

  Future<List<Map>> getDataFromDatabase() async
  {
    var i = await database.rawQuery('SELECT * FROM fav');
    print(i.toString());
    return i;
  }


  bool click = false;
  IconData fabIcon = Icons.favorite;

  void ChangeBottomState({
    required bool isClick,
    required IconData icon,})
  {
    click= isClick;
    fabIcon = icon;

    emit(ChangeBottomFavState());
  }
  Future<void> initialize()async{
   await createDatabase();
    recentBooks();
    print("initialize");
  }
}


