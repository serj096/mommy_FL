import 'package:flutter/material.dart';
import 'package:mommy/pages/YourName.dart';
import 'package:mommy/pages/home.dart';
import 'package:mommy/pages/login.dart';
import 'package:mommy/pages/categories.dart';
import 'package:mommy/pages/map.dart';
import 'package:mommy/pages/mySpec.dart';

void main()=> runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.deepPurple,
  ),
  initialRoute: '/yourName',
  routes: {
    '/':(context)=>Home(),
    '/login':(context)=>Login(),
    '/categories':(context)=>Categories(),
    '/yourName':(context)=>YourName(),
    '/map':(context)=>MapOur(),
    '/mySpec':(context)=>MySpec(),

  },
));
