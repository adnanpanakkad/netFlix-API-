import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/widgets/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotomain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    gotomain();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.network(
              'https://variety.com/wp-content/uploads/2020/05/netflix-logo.png'),
        ),
      ),
    );
  }

  Future<void> gotomain() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const ScreenMain()));
  }
}
