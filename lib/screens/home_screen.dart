import 'package:flutter/material.dart';
import 'package:new_flix_2/consts/consts.dart';
import 'package:new_flix_2/models/movie_model_class.dart';
import 'package:new_flix_2/movie_service_class/movie_service_class.dart';
import 'package:new_flix_2/widgets_common/movie_list_widget.dart';

import '../consts/api_consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  static const trendingMoviesURL =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
  static const topRatedMoviesURL =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const upComingMoviesURL =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
  @override
  void initState() {
    super.initState();
    trendingMovies = MovieService.getMovies(trendingMoviesURL);
    topRatedMovies = MovieService.getMovies(topRatedMoviesURL);
    upComingMovies = MovieService.getMovies(upComingMoviesURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "NEWFLIX"
            .text
            .fontFamily(semibold)
            .color(redColor)
            .size(35)
            .shadowOffset(0, 20)
            .shadowBlur(20)
            .shadowColor(Colors.black38)
            .makeCentered(),
        backgroundColor: Colors.white,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          10.heightBox,
          TextField(
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                hintText: "Search Movies here",
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide())),
          ),
          5.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.heightBox,
                  MovieListWidget(
                    moviesList: trendingMovies,
                    title: "Trending Movies",
                    enlargeCenter: true,
                    autoPlay: true,
                    width: 250,
                    height: 300,
                    color: Colors.black54,
                  ),
                  8.heightBox,
                  MovieListWidget(
                      moviesList: topRatedMovies,
                      title: "Top-Rated Movies",
                      enlargeCenter: false,
                      autoPlay: false,
                      width: 250,
                      height: 200,
                      color: redColor),
                  8.heightBox,
                  MovieListWidget(
                      moviesList: upComingMovies,
                      title: "Up-Coming Movies",
                      enlargeCenter: false,
                      autoPlay: false,
                      width: 250,
                      height: 200,
                      color: redColor),
                ],
              ).box.padding(const EdgeInsets.all(7)).make(),
            ),
          ),
        ],
      ),
    );
  }
}
