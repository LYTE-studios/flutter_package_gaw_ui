import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ChartCarousel extends StatelessWidget {
  final CarouselController? controller;

  final List<Widget> charts;

  final Function(int)? pageIndexChanged;

  const ChartCarousel({
    super.key,
    this.controller,
    required this.charts,
    this.pageIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: controller,
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
