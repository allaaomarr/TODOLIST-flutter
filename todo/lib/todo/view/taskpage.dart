import 'package:alert_dialog/alert_dialog.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snack/snack.dart';
import 'package:todo/todo/view/alarmpage.dart';
import 'package:todo/todo/view/home.dart';
import 'package:todo/todo/view/calenderpage.dart';
import 'package:todo/todo/widgets/textfield.dart';
import '../controller/tasksDB.dart';
import '../model/taskmodel.dart';

class taskpage extends StatefulWidget {
  const taskpage({Key? key}) : super(key: key);

  @override
  State<taskpage> createState() => _taskpageState();
}

late final Function delete;

class _taskpageState extends State<taskpage> {
  var  task_controller = TextEditingController();
  var  time_controller = TextEditingController();
  var  date_controller = TextEditingController();
  var status_controller = TextEditingController();
  final dateTime = DateTime.now();
  List<Tasks> datas = [];
  int currentIndex = 0;
  final bar = SnackBar(content: Text('Task Successfully deleted'),);
//final Function delete;
  late final int index;
  bool fetching = true;
  bool end_task = false;
  bool value = false;
  var check;
  late Data db;


  @override
  void initState() {
    super.initState();
    db = Data();
    getData();
  }

  void getData() async {
    datas = await db.getdata();
    setState(() {
      fetching = false;
    });
  }
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    check = end_task
        ? Icon(Icons.check_circle, color: Colors.greenAccent)
        : Icon(Icons.circle_outlined, color: Colors.deepOrange);
    return Scaffold(
    //  backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Up Coming"),
      ),
      body: fetching
          ? CircularProgressIndicator()
          : Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),

              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: datas.length,
                  itemBuilder: (BuildContext context, int index) {

                    return
                    /*  CheckboxListTile(value: ischecked
                          , onChanged: (newBool) {
                      setState(() {
                        ischecked = newBool;
                      });},
                          title :*/Card(

                        margin: EdgeInsetsDirectional.all(5),
                        child: Container(
                          padding: EdgeInsetsDirectional.all(5),
                          width: 100,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 5),

                             ),

                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [

                                  /*    IconButton(

                                          onPressed: () {

                                           //   toggle_mark(datas[index]);

                                          },
                                          icon: check),*/
                            /*  Checkbox(
                                value: this.ischecked,
                                onChanged: (newBool) {
                                  setState(() {
                                  ischecked = newBool;
                                  });
                                },
                              ),*/ ///TODO CHECK MARK FOR DONE
                                      Text(
                                        datas[index].title.toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),


                                    ],
                                  ),

                                  Row(children: [
                                    Row(children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.calendar_month,
                                              size: 20, color: Colors.deepOrange)),
                                      Text(
                                        datas[index].date.toString(),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),

                                    ]),

                                    Row(children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.alarm,
                                            size: 20, color: Colors.deepOrange),
                                      ),
                                      Text(
                                        datas[index].time.toString(),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ]),



                                  ])
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        edit(datas[index],index);

                                      },
                                      icon:
                                      Icon(Icons.edit, color: Colors.orangeAccent,size: 25,)),
                                  IconButton(
                                      onPressed: () {
                                        delete(index);
                                         bar.show(context);
                                      },
                                      icon:
                                      Icon(Icons.delete_outline, color: Colors.orangeAccent,size: 25,)),
                                ],
                              ),
                            ],
                          ),
                        ));
                  }
                  //   SizedBox(height: 10,);
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
        currentIndex: 1,
        selectedItemColor: Colors.orangeAccent,
      ),
    );
  }

  delete(int index) {
    debugPrint("Deleted!");
    db.delete(datas[index].id!);
    setState(() {
      datas.removeAt(index);
    });
  }



  edit(Tasks item, int index) {
    task_controller.text = datas[index].title!;
    time_controller.text = datas[index].time!;
    date_controller.text = datas[index].date!;
    var alert = AlertDialog(
      title: new Text("Update note"),
      content: Column(
        children: <Widget>[
          new Expanded(
            child: new TextField(

              controller: task_controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: task_controller.text,
                labelStyle:TextStyle(fontSize:20,color: Colors.deepOrange,),
                hintText: "eg. Update note",
                icon:  new Icon(Icons.update,color: Colors.deepOrange,),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                  borderRadius:BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          new Expanded(
            child: new TextField(
              controller: time_controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: time_controller.text,
                labelStyle:TextStyle(fontSize:20,color: Colors.deepOrange,),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                  borderRadius:BorderRadius.circular(20),
                ),
                hintText: "eg. Update note",
                icon:  IconButton(icon: Icon(Icons.access_time,color: Colors.deepOrange,),onPressed: (){
                  showTimePicker(
                      context: context,
                      initialTime:TimeOfDay.now()
                  ).then((value) => time_controller.text=value!.format(context).toString());
                },),
              ),
            ),
          ),
          new Expanded(
            child: new TextField(
              controller: date_controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: date_controller.text ,
                labelStyle:TextStyle(fontSize:20,color: Colors.deepOrange,),
                hintText: "eg. Update note",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                  borderRadius:BorderRadius.circular(20),
                ),
                icon: IconButton(icon: Icon(Icons.calendar_month,color: Colors.deepOrange,),onPressed: () {

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
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(

            primary: Colors.deepOrange,
          ),
          onPressed: () async {
            Tasks updateItem = Tasks.fromMap({
              "title": task_controller.text,
              "time" : time_controller.text,
              "date" : date_controller.text,
              "id": item.id
            });
            await db.updateItem(updateItem);
             //redrawing scree
            setState(() {
              getData();
            });
            //updating note



            Navigator.pop(context);
          },
          child: new Text("Update"),
        ),
        new ElevatedButton(
          style: ElevatedButton.styleFrom(

            primary: Colors.deepOrange,
          ),
          onPressed: () => Navigator.pop(context),
          child: new Text("Cancel"),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
endtask(Tasks item, int index)async {
  Tasks updateItem = Tasks.fromMap({
    "title": task_controller.text,
    "time": time_controller.text,
    "date": date_controller.text,
    "id": item.id,
    "status": "done",
  });
  //redrawing scree
  await db.updateItem(updateItem);
}
  }

/*toggle_mark(Tasks T) {
  if(T.status== null) {
    end_task = !end_task;



    setState(() {});
  }
}*/

