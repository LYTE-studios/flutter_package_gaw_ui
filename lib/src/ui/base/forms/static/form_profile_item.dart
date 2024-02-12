import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class FormProfileItem extends StatelessWidget {
  final String? initials;

  final String? firstName;

  final String? lastName;

  final String? imageUrl;

  const FormProfileItem({
    super.key,
    this.initials,
    this.firstName,
    this.lastName,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: GawTheme.clearText,
        border: const Border.fromBorderSide(
          Borders.lightSide,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: PaddingSizes.mainPadding + 2,
        horizontal: PaddingSizes.mainPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: ProfilePictureAvatar(
              showCircle: false,
              canEdit: false,
              imageUrl: imageUrl,
            ),
          ),
          const SizedBox(
            width: PaddingSizes.smallPadding,
          ),
          Expanded(
            child: MainText(
              '${firstName ?? ''} ${lastName ?? ''}',
              overflow: TextOverflow.ellipsis,
              textStyleOverride: TextStyles.mainStyle.copyWith(
                color: GawTheme.specialText,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
