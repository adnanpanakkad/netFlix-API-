import 'package:flutter/material.dart';
import 'package:netflix_clone/Screens/downloads/screen_downloads.dart';
import 'package:netflix_clone/Screens/home/home.dart';
import 'package:netflix_clone/Screens/new%20and%20hot/screen%20new_hot.dart';
import 'package:netflix_clone/widgets/bottombar.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final pages = const [ScreenHome(), ScreenNewAndHot(), ScreenDownloads()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, child) => pages[index],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
