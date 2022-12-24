import 'package:database_semi/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'DATABASE',
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: HomePage()
  ));
}