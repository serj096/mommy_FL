import 'package:flutter/material.dart';

@immutable
class TextStyles{
  final BigCycleAvatar = const TextStyle(
      color: Colors.white,
      fontSize: 45
  );
  final CommonText = const TextStyle(
      color: Colors.white,
      fontFamily: "Tenor",
      fontSize: 13
  );
  final PaymentInfo = const TextStyle(
    color: Colors.green,
    fontSize: 11
  );
  final InformationText = const TextStyle(
      color: Color.fromRGBO(177, 175, 250, 1),
      fontSize: 16
  );
  final AllocationText = const TextStyle(
      color: Color.fromRGBO(177, 175, 250, 1),
      fontSize: 25
  );
  final ButtonText = const TextStyle(
      color: Color.fromRGBO(177, 175, 250, 1),
      fontSize: 16
  );
  final LightButtonText = const TextStyle(
      color: Color.fromRGBO(127, 245, 255,1),
      fontSize: 16,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 16,
          offset: Offset(0, 0),
          color: Color.fromRGBO(127, 245, 255,1)
        )]);

  const TextStyles();
}