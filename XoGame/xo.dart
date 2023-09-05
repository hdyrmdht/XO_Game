import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Gamebtn.dart';

class XOGame extends StatefulWidget {
  @override
  State<XOGame> createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
int score1=0;

int score2=0;

List<String>board=[
  "","", "",
  "","", "",
  "","", "",
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(154, 7, 54, 100),
        title: Text("XO Game"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "player X",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "$score1",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "player O",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    Text(
                      "$score2",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[0],0,OnbuttonClick),
                GameBtn(board[1],1,OnbuttonClick),
                GameBtn(board[2],2,OnbuttonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[3],3,OnbuttonClick),
                GameBtn(board[4],4,OnbuttonClick),
                GameBtn(board[5],5,OnbuttonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[6],6,OnbuttonClick),
                GameBtn(board[7],7,OnbuttonClick),
                GameBtn(board[8],8,OnbuttonClick),
              ],
            ),
          ),
        ],
      ),
    );
  }
int counter=1;
  resetboard(){
    board=[
      "","", "",
      "","", "",
      "","", "",
    ];
    counter=0;
  }
  OnbuttonClick(index){
    if(board[index].isNotEmpty)return;
    if(counter.isOdd){
      board[index]="X";
      bool win=checkwinner("X");
      if(win){
        score1+=10;
        resetboard();
      }

    }else {
      board[index] = "O";
      bool win=checkwinner("O");
      if(win){
        score2+=10;
        resetboard();

      }
    }
    if(counter==9){
      resetboard();
    }
    counter++;
   setState(() {
   });


  }
bool checkwinner(String symbol) {
  for (int i = 0; i < 9; i += 3) {
    if (board[i] == symbol &&
        board[i + 1] == symbol &&
        board[i + 2] == symbol) {
      return true;
    }
  }
  for (int i = 0; i < 3; i++) {
    if (board[i] == symbol &&
        board[i + 3] == symbol &&
        board[i + 6] == symbol) {
      return true;
    }
  }

  if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
    return true;
  }
  if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
    return true;
  }
  return false;
}
}
