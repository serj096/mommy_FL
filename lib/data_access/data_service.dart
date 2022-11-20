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
  Future<Shop> getShop(int id);
  Future<ShopInfo> getShopInfo(int id);
}

abstract class OrderDataService
{
  Future<List<Order>> getOrders();
  Future<void> addOrder(Order order);
}

abstract class AuthenticationService
{
  Future<void> getCode(String phone);
  Future<void> sendCode(String phone, int code);
}