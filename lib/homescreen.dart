import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: //Column(children: [SizedBox(height: 70,),Row(children: [SizedBox(width: 20,),Icon(Icons.widgets_outlined,size: 40,color: Colors.black54,),
        //SizedBox(width: 10,),
      Padding(padding: EdgeInsets.all(0),child:Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [SizedBox(height: 60,),
        Row(children:[SizedBox(width: 20),Text("Find a best book for you",style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w600,color: Color.fromRGBO(19, 10, 105, 0.7)),)],),
        SizedBox(width: 50,height: 10,),Container(margin:EdgeInsets.fromLTRB(0, 0, 0, 1),
    height: 200.0,
    width: 410.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    //set border radius to 50% of square height and width
    image: DecorationImage(
    image: AssetImage("assets/untitled-nhg-01_4x.jpg"),
    fit: BoxFit.cover)),child:TextField(style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,
          fontSize: 17,),decoration:InputDecoration(filled: true,fillColor: Colors.white38,border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:2.5,color: Color.fromRGBO(19, 10, 105, 0.7))),
          hintText: "Search by book name",prefixIcon: Icon(Icons.search_sharp,size: 35,color: Colors.black26,),suffixIcon: Icon(Icons.tune_sharp,size: 35,color: Colors.black26),)
        ))
    ,SizedBox(height: 20,),Row(children: [SizedBox(width: 7,),Text("Categories",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,color: Color.fromRGBO(19, 10, 105, 0.7)),)],),Row(children: [
      SizedBox(width: 7,), Container( margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),

            //set border radius to 50% of square height and width
            image: DecorationImage(
                image: AssetImage("assets/040828259b15aa838bfc68b664051db0.jpg"),
                fit: BoxFit.cover)),

            ),SizedBox(width: 10,),



          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),

                //set border radius to 50% of square height and width
                image: DecorationImage(
                    image: AssetImage("assets/image_processing20210521-10039-1hqtcbf.png"),
                    fit: BoxFit.cover)),),SizedBox(width: 10,),



          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),

                //set border radius to 50% of square height and width
                image: DecorationImage(
                    image: AssetImage("assets/2b524838094f3ba96d312f477f8d07fe.png"),
                    fit: BoxFit.cover)),),SizedBox(width: 10,),



          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),

                //set border radius to 50% of square height and width
                image: DecorationImage(
                    image: AssetImage("assets/17e56a9e3a12aa55c1732cefa29d0355.jpeg"),
                    fit: BoxFit.cover)),),SizedBox(width: 10,),



          Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),

                //set border radius to 50% of square height and width
                image: DecorationImage(
                    image: AssetImage("assets/008f2ec9b01f0b3556622bd82a44abe6.jpg"),
                    fit: BoxFit.cover)))]),SizedBox(height: 0,),Row(children:[SizedBox(width: 0,),TextButton(onPressed:(){},child: Text(
    "Business",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54))
        ),SizedBox(width: 0,),TextButton(onPressed:(){},child: Text(
    "Education",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black54
    ),
            )

          ),SizedBox(width: 0,),TextButton(onPressed:(){},child: Text(
          "Fantasy",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54
        ),
        )

        ),SizedBox(width: 0,),TextButton(onPressed:(){},child: Text(
          "Romantic",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54
        ),
        )

        ),SizedBox(width: 0,),TextButton(onPressed:(){},child: Text(
          "Children",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54
        ),
        )

        ) ],),Row(children: [SizedBox(width: 7,),Text("Recently Added",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,color: Color.fromRGBO(19, 10, 105, 0.7))),],)],),));}}
