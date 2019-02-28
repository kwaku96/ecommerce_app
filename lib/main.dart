import 'package:flutter/material.dart';
import 'package:kingsly_app/pages/homepage.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

