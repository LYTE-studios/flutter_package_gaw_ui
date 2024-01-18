import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class NotificationsListTile extends StatelessWidget {
  final String svgIcon;

  final String label;

  final Function()? onTap;

  final DateTime date;

  final bool onlyTopRadius;

  final bool onlyBottomRadius;

  final Color color;

  const NotificationsListTile(
      {super.key,
      required this.label,
      this.svgIcon = 'assets/images/core/main_logo_small.svg',
      this.onTap,
      required this.date,
      this.onlyTopRadius = false,
      this.onlyBottomRadius = false,
      this.color = GawTheme.secondaryTint});

  final Radius radius = const Radius.circular(12);

  bool containsApprovalOrDenial() {
    // Normalize the label text to lower case to make the check case-insensitive
    String lowerCaseLabel = label.toLowerCase();

    // Check if the label contains 'approved' or 'denied'
    return lowerCaseLabel.contains('approved') ||
        lowerCaseLabel.contains('denied');
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.zero;

    if (onlyTopRadius) {
      borderRadius = BorderRadius.only(
        topLeft: radius,
        topRight: radius,
      );
    }

    if (onlyBottomRadius) {
      borderRadius = BorderRadius.only(
        bottomLeft: radius,
        bottomRight: radius,
      );
    }

    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(builder: (context, constraints) {
        return Ink(
          height: 56,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              const SizedBox(width: PaddingSizes.smallPadding),
              CircleAvatar(
                  backgroundColor: GawTheme.background,
                  child: SvgIcon(
                    svgIcon,
                    color: GawTheme.mainTint,
                  )),
              const SizedBox(width: PaddingSizes.smallPadding),
              Expanded(
                child: containsApprovalOrDenial()
                    ? _formatJobConfirm()
                    : (label.length < 45 ? _formatNormal() : _formatLong()),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _formatNormal() {
    return Padding(
        padding: const EdgeInsets.only(
          right: PaddingSizes.smallPadding,
        ),
        child: Row(
          children: [
            Text(
              label,
              maxLines: 2,
              softWrap: true,
              style: TextStyles.mainStyleTitle.copyWith(
                color: GawTheme.text,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            Text(
              ' ${timeAgo(date)}',
              style: TextStyles.mainStyleTitle.copyWith(
                color: GawTheme.statsText,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            )
          ],
        ));
  }

  Widget _formatLong() {
    String labelFirst = label.substring(0, 45);
    String labelSecond = label.substring(45, label.length);
    return Padding(
        padding: const EdgeInsets.only(
          right: PaddingSizes.smallPadding,
          top: PaddingSizes.smallPadding + 2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  labelFirst,
                  style: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.text,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  labelSecond.length > 40
                      ? '${labelSecond.substring(0, 40)}...'
                      : labelSecond,
                  style: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.text,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Text(
                  ' ${timeAgo(date)}',
                  style: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.statsText,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget _formatJobConfirm() {
    List<String> splitStrings = splitLabelByApprovalStatus();
    return Padding(
        padding: const EdgeInsets.only(
          right: PaddingSizes.smallPadding,
          top: PaddingSizes.smallPadding + 2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  splitStrings[0],
                  style: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.text,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Text(
                  splitStrings[1],
                  style: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.text,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  splitStrings[2],
                  style: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.text,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Text(
                  ' ${timeAgo(date)}',
                  style: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.statsText,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                )
              ],
            )
          ],
        ));
  }

  List<String> splitLabelByApprovalStatus() {
    List<String> splitStrings = [];
    String lowerCaseLabel = label.toLowerCase();
    int startIndex;

    if (lowerCaseLabel.contains('approved')) {
      startIndex = lowerCaseLabel.indexOf('approved');
      splitStrings.add(label.substring(0, startIndex));
      splitStrings
          .add(label.substring(startIndex, startIndex + 'approved'.length));
      splitStrings.add(label.substring(startIndex + 'approved'.length + 1));
    } else if (lowerCaseLabel.contains('denied')) {
      startIndex = lowerCaseLabel.indexOf('denied');
      splitStrings.add(label.substring(0, startIndex));
      splitStrings
          .add(label.substring(startIndex, startIndex + 'denied'.length));
      splitStrings.add(label.substring(startIndex + 'denied'.length + 1));
    } else {
      // If neither 'approved' nor 'denied' is found in the label, return the original label as the only element in the list.
      splitStrings.add(label);
      splitStrings.add('');
      splitStrings.add('');
    }

    return splitStrings;
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'today';
    } else if (difference > 0 && difference <= 30) {
      return '${difference}d';
    } else {
      // Handle the case for dates older than 30 days
      return 'more than 30d';
    }
  }
}
