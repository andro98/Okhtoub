import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  MainButton({@required this.buttonText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        color: Color(0xff805959),
        elevation: 5,
      ),
    );
  }
}
