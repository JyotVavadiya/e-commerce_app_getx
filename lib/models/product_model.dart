import 'dart:ui';
import 'package:get/get.dart';

class ProductModel {
  String? img;
  String? name;
  String? fav;
  Color? dilColor;
  late double price;
  late RxInt quantity;

  ProductModel({
    required this.img,
    required this.name,
    required this.price,
    required this.fav,
    required this.dilColor,
    required this.quantity,
  });
}

