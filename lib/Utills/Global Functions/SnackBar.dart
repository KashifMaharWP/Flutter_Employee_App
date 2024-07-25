import 'package:flutter/material.dart';

void showSuccessSnackbar(String message,BuildContext context){
  final snackbar=SnackBar(
    content: Text(message,
      style: TextStyle(
          color: Colors.white),),
    backgroundColor: Colors.black54,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void showErrorSnackbar(String message,BuildContext context){
  final snackbar=SnackBar(
    content: Text(message,style: TextStyle(
      color: Colors.white,
    ),),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}