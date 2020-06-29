import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathiseasy/components/answer_button.dart';
import 'package:mathiseasy/logic/game_brain.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Game game = Game();
  String equation;
  Map answers = Map();

  void getGameData() {
    game.clearAnswers();
    equation = game.generateEquation();
    game.generateAnswers();
    answers = game.getAnswers();
  }

  @override
  Widget build(BuildContext context) {
    getGameData();
    return Scaffold(
      appBar: AppBar(
        title: Text('MathIsEasy'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              equation,
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: <Widget>[
                AnswerButton(
                  number: answers[1].toString(),
                  color: Colors.red,
                  onTap: () {
                    setState(() {
                      getGameData();
                    });
                  },
                ),
                AnswerButton(
                  number: answers[2].toString(),
                  color: Colors.yellow[700],
                  onTap: () {
                    setState(() {
                      getGameData();
                    });
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                AnswerButton(
                  number: answers[3].toString(),
                  color: Colors.green,
                  onTap: () {
                    setState(() {
                      getGameData();
                    });
                  },
                ),
                AnswerButton(
                  number: answers[4].toString(),
                  color: Colors.blue,
                  onTap: () {
                    setState(() {
                      getGameData();
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
