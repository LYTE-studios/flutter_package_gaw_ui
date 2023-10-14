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
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      itemBuilder: (context, index, realIndex) => charts[index],
    );
  }
}
