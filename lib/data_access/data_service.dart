import 'dart:math';
import '../models/index.dart';

abstract class DataService
{
  late UserDataService userDataAccess;
  late CategoryDataService categoryDataAccess;
  late ShopDataService shopDataAccess;
  late OrderDataService orderDataAccess;
  late AuthenticationService authentication;
}

abstract class UserDataService
{
  Future<User> getInfo();
  Future<void> updateInfo(User user);
}

abstract class CategoryDataService
{
  Future<List<Category>> getCategories();
  Future<Category> getCategory(int id);
}

abstract class ShopDataService
{
  Future<List<Shop>> getShops(int categoryId, Point<double> pt, double distance);
  Future<Shop> getShop(int shopId);
  Future<List<Service>> getServices(int shopId);
  Future<Service> getService(int shopId, int serviceId);
  Future<HolidayInfo> getHolidays(int shopId);
}

abstract class OrderDataService
{
  Future<List<Order>> getCurrentOrders();
  Future<List<Order>> getOrdersHistory(int fromId);
  Future<void> addOrder(Order order);
}

abstract class AuthenticationService
{
  Future<void> getCode(String phone);
  Future<void> sendCode(String phone, int code);
}