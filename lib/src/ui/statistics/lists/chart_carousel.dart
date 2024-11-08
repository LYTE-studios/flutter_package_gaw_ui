import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class ChartCarousel extends StatelessWidget {
  final List<Widget> charts;

  final Function(int)? pageIndexChanged;

  const ChartCarousel({
    super.key,
    required this.charts,
    this.pageIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: charts.length,
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          pageIndexChanged?.call(index);
        },
        reverse: false,
        aspectRatio: 1.1,
        initialPage: charts.length,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: 1,
        padEnds: true,
      ),
      itemBuilder: (context, index, realIndex) => charts[index],
    );
  }
}
