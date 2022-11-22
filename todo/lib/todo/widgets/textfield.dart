import 'package:flutter/material.dart';

class inputfield extends StatefulWidget{
  String? label;
  TextEditingController? controller;
  TextInputType? keyboard;
  IconData? icon;
  IconButton iconButton;
  Function? validate;
  inputfield({this.label,this.controller,this.keyboard,this.icon,this.validate,required this.iconButton});

  @override
  State<inputfield> createState() => _inputfieldState();
}

class _inputfieldState extends State<inputfield> {
  @override
  Widget build(BuildContext context) {
 return
 TextFormField(

cursorColor: Colors.black,
      validator:(s)=>widget.validate!(s) ,
      controller:widget.controller,
      keyboardType:widget.keyboard,
 //  enableInteractiveSelection: false,
      decoration:InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange),
          borderRadius:BorderRadius.circular(20),
        ),




        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(20),

            borderSide: BorderSide(color:Colors.deepOrange),
          ),


          labelText:widget.label,
        labelStyle:TextStyle(fontSize:20,color: Colors.deepOrange,),

          hintText: widget.label,
          hintStyle:TextStyle(fontSize:15) ,
          suffixIcon:IconButton(icon: widget.iconButton, onPressed: () { },color: Colors.deepOrange,padding: EdgeInsets.all(20),iconSize:30,),
          suffixIconColor: Colors.cyan,
      ),
    );

  }
}