import 'package:flutter/material.dart';
import 'package:new_flix_2/models/movie_model_class.dart';
import 'package:new_flix_2/widgets_common/trending_movies_slider.dart';

import '../consts/colors.dart';

class MovieListWidget extends StatefulWidget {
  final Future<List<Movie>> moviesList;
  final dynamic title;
  final bool autoPlay;
  final bool enlargeCenter;
  final double width;
  final double height;
  final Color color;

  const MovieListWidget(
      {super.key,
      required this.moviesList,
      required this.title,
      required this.enlargeCenter,
      required this.autoPlay,
      required this.width,
      required this.height,
      required this.color});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
          future: widget.moviesList,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return SliderCustom(
                  title: widget.title,
                  size: 22,
                  count: snapshot.data!.length,
                  snapshot: snapshot,
                  enlargeCenter: widget.enlargeCenter,
                  autoPlay: widget.autoPlay,
                  width: widget.width,
                  height: widget.height,
                  color: widget.color);
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            }
          })),
    );
  }
}
