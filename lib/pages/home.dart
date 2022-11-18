import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mommy/theme/app_theme.dart';
import '../data/UserInfo.dart';
import '../theme/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(backgroundColor: Colors.deepPurple,);



    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      appBar: Styles().GetDefaultAppBar(context, true, "Личный кабинет"),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Styles().DefaultPadding,
            Styles().GetCircleAvatar(context, circleAwatarSize.big),
            Styles().DefaultPadding,
            Text("Имя: ${UserInfo().GetName()}", textAlign: TextAlign.center, style: Styles().AllocationText),
            Styles().DefaultPadding,
            Text("Телефон: ${UserInfo().GetPhone()}",textAlign: TextAlign.left,),
            Text("Социальные сети: ", textAlign: TextAlign.left),
            Styles().DefaultPadding,
            Styles().GetDefaultScrollView( GetLW(), "Текущие записи"),
            Styles().DefaultPadding,
            Styles().GetDefaultButton("История записей", () {}),
            Styles().DefaultPadding,
            Styles().GetDefaultButton("Любимые специалисты", () {}),
            Styles().DefaultPadding,
            Styles().GetDefaultButton("Разместить услугу", () {}),
          ],),),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        currentIndex: 2,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded,color: Colors.purpleAccent,),
            label: 'Message',backgroundColor: Colors.purple),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded,color: Colors.purpleAccent,),
            label: 'Settings',backgroundColor: Colors.purple),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded,color: Colors.purpleAccent,),
            label: 'Home',backgroundColor: Colors.purple,),
      ]),
    );
  }
}

List<Widget> GetLW(){
  var a = [GetWid(), GetWid(), GetWid(), GetWid()];
  return a;
}

Widget GetWid(){
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Text('lol') ,

            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Связаться со специалистом'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Отменить запись'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    ),
  );
}


