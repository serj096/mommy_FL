import 'package:flutter/material.dart';
import 'package:mommy/theme/app_theme.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.colors.homeOneColor,AppTheme.colors.homeSecondColor]
        )
      ),
    );
  }
}
