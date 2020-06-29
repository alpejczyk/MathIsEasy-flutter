import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Color color;
  final Function onTap;
  final String number;
  AnswerButton({this.color, this.onTap, this.number});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RawMaterialButton(
          constraints: BoxConstraints(minHeight: 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
          fillColor: color,
          onPressed: onTap,
          child: Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
