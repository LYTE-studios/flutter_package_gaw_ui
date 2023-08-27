import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/utility/date_time_util.dart';

class JobCarouselItem extends StatelessWidget {
  final DateTime startTime;

  final DateTime endTime;

  final String formattedAddress;

  final String initials;

  final int washersApplied;

  final int maxWashers;

  const JobCarouselItem({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.formattedAddress,
    required this.initials,
    required this.washersApplied,
    required this.maxWashers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GawTheme.secondaryTint,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                const SvgImage(
                  'assets/images/map/map_preview.svg',
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(PaddingSizes.bigPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainText(DateTimeUtil.toMonthYear(startTime)),
                      const SizedBox(
                        height: PaddingSizes.smallPadding,
                      ),
                      MainText(
                        DateTimeUtil.toHoursMinutesInterval(
                          startTime,
                          endTime,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  MainText(formattedAddress),
                  MainText(initials),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const SvgIcon(PixelPerfectIcons.personMedium),
                  const SizedBox(
                    width: PaddingSizes.smallPadding,
                  ),
                  MainText(
                    '$washersApplied / $maxWashers',
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
