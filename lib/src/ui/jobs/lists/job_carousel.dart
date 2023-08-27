import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class JobCarousel extends StatelessWidget {
  final List<Widget> carouselItems;

  const JobCarousel({
    super.key,
    required this.carouselItems,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselItems,
      options: CarouselOptions(),
    );
  }
}
