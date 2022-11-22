import 'package:flutter/material.dart';
import 'package:mommy/theme/styles.dart';

import '../data/UserInfo.dart';
import 'app_theme.dart';

@immutable
class DefaultWidgets{

  Widget GetDefaultScrollView( BuildContext context, List<Widget> insideWidgets, String elementTitle )
  {
    var width = MediaQuery.of(context).size.width;
    bool needLight = insideWidgets.length > 0;
    return Container(
        width: width * 0.85,
        decoration: needLight? BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(127, 245, 255,1).withAlpha(125),
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(0, 0),
            )
          ],
        ) : null,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ExpansionTile
            (title: Text(elementTitle,
              textAlign: TextAlign.left,
              style: needLight? Styles.text.LightButtonText : Styles.text.ButtonText),
            trailing: GetArrowIcon( arrowDirection.down),
            collapsedBackgroundColor: Color.fromRGBO(76, 74, 157,1),
            backgroundColor: Colors.teal,
            children: [ ListView.separated(
                separatorBuilder: (BuildContext bc, int index) => Divider(),
                shrinkWrap: true,
                itemCount: insideWidgets.length,
                itemBuilder: (context, int index) {
                  return insideWidgets[index];
                })]))
    );
  }

  Widget GetArrowIcon(arrowDirection direction)
  {
    switch(direction) {
      case arrowDirection.left:
        return Icon( Icons.arrow_circle_left_outlined, color: Color.fromRGBO(170, 166, 250,1));
      case arrowDirection.down:
        return Icon( Icons.arrow_circle_down_outlined, color: Color.fromRGBO(170, 166, 250,1));
      case arrowDirection.up:
        return Icon( Icons.arrow_circle_up_outlined, color: Color.fromRGBO(170, 166, 250,1));
      default:
        return Icon( Icons.arrow_circle_right_outlined, color: Color.fromRGBO(170, 166, 250,1));
    }
  }

  Widget GetDefaultButton( BuildContext context, buttonTitle, Function() func )
  {
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: func,
        style: Styles.DefaultButtonStyle,
        child: Container(
          height: 50,
          width: width * 0.75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buttonTitle, style: Styles.text.ButtonText),
              GetArrowIcon(arrowDirection.right)
            ],
          ),
        )
    );
  }

  PreferredSizeWidget GetDefaultAppBar(BuildContext context, bool showMoney, String appBarTitle)
  {
    return
      AppBar(
        backgroundColor: AppTheme.colors.baseUpBackground,
        title: Text(appBarTitle),
        actions: <Widget>[ showMoney? TextButton(onPressed: (){}, child: Text("1500+", style: Styles.text.ButtonText)) : GetCircleAvatar(context,circleAwatarSize.small)],
        leading: IconButton(
            icon: GetArrowIcon(arrowDirection.left),
            onPressed: () => Navigator.pop(context)
        ));
  }

  Widget GetCircleAvatar(BuildContext context, circleAwatarSize size){
    var width = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: (){ size == circleAwatarSize.small? Navigator.pushNamed(context, '/') : null;},
        child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: size == circleAwatarSize.big? width / 10 : 23,
            child: CircleAvatar(
                backgroundColor: Color.fromRGBO(76, 74, 157,1),
                radius: size == circleAwatarSize.big? width / 10.1 : 20,
                child: Text(UserInfo().GetName()[0], style: GetCircleAvatarTextStyle(size) )
            )));
  }

  TextStyle GetCircleAvatarTextStyle(circleAwatarSize size)
  {
    return TextStyle(
        color: Colors.white,
        fontSize: size == circleAwatarSize.big? 45: 15
    );
  }


  const DefaultWidgets();
}