
import 'package:dio/dio.dart';

class Diohelper
{
 static  Dio dio=new Dio();
  static init(){
    dio=Dio(
      BaseOptions(baseUrl:"https://www.dbooks.org/api/" ,
      receiveDataWhenStatusError: true,)
    );

  }

 static Future<Response> getdata(String endPoint)async{
   return await dio.get(endPoint);
  }

}
