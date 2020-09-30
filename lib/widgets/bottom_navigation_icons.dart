import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_text.dart';

class BOttomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function function;

  const BOttomNavIcon({Key key, this.image, this.name, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: function ?? null,
        child: Column(
          children: <Widget>[
            Image.asset("images/$image", width: 26, height: 26),
            SizedBox(
              height: 2,
            ),
            CustomText(text: name)
          ],
        ),
      ),
    );
  }
}
