import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class JobCarouselItem extends StatelessWidget {
  final Job job;

  const JobCarouselItem({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 170,
      decoration: BoxDecoration(
        color: GawTheme.unselectedBackground,
        border: Border.all(
          color: GawTheme.unselectedText.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          Shadows.mainShadow,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                const SvgImage(
                  'assets/images/map/map_preview.svg',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: PaddingSizes.bigPadding,
                    left: PaddingSizes.bigPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        GawDateUtil.formatDate(
                          GawDateUtil.fromApi(job.startTime),
                        ),
                        textStyleOverride: TextStyles.titleStyle.copyWith(
                          fontSize: 18,
                          color: GawTheme.text,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: PaddingSizes.smallPadding,
                      ),
                      MainText(
                        GawDateUtil.formatTimeInterval(
                          GawDateUtil.fromApi(job.startTime),
                          GawDateUtil.fromApi(job.endTime),
                        ),
                        textStyleOverride: TextStyles.mainStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: GawTheme.secondaryTint,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: PaddingSizes.smallPadding,
                          left: PaddingSizes.bigPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(
                              job.address.city ?? job.address.postalCode ?? '',
                              textStyleOverride: TextStyles.mainStyle.copyWith(
                                color: GawTheme.mainTintText,
                              ),
                            ),
                            MainText(
                              job.customer.initials ?? '',
                              textStyleOverride: TextStyles.mainStyle.copyWith(
                                fontSize: 14,
                                color: GawTheme.mainTintUnselectedText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: PaddingSizes.bigPadding,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: PaddingSizes.smallPadding,
                              ),
                              child: SizedBox(
                                height: 22,
                                width: 22,
                                child: SvgIcon(
                                  PixelPerfectIcons.personMedium,
                                  color: GawTheme.mainTintText,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: PaddingSizes.smallPadding,
                            ),
                            MainText(
                              '${job.selectedWashers}/${job.maxWashers}',
                              textStyleOverride:
                                  TextStyles.mainStyleTitle.copyWith(
                                color: GawTheme.mainTintText,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: PaddingSizes.mainPadding,
                      right: PaddingSizes.mainPadding,
                      bottom: PaddingSizes.mainPadding,
                    ),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: GawTheme.clearBackground,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          //Shadows.mainShadow,
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 4),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MainText(
                            LocaleKeys.apply.tr(),
                            color: GawTheme.secondaryTint,
                            textStyleOverride: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: GawTheme.secondaryTint,
                            ),
                          ),
                          const SizedBox(
                            width: PaddingSizes.extraSmallPadding,
                          ),
                          const SvgIcon(
                            PixelPerfectIcons.arrowRightCircleMedium,
                            color: GawTheme.secondaryTint,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
