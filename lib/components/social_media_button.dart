import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {

  VoidCallback onPressed;
  String btnText;
  Color btnTextColor,btnColor;
  IconData icon;

  SocialMediaButton({
    @required this.btnText,
    this.btnTextColor = Colors.blue,
    @required this.icon,
    this.btnColor = Colors.white,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      textColor: btnTextColor,
      onPressed: onPressed,
      color: btnColor,
      child: Container(
        height: 55.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon),
            Text(btnText,style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }
}