import 'package:flutter/material.dart';

class SideBySideText extends StatelessWidget {
  final String fText;
  final String sText;

  SideBySideText({
    this.fText = "",
    this.sText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            fText,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            sText,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
