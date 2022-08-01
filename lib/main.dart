import 'package:e_commerce_app/views/cart.dart';
import 'package:e_commerce_app/views/detail.dart';
import 'package:e_commerce_app/views/fav.dart';
import 'package:e_commerce_app/views/home.dart';
import 'package:e_commerce_app/views/splesh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
          '/':(context)=>Splesh(),
        'home':(context)=>Home(),
        'detail':(context)=>Detail(),
        'cart':(context)=>Cart(),
        'fav':(context)=>Fav(),
      },
    ),
  );
}