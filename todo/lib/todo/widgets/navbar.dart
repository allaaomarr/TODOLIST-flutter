import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/alarmpage.dart';
import '../view/calenderpage.dart';
import '../view/taskpage.dart';

class nav extends StatefulWidget {
  const nav({Key? key}) : super(key: key);

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold( bottomNavigationBar: BottomNavigationBar (

    items: [

    BottomNavigationBarItem( icon :IconButton(onPressed: (){} ,icon:Icon(Icons.home,size: 35,color: Colors.deepOrange,)),
    label: 'Home',),

    BottomNavigationBarItem(
    icon: IconButton(onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => taskpage(),));

    }, icon:Icon(Icons.library_books_outlined,size: 35,color: Colors.deepOrange,),),
    label: 'Tasks',
    ),

    BottomNavigationBarItem(
    icon: IconButton(onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => calenderpage(),));

    }, icon:Icon(Icons.calendar_month,size: 35,color: Colors.deepOrange,),),
    label: 'Calender',
    ),

    BottomNavigationBarItem(
    icon: IconButton(onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => alarmpage(),));

    },icon:Icon(Icons.alarm,size: 35,color: Colors.deepOrange,),),
    label: 'alarm',
    ),

    ],
    currentIndex: 2,
    selectedItemColor: Colors.orangeAccent,),
    );
  }
}
