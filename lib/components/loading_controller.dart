import 'package:flutter/material.dart';

class LoadingController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withAlpha(195),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 30.0,right: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            height: 70.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Text('Please wait ... ',style: TextStyle(fontSize: 20.0),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}