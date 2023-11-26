import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/list_items/job_carousel_item.dart';

class JobCarousel extends StatefulWidget {
  final List<Job> jobs;

  final Function(Job)? onPressJob;

  const JobCarousel({
    super.key,
    required this.jobs,
    this.onPressJob,
  });

  @override
  State<JobCarousel> createState() => _JobCarouselState();
}

class _JobCarouselState extends State<JobCarousel> {
  @override
  Widget build(BuildContext context) {
    return widget.jobs.isEmpty
        ? const NoItemsItem()
        : Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 180,
                  enlargeCenterPage: false,
                  viewportFraction: 0.45,
                  enableInfiniteScroll: false,
                  padEnds: false,
                ),
                itemCount: widget.jobs.length,
                itemBuilder: (context, index, pageId) {
                  if (widget.jobs.isEmpty) {
                    return const SizedBox();
                  }

                  Job job = widget.jobs[index];

                  return GestureDetector(
                    onTap: () {
                      widget.onPressJob?.call(
                        job,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PaddingSizes.smallPadding,
                      ),
                      child: SizedBox(
                        width: 200,
                        child: JobCarouselItem(
                          job: job,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
  }
}
