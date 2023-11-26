import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/apply_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/approved_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/done_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/pending_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/rejected_state_block.dart';

class JobListItem extends StatelessWidget {
  final Job job;

  final JobApplication? application;

  const JobListItem({
    super.key,
    required this.job,
    this.application,
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
                    child: MainText(
                      job.address.shortAddress(),
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

    if (application?.state == JobApplicationState.pending) {
      return const PendingStateBlock();
    }

    if (application?.state == JobApplicationState.approved) {
      return const ApprovedStateBlock();
    }

    if (application?.state == JobApplicationState.rejected) {
      return const RejectedStateBlock();
    }

    return const ApplyStateBlock();
  }

  Widget buildPicture() {
    return InitialsAvatar(
      initials: job.customer.initials ?? '',
    );
  }
}
