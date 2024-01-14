import 'package:flutter/material.dart';
import 'package:netflix_clone/Screens/home/home.dart';

class SubAppbarWidget extends StatelessWidget {
  const SubAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: scrollNotifier.value == true
          ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                color: Colors.black87,
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          child: const Text(
                            'TV Shows',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Movies',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Categories',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
