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
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              AppTheme.colors.baseUpBackground,
              AppTheme.colors.baseDownBackground
            ])),
        child: Scaffold(
            appBar: Styles.widgets
                .GetDefaultAppBar(context, true, "Личный кабинет"),
            backgroundColor: Colors.transparent,
            body: FutureBuilder(
                future: HomePageData.getData(),
                builder: (context, AsyncSnapshot<HomePageData> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // todo
                  // Async method error handling

                  final User user = snapshot.data!.user;
                  final List<Order> orders = snapshot.data!.orders;

                  final List<Widget> ordersWidgets = getLW(orders);

                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Styles.DefaultPadding,
                          Styles.widgets
                              .GetCircleAvatar(context, circleAwatarSize.big),
                          Styles.DefaultPadding,
                          Text(user.fullName(),
                              textAlign: TextAlign.center,
                              style: Styles.text.AllocationText),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: width * 0.75,
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Телефон: ${user.phone}",
                                      textAlign: TextAlign.left,
                                      style: Styles.text.InformationText),
                                  Text("Социальные сети: ",
                                      textAlign: TextAlign.left,
                                      style: Styles.text.InformationText)
                                ],
                              )),
                          Styles.widgets.GetDefaultScrollView(
                              context,
                              ordersWidgets,
                              "Текущие записи: ${ordersWidgets.length}"),
                          Styles.DefaultPadding,
                          Styles.widgets.GetDefaultButton(
                              context, "История записей", () {}),
                          Styles.DefaultPadding,
                          Styles.widgets.GetDefaultButton(
                              context, "Любимые специалисты", () {}),
                          Styles.DefaultPadding,
                          Styles.widgets.GetDefaultButton(
                              context, "Разместить услугу", () {}),
                        ],
                      ),
                    ),
                  );
                }),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppTheme.colors.baseDownBackground,
                currentIndex: 2,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message_rounded,
                          color: Color.fromRGBO(177, 175, 250, 1)),
                      label: 'Message',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_rounded,
                          color: Color.fromRGBO(177, 175, 250, 1)),
                      label: 'Settings',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded,
                        color: Color.fromRGBO(177, 175, 250, 1)),
                    label: 'Home',
                    backgroundColor: Colors.white,
                  ),
                ])));
  }
}

List<Widget> getLW(List<Order> orders) {
  var result = <Widget>[];

  for (Order o in orders) {
    result.add(getWid(o));
  }

  return result;
}

Widget getWid(Order order) {
  return Center(
    child: FutureBuilder(
      future: OrderContainerData.getData(order),
      builder: (context, AsyncSnapshot<OrderContainerData> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        // todo
        // Async method error handling

        Shop shop = snapshot.data!.shop;
        var children = <Widget>[];
        int servicesSum = 0;
        snapshot.data!.services.forEach((element) {
          children.add(Text(element.name, style: Styles.text.CommonText));
          servicesSum += element.price;
        });


        return Container(
          margin: EdgeInsets.only(left: 7, right: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(
              color: Color.fromRGBO(251, 149, 251,1),
            width: 3)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 3, right: 3, top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                    Column(children: [
                      Text('${servicesSum}руб.', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Tenor")),
                      Text('оплачено', style: Styles.text.PaymentInfo, selectionColor: Colors.white,)
                    ],)])),
              Container(
                padding: EdgeInsets.only(left: 3, right: 3, top: 3),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Дата и время', style: Styles.text.CommonText),
                    Text('${shop.address}',style: Styles.text.CommonText),
                  ])),
              Container(
                padding: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: Text('Детали заказа', style: Styles.text.CommonText),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStatePropertyAll<Color>(Color.fromRGBO(100, 100, 200,1))
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
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
    result.orders = await DataAccessor.instance.orderDataAccess.getCurrentOrders();
    await Future.delayed(const Duration(seconds: 2));
    return result;
  }
}

class OrderContainerData {
  late Shop shop;
  late List<Service> services;

  OrderContainerData._privateConstructor();

  static Future<OrderContainerData> getData(Order order) async {
    OrderContainerData result = OrderContainerData._privateConstructor();
    result.shop = await DataAccessor.instance.shopDataAccess.getShop(order.shopId);
    result.services = <Service>[];
    for (Service s in await DataAccessor.instance.shopDataAccess.getServices(order.shopId)) {
      if (order.services.contains(s.id)) {
        result.services.add(s);
      }
    }
    await Future.delayed(Duration(seconds: order.shopId * 2));
    return result;
  }
}
