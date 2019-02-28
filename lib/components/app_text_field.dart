import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  String hintText;
  IconData icon;
  bool isPassword;
  TextEditingController controller;
  Function validator;
  TextInputType textInputType;


  AppTextField({
    @required this.hintText,
    this.icon,
    this.isPassword = false,
    @required this.controller,
    @required this.validator,
    this.textInputType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      autovalidate: false,
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20.0
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        labelText: hintText,
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(icon,color: Colors.white,),
      ),
    );
  }

}