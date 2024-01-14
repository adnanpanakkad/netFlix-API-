import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Screens/new%20and%20hot/widgets/coming_soon.dart';
import 'package:netflix_clone/Screens/new%20and%20hot/widgets/everyones_watching.dart';
import 'package:netflix_clone/Screens/search/widgets/search_screen.dart';
import 'package:netflix_clone/constant/colors/common_color.dart';
import 'package:netflix_clone/models/tv.dart';
import '../../api/api.dart';
import '../../models/movie.dart';

const newAndHotTempImage =
    "https://i.ytimg.com/vi/nfe7SHu4kcE/maxresdefault.jpg";
const logo =
    "https://upload.wikimedia.org/wikipedia/en/1/1e/One_Piece_Live_Action_Logo.jpg";

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

late Future<List<Movie>> trendingMovies;
late Future<List<TvSeries>> popularSeries;

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    popularSeries = Api().getpopularSeries();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                backgroundColor: scaffoldColor,
                title: const Text(
                  'New & Hot',
                  style: TextStyle(color: titleColor),
                ),
                actions: [
                  const Icon(
                    Icons.add_alert_outlined,
                    color: titleColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: redCard,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      width: 22,
                      height: 22,
                    ),
                  ),
                ],
                bottom: const TabBar(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    unselectedLabelColor: titleColor,
                    dividerColor: Colors.black,
                    indicatorPadding: EdgeInsets.all(9),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                    ),
                    tabs: [
                      Tab(
                        text: '🍿 Coming Soon',
                      ),
                      Tab(
                        text: "🔥 Everyone's Watching",
                      ),
                    ]),
              ),
            ),
            body: TabBarView(children: [
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return buildTabbarViewOne(snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: popularSeries,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return buildTabbarViewTwo(context, snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ])),
      ),
    );
  }

  Widget buildTabbarViewOne(AsyncSnapshot<List<Movie>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          ComingSoonWidget(snapshot: snapshot, index: index),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: snapshot.data!.length,
    );
  }

  Widget buildTabbarViewTwo(context, AsyncSnapshot<List<TvSeries>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          EveryonesWatchingWidget(index: index, snapshot: snapshot),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: snapshot.data!.length,
    );
  }
}

List upcomingMovies = [];
