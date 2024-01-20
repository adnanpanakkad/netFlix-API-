import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Screens/search/widgets/search_screen.dart';
import 'package:netflix_clone/constant/colors/common_color.dart';

AppBar appBar(String logo, context) {
  return AppBar(
    backgroundColor: Colors.black87,
    actions: [
      Padding(
        padding:  EdgeInsets.only(left: 15),
        child: SizedBox(
          width: 50,
          height: 40,
          child: Image.network(
            logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Spacer(),
      IconButton(
          onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ScreenSearch(),),);
          },
          icon: const Icon(
            CupertinoIcons.search,
            color: titleColor,
          )),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: Container(
          decoration: const BoxDecoration(
              color: redCard,
              borderRadius: BorderRadius.all(Radius.circular(2))),
          width: 22,
          height: 22,
        ),
      ),
    ],
  );
}
