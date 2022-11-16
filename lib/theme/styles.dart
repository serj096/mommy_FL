import 'dart:math';
import 'package:flutter/material.dart';

@immutable
class Styles{
  final BigCycleAvatar = const TextStyle(
    color: Colors.white,
    fontSize: 45
  );
  final InformationText = const TextStyle(
      color: Colors.black,
      fontSize: 18
  );
  final AllocationText = const TextStyle(
      color: Colors.black,
      fontSize: 25
  );
  final DefaultPadding = const Padding(padding: EdgeInsets.all(8));

  Color GetRandomColor()
  {
    List<Color> colors = [Colors.indigoAccent, Colors.teal];
    Random rd = new Random();
    int rndIndex = rd.nextInt(2);
    return colors[rndIndex];
  }

  const Styles();
}