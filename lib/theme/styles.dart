import 'dart:math';
import 'package:flutter/material.dart';

import '../data/UserInfo.dart';
import '../pages/home.dart';

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
  final ButtonText = const TextStyle(
    color: Colors.white,
    fontSize: 16
  );

  final DefaultButtonStyle = const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
  );
  final DefaultPadding = const Padding(padding: EdgeInsets.all(8));

  Color GetRandomColor()
  {
    List<Color> colors = [Colors.indigoAccent, Colors.teal];
    Random rd = new Random();
    int rndIndex = rd.nextInt(2);
    return colors[rndIndex];
  }

  Widget GetDefaultScrollView( List<Widget> insideWidgets, String elementTitle )
  {    return
        ExpansionTile(title: Text(elementTitle, textAlign: TextAlign.left, style: ButtonText),
          collapsedBackgroundColor: Colors.indigoAccent,
          backgroundColor: Colors.teal,
          children: [ ListView.separated(
              separatorBuilder: (BuildContext bc, int index) => Divider(),
              shrinkWrap: true,
              itemCount: insideWidgets.length,
              itemBuilder: (context, int index) {
                return insideWidgets[index];
              })],
      );
  }

  Widget GetArrowIcon(arrowDirection direction)
  {
    switch(direction) {
      case arrowDirection.left:
        return Icon( Icons.arrow_circle_left_outlined, color: Colors.white);
      case arrowDirection.down:
        return Icon( Icons.arrow_circle_down_outlined, color: Colors.white);
      case arrowDirection.up:
        return Icon( Icons.arrow_circle_up_outlined, color: Colors.white);
      default:
        return Icon( Icons.arrow_circle_right_outlined, color: Colors.white);
    }
  }

  Widget GetDefaultButton( String buttonTitle, Function() func )
  {
    return ElevatedButton(
    onPressed: func,
    style: DefaultButtonStyle,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(buttonTitle, style: ButtonText),
        SizedBox( height: 50),
        GetArrowIcon(arrowDirection.right)

      ],
    )
    );
  }

  PreferredSizeWidget GetDefaultAppBar(BuildContext context, bool showMoney, String appBarTitle)
  {
    return
      AppBar(
        title: Text(appBarTitle),
        actions: <Widget>[ showMoney? TextButton(onPressed: (){}, child: Text("1500+", style: ButtonText),) : GetCircleAvatar(context,circleAwatarSize.small)],
        leading: IconButton(
        icon: Styles().GetArrowIcon(arrowDirection.left),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget GetCircleAvatar(BuildContext context, circleAwatarSize size){
    return GestureDetector(
      onTap: (){ size == circleAwatarSize.small? Navigator.push(context, MaterialPageRoute(builder: (context) => Home())) : null;},
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: size == circleAwatarSize.big? 55 : 27,
          child: CircleAvatar(
            backgroundColor: Styles().GetRandomColor(),
            radius: size == circleAwatarSize.big? 50 : 22,
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

  const Styles();
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

