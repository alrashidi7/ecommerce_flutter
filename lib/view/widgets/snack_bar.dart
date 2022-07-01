import 'package:flutter/material.dart';

void showInSnackBar(
    GlobalKey<ScaffoldState> scaffoldKey, String value, bool isError) {
  scaffoldKey.currentState?.showSnackBar(SnackBar(
    backgroundColor: Colors.transparent,

    elevation: 0,
    content:  Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isError ? Colors.red : Colors.green,
          border: Border.all(color: isError ? Colors.red : Colors.green, width: 3),

          borderRadius: BorderRadius.circular(4),
        ),child: Text(value)),
    duration: const Duration(seconds: 2),
  ));
}
