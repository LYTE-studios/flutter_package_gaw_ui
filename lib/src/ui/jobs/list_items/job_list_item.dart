import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/shadow/shadows.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/apply_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/approved_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/pending_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/jobs/state_blocks/rejected_state_block.dart';
import 'package:flutter_package_gaw_ui/src/ui/profile/avatar/initials_avatar.dart';

class JobListItem extends StatelessWidget {
  final Job job;

  const JobListItem({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
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
              height: 42,
              width: 42,
              child: buildPicture(),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(),
                Padding(
                  padding: const EdgeInsets.all(PaddingSizes.smallPadding),
                  child: MainText(
                    job.application == null
                        ? job.address.shortAddress()
                        : job.application?.state == JobApplicationState.approved
                            ? job.address.formattedAddres()
                            : job.address.shortAddress(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.all(PaddingSizes.smallPadding),
                  child: SizedBox(
                    width: 21,
                    child: SvgIcon(
                      PixelPerfectIcons.arrowRightNormal,
                      color: GawTheme.text,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: PaddingSizes.mainPadding,
                  ),
                  child: buildStateBlock(),
                ),
                const SizedBox(
                  height: PaddingSizes.mainPadding,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStateBlock() {
    if (job.application == null) {
      return const ApplyStateBlock();
    }

    switch (job.application!.state) {
      case JobApplicationState.approved:
        return const ApprovedStateBlock();
      case JobApplicationState.rejected:
        return const RejectedStateBlock();
      case JobApplicationState.pending:
        return const PendingStateBlock();
    }

    return PendingStateBlock();
  }

  Widget buildPicture() {
    if (job.customer.profilePictureUrl == null) {
      return InitialsAvatar(
        initials: job.customer.initials,
      );
    }

    return const SizedBox.shrink();
  }
}
