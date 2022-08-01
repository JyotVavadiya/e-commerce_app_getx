import 'package:e_commerce_app/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/colors/myColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/products/list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Best Clothes",
                            style: TextStyle(
                                fontSize: 28,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Perfect Choice!",
                            style: TextStyle(
                                fontSize: 18,
                                color: black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed('fav');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.favorite, color: Colors.black,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 285,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.search,
                              color: black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed('cart');
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: black,
                        ),
                        child: Text(
                          "All",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "T-Shirt",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        "Ethnic",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        "Western",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                     InkWell(
                       onTap:(){
                         Navigator.of(context).pushNamed('detail', arguments: products[i]);
                       },
                       child:  Stack(
                         alignment: Alignment.centerLeft,
                         children: [
                           Container(
                             height: 200,
                             width: double.infinity,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(30)),
                           ),
                           Row(
                             children: [
                               Padding(
                                 padding: EdgeInsets.only(left: 10),
                                 child: Container(
                                   height: 180,
                                   width: 160,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(30),
                                       image: DecorationImage(
                                         image: NetworkImage("${products[i].img}"),
                                         fit: BoxFit.cover,
                                       )
                                   ),
                                 ),
                               ),
                               SizedBox(width: 20,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(height: 50,),
                                   Text("${products[i].name}", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),),
                                   SizedBox(height: 10,),
                                   Text("₹ ${products[i].price}.00",style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Row(
                                     children: [
                                       Container(),
                                       SizedBox(width: 110,),
                                       InkWell(
                                         onTap:(){
                                           setState(() {

                                            if(products[i].dilColor == Color(0xff000000)){
                                              products[i].dilColor = bgColor;
                                            }
                                            else if(products[i].dilColor == bgColor){
                                              products[i].dilColor = Color(0xff000000);
                                            }

                                            if(products[i].fav == "🤍"){
                                              products[i].fav = "❤";
                                            }
                                            else if(products[i].fav == "❤"){
                                              products[i].fav = "🤍";
                                            }
                                          });

                                          if(products[i].dilColor == Color(0xff000000)){
                                            productController.favoriteRemove(data: products[i]);
                                          }
                                          else if(products[i].dilColor == bgColor){
                                            productController.favoriteAdd(data: products[i]);
                                          }
                                         },
                                         child: Container(
                                           alignment: Alignment.center,
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(20),
                                             color: (products[i].dilColor == Color(0xff000000)) ?Colors.black : bgColor,
                                           ),
                                           child: (products[i].fav == "🤍")? Text("🤍", style: TextStyle(fontSize: 18),):Text("❤", style: TextStyle(fontSize: 18),),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
Expanded(
            flex: 1,
            child:  Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0,
                ),],

              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: (index == 0) ? black : grey,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('home');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        color: (index == 1) ? black : grey,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('fav');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: (index == 2) ? black : grey,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('cart');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
 */
