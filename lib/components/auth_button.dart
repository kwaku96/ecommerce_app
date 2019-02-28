import 'package:flutter/material.dart';

class AppAuthButton extends StatelessWidget {

  String btnText;
  VoidCallback onPressed;
  Color btnColor,btnTextColor;

  AppAuthButton({
    this.btnColor = Colors.white,
    this.btnTextColor = Colors.black,
    @required this.onPressed,
    @required this.btnText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: btnColor,
          border: Border.all(
              style: BorderStyle.solid,
              color: btnColor,
              width: 2.0
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
            child: Text(btnText,style: TextStyle(color: btnTextColor,fontSize: 20.0),)
        ),
      ),
    );
  }
}