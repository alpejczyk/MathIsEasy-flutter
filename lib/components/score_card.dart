import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    Key key,
    @required this.score,
  }) : super(key: key);

  final String score;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          score,
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      margin: EdgeInsets.only(left: 15.0),
      color: Colors.deepOrangeAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
