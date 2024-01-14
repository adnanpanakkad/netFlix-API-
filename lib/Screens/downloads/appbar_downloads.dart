import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Screens/search/widgets/search_screen.dart';
import 'package:netflix_clone/constant/colors/common_color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarDownloads extends StatelessWidget {
  const AppbarDownloads({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                  fontSize: 20, color: titleColor, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenSearch(),
                  ),
                );
              },
              icon: const Icon(
                CupertinoIcons.search,
                color: titleColor,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
                  color: redCard,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              width: 22,
              height: 22,
            ),
          ),
        ],
      ),
    );
  }
}
