import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/apply_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/done_state_block.dart';

class JobListItem extends StatelessWidget {
  final Job job;

  const JobListItem({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
        color: GawTheme.clearBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          Shadows.mainShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSizes.mainPadding,
            ),
            child: SizedBox(
              height: 64,
              width: 64,
              child: buildPicture(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                PaddingSizes.smallPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingSizes.mainPadding,
                    ),
                    child: Row(
                      children: [
                        MainText(
                          GawDateUtil.formatDate(
                            GawDateUtil.fromApi(job.startTime),
                          ),
                          textStyleOverride: TextStyles.mainStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: PaddingSizes.smallPadding,
                        ),
                        MainText(
                          GawDateUtil.formatTimeInterval(
                            GawDateUtil.fromApi(job.startTime),
                            GawDateUtil.fromApi(job.endTime),
                          ),
                          color: GawTheme.unselectedText,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingSizes.extraSmallPadding,
                    ),
                    child: JobApplicationState.approved !=
                            JobApplicationState.approved
                        ? MainText(job.address.shortAddress())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                job.address.formattedStreetAddress(),
                              ),
                              MainText(
                                job.address.shortAddress(),
                                color: GawTheme.unselectedText,
                              )
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 126,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                [JobState.done, JobState.cancelled].contains(job.state)
                    ? const SizedBox()
                    : const Padding(
                        padding: EdgeInsets.only(
                          bottom: PaddingSizes.bigPadding,
                          right: PaddingSizes.bigPadding,
                        ),
                        child: SizedBox(
                          width: 21,
                          child: SvgIcon(
                            PixelPerfectIcons.arrowRightMedium,
                            color: GawTheme.text,
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: PaddingSizes.bigPadding,
                  ),
                  child: buildStateBlock(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStateBlock() {
    if ([JobState.done, JobState.cancelled].contains(job.state)) {
      return const DoneStateBlock();
    }
    return const ApplyStateBlock();
  }

  Widget buildPicture() {
    if (job.customer.profilePictureUrl == null) {
      return InitialsAvatar(
        initials: job.customer.initials ?? '',
      );
    }

    return const SizedBox.shrink();
  }
}
