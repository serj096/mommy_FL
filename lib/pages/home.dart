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
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            TextButton(
              style: style,
              onPressed: (){},
              child: const Text('1200+',
                  style: TextStyle(color: Colors.white)))
          ]),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Styles().DefaultPadding,
            CircleAvatar(
              backgroundColor: Styles().GetRandomColor(),
              radius: 55.0,
              child: Text(UserInfo().GetName()[0], style: Styles().BigCycleAvatar ),
            ),
            Styles().DefaultPadding,
            Text("Имя: ${UserInfo().GetName()}", textAlign: TextAlign.center, style: Styles().AllocationText),
            Styles().DefaultPadding,
            Text("Телефон: ${UserInfo().GetPhone()}",textAlign: TextAlign.left,),
            Text("Социальные сети: ", textAlign: TextAlign.left),
            Styles().DefaultPadding,

            const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
              ExpansionTile(title: Text('Текущие записи',textAlign: TextAlign.center,style: TextStyle(color: Colors.cyanAccent),),
                  collapsedBackgroundColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple,
                  children: [
                    ListTile(title: MyStatelessWidgetH(),

                    ),
                    ListTile(title: MyStatelessWidgetH1(),)
                  ]
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(

              width: double.infinity,
              height: 50,
              child: ElevatedButton( onPressed:(){},style: ElevatedButton.styleFrom(
                primary: AppTheme.colors.blueButtoncolor,
              ), child: Row(

                mainAxisSize: MainAxisSize.min,

                children: [
                  Text('История записей',style: TextStyle(color: Colors.cyanAccent),),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(Icons.add_circle),
                ],
              ),),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: double.infinity,
              height: 50,
              child:
              ElevatedButton(onPressed:(){},style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
              ), child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Любимые специалисты',style: TextStyle(color: Colors.cyanAccent),),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.add_circle),
                ],
              ),),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: double.infinity,
              height: 50,
              child:
              ElevatedButton(onPressed:(){}, style:ElevatedButton.styleFrom(
                  primary: Colors.deepPurple
              ),child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Разместить услугу',style: TextStyle(color: Colors.cyanAccent),),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.add_circle),
                ],
              ),),
            ),
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

class MyStatelessWidgetH extends StatelessWidget {
  const MyStatelessWidgetH({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class MyStatelessWidgetH1 extends StatelessWidget {
  const MyStatelessWidgetH1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Card(
        child:SizedBox(
        child: Row(
          children:[
            Column(
              children: [ Text('Депеляция рук'),
                Text('Депеляция ног'),
                Text('23.07.2021 ПН в 17:00 '),
                Text('ул.Пушкина д.13 кв.15'),

              ],
            ),
            Column(
              children: [
                Text('1700',style: TextStyle(fontSize: 20),),
                Icon(Icons.accessible_sharp),

              ],
            ),
           Padding(padding: EdgeInsets.all(10)),
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
          ]
        ),
        )


        ),
    );

  }
}


