import 'package:flutter/material.dart';
import 'package:food_app/helper/screen_navigation.dart';
import 'package:food_app/screens/details.dart';

import '../helper/style.dart';
import './custom_text.dart';
import '../models/products.dart';

List<Product> productsList = [
  Product(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: 'GoodFoods',
      wishList: true,
      image: "1.jpg"),
  Product(
      name: 'Taccos',
      price: 7.99,
      rating: 4.7,
      vendor: 'GoodFoods',
      wishList: false,
      image: "5.jpg"),
  Product(
      name: 'Taccos',
      price: 7.99,
      rating: 4.7,
      vendor: 'GoodFoods',
      wishList: false,
      image: "5.jpg"),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
            child: GestureDetector(
              onTap: () {
                changeScreen(_, Details(product: productsList[index]));
              },
              child: Container(
                height: 240,
                width: 200,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: grey,
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/${productsList[index].image}',
                      height: 140,
                      width: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: productsList[index].name,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: productsList[index].wishList
                                  ? Icon(
                                      Icons.favorite,
                                      color: red,
                                      size: 18,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: red,
                                      size: 18,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomText(
                                text: productsList[index].rating.toString(),
                                colors: grey,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: grey,
                              size: 16,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomText(
                            text: '\$${productsList[index].price}',
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
