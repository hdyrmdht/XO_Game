import 'package:flutter/material.dart';

class GameBtn extends StatelessWidget {
String txt;
int index;
 Function onButnclicked;
GameBtn(this.txt,this.index,this.onButnclicked);
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

        backgroundColor: Color.fromARGB(154, 7, 54, 100),
        side: BorderSide(color: Colors.white,width: 2),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
    ),
      ),
    child: Text(txt,style: TextStyle(fontSize: 50,fontWeight: FontWeight.w100,color: Colors.white),),
    onPressed: () { onButnclicked(index); },
    ));
  }
}
