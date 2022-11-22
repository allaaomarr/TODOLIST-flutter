import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:snack/snack.dart';
import 'package:todo/todo/view/home.dart';
import 'package:todo/todo/view/taskpage.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

import 'calenderpage.dart';
class alarmpage extends StatefulWidget {
  const alarmpage({Key? key}) : super(key: key);

  @override
  State<alarmpage> createState() => _alarmpageState();
}

class _alarmpageState extends State<alarmpage> {
int alarmIntValue =0;
int alarmIntSeconds =0;
int _currentIntValue = 10;
final timer_bar = SnackBar(content: Text('Timer Successfully created'),);
final alert_bar = SnackBar(content: Text('Alarm Successfully created'),);
  @override
  Widget build(BuildContext context) {

    return
     Scaffold(
         appBar:  AppBar(backgroundColor: Colors.deepOrange,title: Text("Your Phone Alarm"),),

      body:   SingleChildScrollView(child :Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0,0),
        child: Center(
            child :
           Column(children: <Widget>[
         //    Icon(Icons.access_time, size: 300,color: Colors.white,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                 height: 230,
                 width: 230,
                 decoration: BoxDecoration(
color: Colors.black,
                   borderRadius: BorderRadius.circular(110),
                   border: Border.all(color: Colors.deepOrangeAccent, width: 5),
                     boxShadow:[ BoxShadow(
                         blurRadius: 20,
                         color: Colors.deepOrange

                     )]
                 ),


                margin: const EdgeInsets.all(10),
                child: Center(
                  child: TextButton(

                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                //Text("Hour"),
                                NumberPicker(
                                  value: alarmIntValue,
                                  minValue: 0,
                                  maxValue: 24,
                                  step: 1,
                                  zeroPad: true,
                                  itemHeight: 40,
                                  haptics: true,
                                  onChanged: (value) => setState(() =>alarmIntValue = value),
                                ),
                              ],
                            ),
                           // VerticalDivider(),
                            NumberPicker(
                              value: alarmIntSeconds,
                              minValue: 0,
                              maxValue: 60,
                            itemHeight: 40,
                              zeroPad: true,
                              step: 1,
                              haptics: true,
                              onChanged: (value) => setState(() =>alarmIntSeconds = value),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(



                          child: const Text(

                            'Create alarm ',
                            style: TextStyle(fontSize: 17.0,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      FlutterAlarmClock.createAlarm(alarmIntValue,alarmIntSeconds);
                      alert_bar.show(context);
                    },
                  ),
                ),
              ),


            ],
          ),
        ),
             Row(
               children: [
                 Container(

                   height: 250,
                   width: 150,
                   decoration: BoxDecoration(
color: Colors.black,
                     borderRadius: BorderRadius.circular(110),
                     border: Border.all(color: Colors.deepOrangeAccent, width: 5),
                     boxShadow:[ BoxShadow(
                       blurRadius: 20,
                       color: Colors.deepOrange

                     )]
                   ),
                   margin: const EdgeInsets.all(15),
                   child: TextButton(

                     child: Column(
                       children: [
                         SingleChildScrollView(
                           child: NumberPicker(
                             value: _currentIntValue,
                             minValue: 0,
                             maxValue: 100,
                             step: 10,
                             haptics: true,
                             onChanged: (value) => setState(() => _currentIntValue = value),
                           ),
                         ),
                         const Text(
                           'Create timer',
                           style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                         ),
                       ],
                     ),
                     onPressed: () {

                       FlutterAlarmClock.createTimer(_currentIntValue);
                       timer_bar.show(context);
                     },
                   ),
                 ),
                 Column(
                   children: [
                     Container(
                       height: 100,
                       width: 150,
                       decoration: BoxDecoration(
                           color: Colors.deepOrangeAccent,
                           borderRadius: BorderRadius.circular(110),
                           border: Border.all(color: Colors.greenAccent, width: 5),
                           boxShadow:[ BoxShadow(
                               blurRadius: 20,
                               color: Colors.greenAccent

                           )]
                       ),
                       margin: const EdgeInsets.all(15),
                       child: TextButton(
                         child: const Text(
                           'Show alarms',
                           style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold),
                         ),
                         onPressed: () {
                           FlutterAlarmClock.showAlarms();
                         },
                       ),
                     ),


                     Container(
                       height: 100,
                       width: 150,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(110),
                           border: Border.all(color: Colors.black, width: 5),
                           boxShadow:[ BoxShadow(
                               blurRadius: 20,
                               color: Colors.black

                           )]
                       ),
                       margin: const EdgeInsets.all(15),
                       child: TextButton(
                         child: const Text(
                           'Show Timers',
                           style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.bold),
                         ),
                         onPressed: () {
                           FlutterAlarmClock.showTimers();
                         },
                       ),
                     ),
                   ],
                 ),
               ],
             ),

    ])),
      ),

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
         currentIndex: 3,
         selectedItemColor: Colors.orangeAccent,),
       );
  }
}
