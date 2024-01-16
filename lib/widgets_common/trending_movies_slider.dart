import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_flix_2/consts/api_consts.dart';
import 'package:new_flix_2/consts/consts.dart';
import 'package:new_flix_2/screens/movie_details_screen.dart';

import '../models/movie_model_class.dart';

class SliderCustom extends StatefulWidget {
  final String title;
  final double size;
  final int count;
  final AsyncSnapshot snapshot;
  final bool enlargeCenter;
  final bool autoPlay;
  final double width;
  final double height;
  final Color color;

  const SliderCustom({
    required this.title,
    required this.size,
    required this.count,
    required this.snapshot,
    required this.enlargeCenter,
    required this.autoPlay,
    required this.width,
    required this.height,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  SliderCustomState createState() => SliderCustomState();
}

class SliderCustomState extends State<SliderCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title.text
            .color(widget.color)
            .shadowBlur(12)
            .shadowOffset(5, 10)
            .shadowColor(Colors.black38)
            .fontFamily(bold)
            .size(widget.size)
            .make(),
        20.heightBox,
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: widget.count,
            itemBuilder: ((context, index, realIndex) {
              final Movie movie = widget.snapshot.data[index];

              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailsScreen(movie: movie));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      SizedBox(
                        height: widget.height,
                        width: widget.width,
                        child: Image.network(
                          "${Constants.imageRootPath}${movie.posterPath}",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Ratings: ${movie.voteAverage}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            options: CarouselOptions(
              enlargeCenterPage: widget.enlargeCenter,
              aspectRatio: 16 / 9,
              height: widget.height,
              autoPlay: widget.autoPlay,
              viewportFraction: 0.65,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
          ),
        )
      ],
    );
  }
}
