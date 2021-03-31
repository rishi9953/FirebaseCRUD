import 'package:flutter/material.dart';

class Floatactionbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        mini: false,
        backgroundColor: Colors.white,
        elevation: 5,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
