import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/state.dart';

import '../dio_helper.dart';

class bookscubit extends Cubit<bookstates> {
  bookscubit() : super(bookinitialstate());
  List<dynamic>recentbook = [];
  List<dynamic>category = [];
  List<dynamic>business = [];
  List<dynamic> math = [];
  List<dynamic>computer = [];

  List<dynamic>search = [];
  Map<dynamic,dynamic> bookinformation={};

  static bookscubit get(context) => BlocProvider.of(context);

  void recentbooks() {
    emit(loadingstate());

    Diohelper.getdata("recent").then((value) {
      recentbook = value.data['books'];

      emit(booksgetrecentbookssucess());
    });
  }

  void getbookinfo(String id) {
    emit(loadingsearchstate());
    Diohelper.getdata("book/$id").then((value) {
      bookinformation = value.data;

      emit(bookinfossucess());
    });
  }

  void getsearch(String valu) {
    emit(loadingsearchstate());
    Diohelper.getdata("search/$valu").then((value) {
      search = value.data['books'];

      emit(searchbookssucess());
    });
  }

  void history() {
    emit(loadingcategorystate());
    Diohelper.getdata("search/History").then((value) {
      category= value.data['books'];
      print(category.length);
      emit(historyssucess());});}
  void buss(){
    emit(loadingbusinseestate());
    Diohelper.getdata("search/Business").then((value) {
      business= value.data['books'];

      emit(businessssucess());});}
  void mathimatics(){
    emit(loadingmathstate());
    Diohelper.getdata("search/Science & Mathimatics").then((value) {
      math= value.data['books'];

      emit(mathsucess());});}
  void comp(){
    emit(loadingcomputerstate());
    Diohelper.getdata("search/Computer Science").then((value) {
      computer= value.data['books'];

      emit(computerssucess());});}
}
