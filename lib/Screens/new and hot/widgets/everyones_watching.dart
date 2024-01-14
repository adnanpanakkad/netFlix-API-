import 'package:flutter/material.dart';
import 'package:netflix_clone/constant/colors/common_color.dart';
import 'package:netflix_clone/constant/constants.dart';
import 'package:netflix_clone/constant/fonts.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
    required this.snapshot,
    required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Image.network(
                      '${Constants.imagePath}${snapshot.data![index].backdropPath}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    height: 20,
                    width: 60,
                    child: const Center(
                        child: Text('U/A 13+',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                Positioned(
                  left: 155,
                  top: 75,
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.black87,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${snapshot.data![index].title}',
                        style: const TextStyle(
                            color: titleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share_outlined,
                          color: titleColor,
                        ),
                      ),
                      const Text(
                        "Share",
                        style: TextStyle(color: textColor, fontSize: 10),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: titleColor,
                          ),
                        ),
                        const Text(
                          'My List',
                          style: TextStyle(color: textColor, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          color: titleColor,
                        ),
                      ),
                      const Text(
                        'Play ',
                        style: TextStyle(color: textColor, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Watch the Season Finale now",
                    style: titleTextStyle),
                Text(
                  '${snapshot.data![index].overview}',
                  style: contentTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
