import 'package:e_commerce_app/controllers/product_controller.dart';
import 'package:e_commerce_app/utils/colors/myColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fav extends StatefulWidget {
  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "My Favorite Cloths",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => (productController.favorite.isEmpty)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('assets/img/5.png'),
                      height: 250,
                    ),
                  ),
                  Text(
                    "Empty List",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
                  )
                ],
              )
            : ListView.builder(
                itemCount: productController.favorite.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${productController.favorite[i].img}"),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${productController.favorite[i].name}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "₹ ${productController.favorite[i].price}.00",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          productController.favoriteRemove(
                                              data: productController
                                                  .favorite[i]);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: (productController
                                                        .favorite[i].dilColor ==
                                                    Color(0xff000000))
                                                ? Colors.black
                                                : bgColor,
                                          ),
                                          child: (productController
                                                      .favorite[i].fav ==
                                                  "🤍")
                                              ? Text(
                                                  "🤍",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )
                                              : Text(
                                                  "❤",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
