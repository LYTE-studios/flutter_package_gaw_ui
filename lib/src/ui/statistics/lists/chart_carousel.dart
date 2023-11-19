import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class ChartCarousel extends StatefulWidget {
  final List<Widget> charts;

  const ChartCarousel({
    super.key,
    required this.charts,
  });

  @override
  State<ChartCarousel> createState() => _ChartCarouselState();
}

class _ChartCarouselState extends State<ChartCarousel> {
  late int index;

  @override
  void initState() {
    index = widget.charts.length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.charts.length,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                this.index = index;
              });
            },
            reverse: true,
            aspectRatio: 1.2,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            viewportFraction: 1,
            padEnds: true,
          ),
          itemBuilder: (context, index, realIndex) => widget.charts[index],
        ),
        // CarouselIndicator(
        //   width: 8,
        //   height: 8,
        //   cornerRadius: 8,
        //   color: GawTheme.unselectedBackground,
        //   index: index,
        //   count: widget.charts.length,
        // ),
      ],
    );
  }
}
