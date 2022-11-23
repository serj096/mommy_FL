import 'package:flutter/material.dart';
import 'package:mommy/models/schedule.dart';

import 'data_service.dart';
import '../models/index.dart';
import 'dart:math';
import 'coords.dart';

class DummyDataService extends DataService {
  DummyDataService() {
    userDataAccess = DummyUserDataService();
    categoryDataAccess = DummyCategoryDataService();
    shopDataAccess = DummyShopDataService();
    orderDataAccess = DummyOrderDataService();
    authentication = DummyAuthenticationService();
  }
}

class DummyUserDataService implements UserDataService {
  late User user;

  DummyUserDataService() {
    Map<String, dynamic> json = {
      'FirstName': 'Иван',
      'SurName': 'Иванов',
      'Patronymic': 'Иванович',
      'Phone': '89996663311',
      'IsWoman': false,
      'City': 'Санкт-Петербург',
      'Address': 'Улица Пушкина, дом Колотушкина 228'
    };

    user = User.fromJson(json);
  }

  @override
  Future<User> getInfo() => Future<User>.value(user);

  @override
  Future<void> updateInfo(User user) async => this.user = user;
}

class DummyCategoryDataService implements CategoryDataService {
  late List<Category> categories;

  DummyCategoryDataService() {
    categories = <Category>[
      Category(1, "Категория #1"),
      Category(2, "Категория #2")
    ];
  }

  @override
  Future<List<Category>> getCategories() =>
      Future<List<Category>>.value(categories);

  @override
  Future<Category> getCategory(int id) =>
      Future<Category>.value(categories[id - 1]);
}

class DummyShopDataService implements ShopDataService {
  late List<Shop> shops;
  late List<List<Service>> services;
  late WeekSchedule weekSchedule;
  late MonthSchedule monthSchedule;

  DummyShopDataService() {
    shops = <Shop>[];
    services = <List<Service>>[];

    // First shop
    shops.add(Shop(1, "У Клуши", 5, "Санкт-Петербург", "Садовая улица 38",
        const Point(59.92805, 30.32166), "Сервис заебумба - отвечаю"));

    // First shop services
    services.add(<Service>[
      Service(
        1,
        1,
        "Ноготочки",
        "Блестеть будут",
        500,
      ),
      Service(2, 2, "Волосики", "Как у тарзана", 1200)
    ]);

    // Second shop
    shops.add(Shop(1, "Мастер Олег", 5, "Санкт-Петербург", "Гороховая улица 36",
        const Point(59.92807, 30.32302), "Дядя Олег позаботится о тебе"));

    // Second shop services
    services.add(<Service>[
      Service(
        1,
        1,
        "Мелирование",
        "Разноцветное как флаг ЛГБТ",
        2000,
      ),
      Service(2, 2, "Шугаринг", "Сладкие ножки", 3150)
    ]);

    // Third shop
    shops.add(Shop(1, "Топ услуги", 5, "Санкт-Петербург", "Апраксин переулок 4",
        const Point(59.92908, 30.32524), "Лучшие во дворе"));

    // Third shop services
    services.add(<Service>[
      Service(
        1,
        1,
        "Педикюрчик",
        "Королевские коготочки",
        900,
      ),
      Service(2, 2, "Пирсинг", "Сделай себе новые дырочки", 1500)
    ]);

    weekSchedule = WeekSchedule(
      // Monday
      WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 17, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          true),
      // Tuesday
      WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 17, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          true),
      // Wednesday
      WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 17, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          true),
      // Thursday
      WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 17, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          true),
      // Friday
      WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 15, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          true),
      // Saturday
      WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 17, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          false),
      // Sunday
      WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 17, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          false),
    );
  }

  @override
  Future<List<Shop>> getShops(
      int categoryId, Point<double> pt, double distance) async {
    var result = <Shop>[];

    for (var s in shops) {
      for (var sv in (await getServices(s.id))) {
        if (sv.categoryId == categoryId) {
          var dist =
              Coords.getCoordsDistance(pt.x, pt.y, s.coords.x, s.coords.y);
          if (dist <= distance) {
            result.add(s);
            break;
          }
        }
      }
    }

    monthSchedule = MonthSchedule(DateTime(2022, 11), <int, WorkDayInfo>{
      1: WorkDayInfo(
          const TimeOfDay(hour: 10, minute: 0),
          const TimeOfDay(hour: 19, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 15, minute: 00),
                const TimeOfDay(hour: 15, minute: 45))
          ],
          true),
      19: WorkDayInfo(
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 17, minute: 0),
          <WorkBreak>[
            WorkBreak(const TimeOfDay(hour: 12, minute: 45),
                const TimeOfDay(hour: 13, minute: 30))
          ],
          true)
    });

    return result;
  }

  @override
  Future<Shop> getShop(int id) => Future<Shop>.value(shops[id - 1]);

  @override
  Future<List<Service>> getServices(int shopId) {
    return Future<List<Service>>.value(services[shopId - 1]);
  }

  @override
  Future<Service> getService(int shopId, int serviceId) {
    return Future<Service>.value(services[shopId][serviceId]);
  }

  @override
  Future<WeekSchedule> getWeekSchedule(int shopId) {
    return Future<WeekSchedule>.value(weekSchedule);
  }

  @override
  Future<MonthSchedule> getMonthSchedule(int shopId, DateTime month) {
    if (month.year == 2022 && month.month == 11) {
      return Future<MonthSchedule>.value(monthSchedule);
    }

    return Future<MonthSchedule>.value(
        MonthSchedule(month, <int, WorkDayInfo> {})
    );
  }

}

class DummyOrderDataService implements OrderDataService {
  late List<Order> currentOrders;
  late List<Order> ordersHistory;

  DummyOrderDataService() {
    currentOrders = <Order>[];

    // First order
    currentOrders.add(Order(1, Payment.cash, false,
        DateTime(2022, 12, 3, 17, 30), Place.home, <int>[1, 2]));

    // Second order
    currentOrders.add(Order(2, Payment.card, true, DateTime(2022, 7, 15, 13, 0),
        Place.home, <int>[1, 2]));

    // Third order
    currentOrders.add(Order(3, Payment.online, false,
        DateTime(2023, 1, 16, 19, 45), Place.shop, <int>[1, 2]));
  }

  @override
  Future<List<Order>> getCurrentOrders() =>
      Future<List<Order>>.value(currentOrders);

  @override
  Future<List<Order>> getOrdersHistory(int fromId) {
    throw UnimplementedError();
  }

  @override
  Future<void> addOrder(Order order) async => currentOrders.add(order);
}

class DummyAuthenticationService implements AuthenticationService {
  @override
  Future<void> getCode(String phone) {
    return Future.value();
  }

  @override
  Future<void> sendCode(String phone, int code) {
    return Future.value();
  }
}
