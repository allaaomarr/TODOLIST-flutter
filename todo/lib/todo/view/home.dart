
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snack/snack.dart';
import 'package:todo/todo/view/alarmpage.dart';
import 'package:todo/todo/view/calenderpage.dart';
import 'package:todo/todo/view/taskpage.dart';
import 'package:flutter/painting.dart';
import '../controller/tasksDB.dart';
import '../model/taskmodel.dart';
import '../widgets/textfield.dart';
import 'package:date_time_format/date_time_format.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}
//TextEditingController titlecontroller =TextEditingController();
TextEditingController taskcontroller =TextEditingController();

class _homeState extends State<home> {
  var  task_controller = TextEditingController();
    var  time_controller = TextEditingController();
    var  date_controller = TextEditingController();
  final dateTime = DateTime.now();
    var status_controller = TextEditingController();
    bool button =false;
    var fkey =GlobalKey<FormState>();
    var skey = GlobalKey<ScaffoldState>();
    List<Tasks> datas =[];
    int currentIndex =0 ;
    List Screen =[];
    bool fetching =true;
  final bar = SnackBar(content: Text('Task Successfully added'),);
    late Data db;
    @override
    void initState(){
      super.initState();
      db = Data();
      getData();
    }
    void getData ()async{
      datas = await db.getdata();
      setState((){
        fetching =false;});
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(backgroundColor: Colors.deepOrange,title: Text("To Do"),),
        body:Center(child: Icon(Icons.calendar_month,size: 300,color: Colors.white,),),


        key: skey,
        floatingActionButton:FloatingActionButton(
           backgroundColor: Colors.deepOrange,
            child:  Icon(Icons.add_circle_outline_rounded,size: 40,),


            onPressed:(){
              if(button){
                if(fkey.currentState!.validate()){
                  Navigator.pop(context);

                }
              }else{
                skey.currentState!.showBottomSheet((context) => Container(
                  margin:EdgeInsets.all(20),
                  child:Form(
                    key:fkey,
                    child:
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        inputfield(
                          label:"Task",

                          iconButton:IconButton(icon: Icon(Icons.task), onPressed: () {

                          },),
                          keyboard:TextInputType.text,
                          controller:task_controller,
                          validate:(String value){
                            if(value.isEmpty){
                              return "task must not be empty";
                            }else{
                              return null;
                            }
                          } ,

                        ),
                        SizedBox(height: 20,),
                        inputfield(
                          label: "Time",
                          iconButton: IconButton(icon: Icon(Icons.access_time),onPressed: (){
                            showTimePicker(

                                context: context,
                                initialTime:TimeOfDay.now()
                            ).then((value) => time_controller.text=value!.format(context).toString());
                          },),
                          // icon:Icons.timer,
                          keyboard:TextInputType.datetime,
                          controller:time_controller,
                          validate:(String value){
                            if(value.isEmpty){
                              return "task must not be empty";
                            }else{
                              return null;
                            }
                          },),


                        SizedBox(height: 20,),
                        inputfield(
                          label: "Date",
                          iconButton: IconButton(icon: Icon(Icons.calendar_month),onPressed: () {

                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                builder: (context, child) =>
                                    Theme(
                                      child: Container(child: child,),
                                      data: ThemeData().copyWith(
                                          colorScheme: ColorScheme.dark(
                                              primary: Colors.white,
                                              onPrimary: Colors.black,
                                              surface: Colors.deepOrange,
                                              onSurface: Colors.white,
                                          ),
                                          dialogBackgroundColor: Colors.black
                                      ),
                                    )
                            ).then((value) {
                             date_controller.text =
                                 DateTimeFormat.format( dateTime,format: 'D, M j, H:i');



                            },

                            );

                          }
      ),
                          keyboard:TextInputType.datetime,
                          controller:date_controller,
                          validate:(String value){
                            if(value.isEmpty){
                              return "task must not be empty";
                            }else{
                              return null;
                            }
                          },
      ),

                        SizedBox(height: 20,),

                        // MyFormfield(task_controller, ),
                        ElevatedButton(
                          onPressed: (){
                          db.AddDB(Tasks(title: task_controller.text,time: time_controller.text,date: date_controller.text,status: "task"));
                          bar.show(context);
                          Navigator.push(context,MaterialPageRoute(builder: (context) => taskpage(),));
                        },
                          style: ElevatedButton.styleFrom(

                          primary: Colors.deepOrange,
                          ),
                          child: Icon(Icons.add_task,color: Colors.black,),),
                      ],
                    ),
                  ),
                ),
                );
              }
            }


        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        bottomNavigationBar: BottomNavigationBar (

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
          currentIndex: 0,
          selectedItemColor: Colors.orangeAccent,),
      );
    }




  }


