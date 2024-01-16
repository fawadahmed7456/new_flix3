import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:new_flix_2/consts/api_consts.dart';
import 'package:new_flix_2/consts/consts.dart';
import 'package:new_flix_2/consts/lists.dart';
import 'package:new_flix_2/models/movie_model_class.dart';
import 'package:new_flix_2/screens/favourite_movie_screen.dart';

import '../widgets_common/our_button.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;
  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Initialize the favouriteMovies list when the widget is first created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${Constants.imageRootPath}${widget.movie.backDropPath}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.movie.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          "Release Date: ${widget.movie.releaseDate}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        30.widthBox,
                        Column(
                          children: [
                            RatingBar.builder(
                              initialRating: widget.movie.voteAverage / 2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20.0,
                              itemPadding:
                                  EdgeInsets.zero, // No padding between stars
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            5.heightBox,
                            "${widget.movie.voteAverage.toStringAsFixed(1)} /10"
                                .text
                                .fontFamily(bold)
                                .size(15)
                                .make()
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Overview",
                    style: TextStyle(
                      color: redColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black38,
                          offset: Offset(5, 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.movie.overview,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add to Favorites",
                        style: TextStyle(
                          color: redColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black38,
                              offset: Offset(5, 10),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.movie.isFavourite =
                                !widget.movie.isFavourite;
                            if (widget.movie.isFavourite) {
                              // Check if movie is not already in the list
                              if (!favouriteMovies.contains(widget.movie)) {
                                favouriteMovies.add(widget.movie);
                              }
                            } else {
                              favouriteMovies.remove(widget.movie);
                            }
                          });
                        },
                        icon: Icon(
                          widget.movie.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  Center(
                    child: ourButton(() {
                      Get.to(() => FavoriteMoviesWidget(
                          favoriteMovies: favouriteMovies));
                    }, redColor, whiteColor, "Show Favourite Movies"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
