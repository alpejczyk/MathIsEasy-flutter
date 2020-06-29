import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game_screen.dart';

class NewGamePage extends StatefulWidget {
  NewGamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NewGamePageState createState() => _NewGamePageState();
}

class _NewGamePageState extends State<NewGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ButtonTheme(
          minWidth: 150,
          height: 80,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GamePage()));
            },
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: Colors.deepOrange,
            child: Text('New Game',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
