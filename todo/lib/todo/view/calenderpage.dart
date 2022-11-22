import 'package:calendar_builder/calendar_builder.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo/view/home.dart';
import 'package:todo/todo/view/taskpage.dart';

import '../widgets/navbar.dart';
import 'alarmpage.dart';

class calenderpage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    body:CbMonthBuilder(

    cbConfig: CbConfig(
    startDate: DateTime(2020),
    endDate: DateTime(2123),
    selectedDate: DateTime(2022, 3, 4),
    selectedYear: DateTime(2022),
    weekStartsFrom: WeekStartsFrom.wednesday,
    disabledDates: [
    DateTime(2022, 1, 7),
    DateTime(2022, 1, 9),
    ],
    eventDates: [
    DateTime(2022, 1, 2),
    DateTime(2022, 1, 2),
    DateTime(2022, 1, 3)
],
highlightedDates: [
DateTime(2022, 1, 6),
DateTime(2022, 1, 3)
]),
monthCustomizer: MonthCustomizer(
padding: const EdgeInsets.all(20),
monthHeaderCustomizer: MonthHeaderCustomizer(
textStyle: const TextStyle(

color: Colors.deepOrange,
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
monthButtonCustomizer: MonthButtonCustomizer(
currentDayColor: Colors.orange,
borderStrokeWidth: 2,
textStyleOnDisabled: const TextStyle(color: Colors.deepOrangeAccent),
highlightedColor: const Color.fromARGB(255, 255, 174, 0)),
monthWeekCustomizer: MonthWeekCustomizer(
textStyle:
const TextStyle(color: Color.fromARGB(255, 255, 174, 0)
))
// monthWidth: 500,
// monthHeight: 200
),
yearDropDownCustomizer: YearDropDownCustomizer(
yearButtonCustomizer: YearButtonCustomizer(
borderColorOnSelected: Colors.deepOrangeAccent,
  textColorOnEnabled: Colors.white,
  textColorOnDisabled: Colors.white,
  textColorOnSelected: Colors.deepOrangeAccent,
),
yearHeaderCustomizer: YearHeaderCustomizer(
titleTextStyle:
const TextStyle(color: Color.fromARGB(255, 255, 174, 0)))),
onYearHeaderExpanded: (isExpanded) {
print('isExpanded ' + isExpanded.toString());
},
onDateClicked: (onDateClicked) {
print('selected date' +
onDateClicked.selectedDate.toString() +
'\n' +
'isSelected ' +
onDateClicked.isSelected.toString() +
'\n' +
'isHighlighted ' +
onDateClicked.isHighlighted.toString() +
'\n' +
'hasEvent ' +
onDateClicked.hasEvent.toString() +
'\n' +
'isCurrentDate ' +
onDateClicked.isCurrentDate.toString() +
'\n' +
'isDisabled ' +
onDateClicked.isDisabled.toString());
},
onYearButtonClicked: (year, isSelected) {
print('selected year ' +
year.toString() +
'\n' +
'isSelected ' +
isSelected.toString());
},
),


      bottomNavigationBar: BottomNavigationBar (

    items: [

    BottomNavigationBarItem( icon :IconButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => home()));} ,icon:Icon(Icons.home,size: 35,color: Colors.deepOrange,)),
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
