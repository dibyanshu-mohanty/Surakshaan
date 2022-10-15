import 'package:flutter/material.dart';


class HomeScreenTitle extends StatelessWidget {
  const HomeScreenTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          Text(
            "Explore Safety with",
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "Surakshaan",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
                color: Color(0xFFf98786)),
          ),
        ],
      ),
    );
  }
}
