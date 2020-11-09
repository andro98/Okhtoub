import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final Function onSaved;
  final Function onValidate;

  CustomTextField(
      {@required this.hintText,
      @required this.inputType,
      @required this.onSaved,
      @required this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: inputType,
        onSaved: onSaved,
        validator: onValidate,
        decoration: InputDecoration(
          focusColor: Colors.blueAccent,
          contentPadding: EdgeInsets.all(20),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          errorStyle: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
