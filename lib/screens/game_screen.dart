import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathiseasy/components/answer_button.dart';
import 'package:mathiseasy/components/score_card.dart';
import 'package:mathiseasy/constatnts.dart';
import 'package:mathiseasy/logic/game_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    getGameData(0);
    super.initState();
  }

  final CountdownController controller = CountdownController();
  bool _isPause = true;
  bool _isRestart = false;
  final Game game = Game();
  String equation;
  Map answers = Map();
  String score;

  void getGameData(int key) {
    setState(() {
      game.checkForRightAnswer(key);
      score = game.getScore().toString();
    });
    game.clearAnswers();
    equation = game.generateEquation();
    game.generateAnswers();
    answers = game.getAnswers();
  }

  void gameRestart(CountdownController controller) {
    game.scoreReset();
    controller.restart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MathIsEasy'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(equation, style: kEquationStyle),
                Container(
                  height: 55,
                  width: 60,
                  child: ScoreCard(score: score),
                )
              ],
            ),
            Row(
              children: <Widget>[
                AnswerButton(
                  number: answers[1].toString(),
                  color: Colors.red,
                  onTap: () {
                    setState(() {
                      getGameData(1);
                    });
                  },
                ),
                AnswerButton(
                  number: answers[2].toString(),
                  color: Colors.yellow[700],
                  onTap: () {
                    setState(() {
                      getGameData(2);
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
                      getGameData(3);
                    });
                  },
                ),
                AnswerButton(
                  number: answers[4].toString(),
                  color: Colors.blue,
                  onTap: () {
                    setState(() {
                      getGameData(4);
                    });
                  },
                ),
              ],
            ),
            Countdown(
                controller: controller,
                seconds: 30,
                build: (_, double time) => Text(
                      time.toString(),
                      style: TextStyle(
                        fontSize: 100,
                      ),
                    ),
                interval: Duration(milliseconds: 100),
                onFinished: () {
                  print('Timer is done!');
                  setState(
                    () {
                      _isRestart = true;
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Game ended",
                        desc: "You've got $score points!",
                        style: AlertStyle(
                          isOverlayTapDismiss: false,
                        ),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "PLAY AGAIN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              gameRestart(controller);
                              getGameData(0);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
