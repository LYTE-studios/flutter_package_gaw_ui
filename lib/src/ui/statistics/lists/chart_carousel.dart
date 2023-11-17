import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ChartCarousel extends StatelessWidget {
  final List<Widget> charts;

  const ChartCarousel({
    super.key,
    required this.charts,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: charts.length,
      options: CarouselOptions(
        reverse: true,
        aspectRatio: 1.05,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        viewportFraction: 1,
        padEnds: false,
      ),
      itemBuilder: (context, index, realIndex) => charts[index],
    );
  }
}
