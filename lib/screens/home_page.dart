import 'package:flutter/material.dart';
import 'package:food_app/helper/screen_navigation.dart';
import 'package:food_app/helper/style.dart';
import 'package:food_app/screens/bag.dart';
import 'package:food_app/widgets/bottom_navigation_icons.dart';
import 'package:food_app/widgets/popular_food.dart';
import '../widgets/custom_text.dart';

import '../widgets/categories.dart';
import '../widgets/featured_products.dart';
import '../widgets/small_floating_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: 'What would you like to eat?',
                      size: 18,
                    )),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Find food and resturant",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Categories(),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Featured',
                size: 20,
                colors: grey,
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Popular',
                size: 20,
                colors: grey,
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('images/food.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SmallButton(Icons.favorite),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                              ),
                              Text('4.5'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ]),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Pancakes\n",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: "by ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    )),
                                TextSpan(
                                  text: "Pizza hut\n",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: "\$12.99 \n",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 73,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BOttomNavIcon(
              image: 'home.png',
              name: 'Home',
            ),
            BOttomNavIcon(
              
              image: 'target.png',
              name: 'Near by',
            ),
            BOttomNavIcon(
              function: (){
                changeScreen(context, ShoppingBag());
              },
              image: 'shopping-bag.png',
              name: 'Bag',
            ),
            BOttomNavIcon(
              image: 'avatar.png',
              name: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
