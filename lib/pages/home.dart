import 'package:flutter/material.dart';
import 'package:mommy/data_access/data_accessor.dart';
import 'package:mommy/theme/app_theme.dart';
import '../theme/styles.dart';
import '../models/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.colors.baseUpBackground, AppTheme.colors.baseDownBackground])),
      child: Scaffold(
          appBar: Styles.widgets.GetDefaultAppBar(context, true, "Личный кабинет"),
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: HomePageData.getData(),
            builder: (context, AsyncSnapshot<HomePageData> snapshot) {
              if(!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final User user = snapshot.data!.user;
              final List<Order> orders = snapshot.data!.orders;

              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Styles.DefaultPadding,
                      Styles.widgets.GetCircleAvatar(context, circleAwatarSize.big),
                      Styles.DefaultPadding,
                      Text(user.fullName(), textAlign: TextAlign.center, style: Styles.text.AllocationText),
                      Container(
                          alignment: Alignment.centerLeft,
                          width: width * 0.75,
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("Телефон: ${user.phone}",textAlign: TextAlign.left, style: Styles.text.InformationText),
                              Text("Социальные сети: ", textAlign: TextAlign.left, style: Styles.text.InformationText)],
                          )),
                      Styles.widgets.GetDefaultScrollView( context, GetLW(), "Текущие записи: ${GetLW().length}"),
                      Styles.DefaultPadding,
                      Styles.widgets.GetDefaultButton(context,"История записей", () {}),
                      Styles.DefaultPadding,
                      Styles.widgets.GetDefaultButton(context,"Любимые специалисты", () {}),
                      Styles.DefaultPadding,
                      Styles.widgets.GetDefaultButton(context,"Разместить услугу", () {}),
                    ],
                  ),
                ),
              );
            }
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppTheme.colors.baseDownBackground,
              currentIndex: 2,
              items:[
                BottomNavigationBarItem(
                    icon: Icon(Icons.message_rounded,color: Color.fromRGBO(177, 175, 250, 1)),
                    label: 'Message',backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_rounded,color: Color.fromRGBO(177, 175, 250, 1)),
                    label: 'Settings',backgroundColor: Colors.white),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded,color: Color.fromRGBO(177, 175, 250, 1)),
                  label: 'Home',backgroundColor: Colors.white,),
              ])));
  }
}

List<Widget> GetLW()=> [GetWid(), GetWid(), GetWid(), GetWid()];

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

class HomePageData {
  late User user;
  late List<Order> orders;

  HomePageData._privateConstructor();

  static Future<HomePageData> getData() async {
    HomePageData result = HomePageData._privateConstructor();
    result.user = await DataAccessor.instance.userDataAccess.getInfo();
    result.orders = await DataAccessor.instance.orderDataAccess.getOrders();
    await Future.delayed(const Duration(seconds: 3));
    return result;
  }
}


