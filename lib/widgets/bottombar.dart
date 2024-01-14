import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.playlist_play_rounded), label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline_outlined),
                label: 'Downloads'),
          ],
          selectedIconTheme: const IconThemeData(color: Colors.red),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          type: BottomNavigationBarType.fixed,
          onTap: (index) => indexChangeNotifier.value = index,
          currentIndex: newIndex,
          backgroundColor: Colors.black,
          elevation: 0,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.shade600),
    );
  }
}
