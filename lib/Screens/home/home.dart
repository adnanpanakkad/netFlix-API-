import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/Screens/home/widgets/appbar/appbar.dart';
import 'package:netflix_clone/Screens/home/widgets/appbar/bottom_appbar.dart';
import 'package:netflix_clone/Screens/home/widgets/movie/mainard.dart';
import 'package:netflix_clone/Screens/home/widgets/movie/maintile.dart';
import 'package:netflix_clone/Screens/home/widgets/number/numbertile.dart';
import 'package:netflix_clone/Screens/home/widgets/series/futhurmethod.dart';
import 'package:netflix_clone/Screens/home/widgets/series/maintile_series.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/constant/colors/common_color.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/tv.dart';


ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<TvSeries>> topRatedSeries;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getpopularMovies();
    nowPlayingMovies = Api().getnowPlayingMovies();
    topRatedSeries = Api().getTopRatedSeries();
  }

  static const logo =
      "https://i.insider.com/576837b852bcd01a008ca3bf?width=750&format=jpeg&auto=webp";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: appBar(logo, context),
        extendBodyBehindAppBar: true,
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }

                return true;
              },
              child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: size.height*0.1),
                    child: buildFutureBuilder(
                      future: trendingMovies,
                      builder: (context, snapshot) {
                        return MainCardWidget(snapshot: snapshot);
                      },
                    ),
                  ),
                  buildFutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      return MainTileCard(
                        title: "Trending Now",
                        snapshot: snapshot,
                      );
                    },
                  ),
                  buildFutureBuilder(
                    future: nowPlayingMovies,
                    builder: (context, snapshot) {
                      return MainTileCard(
                        title: "Now Playing",
                        snapshot: snapshot,
                      );
                    },
                  ),
                  buildFutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      return NumberTitileCard(
                        text: 'Top Rated Movies',
                        snapshot: snapshot,
                      );
                    },
                  ),
                  buildFutureBuilder(
                    future: upComingMovies,
                    builder: (context, snapshot) {
                      return MainTileCard(
                        title: "Upcoming Movies",
                        snapshot: snapshot,
                      );
                    },
                  ),
                  buildFutureBuilder(
                    future: topRatedSeries,
                    builder: (context, snapshot) {
                      return MainTileCardSeries(
                        title: "Top Rated TV Series",
                        snapshot: snapshot,
                      );
                    },
                  ),
                  buildFutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      return MainTileCard(
                        title: "Popular Movies",
                        snapshot: snapshot,
                      );
                    },
                  ),
                ],
              ),
               // ignore: prefer_const_constructors
               SubAppbarWidget(), 
            ],
          ),
        );
          },
        ),
      ),
    );
  }
  
}
