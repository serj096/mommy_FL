import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mommy/theme/textStyles.dart';
import 'package:mommy/theme/widgets.dart';

import '../data/UserInfo.dart';
import '../pages/home.dart';
import 'app_theme.dart';

@immutable
class Styles{
  static const text = TextStyles();
  static const widgets = DefaultWidgets();

  static final DefaultButtonStyle = const ButtonStyle(
    alignment: Alignment.center,
    backgroundColor: MaterialStatePropertyAll<Color>(Color.fromRGBO(76, 74, 157,1)));

  static final DefaultPadding = const Padding(padding: EdgeInsets.only( top: 8, bottom: 8));
}

enum circleAwatarSize{
  big,
  small
}

enum arrowDirection{
  left,
  down,
  up,
  right
}

