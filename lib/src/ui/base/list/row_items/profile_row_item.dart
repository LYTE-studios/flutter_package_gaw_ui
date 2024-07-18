import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ProfileRowItem extends StatelessWidget {
  final String? initials;

  final String? firstName;

  final String? lastName;

  final String? imageUrl;

  final double? fixedWidth;

  final Function()? onTap;

  const ProfileRowItem({
    super.key,
    this.initials,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.fixedWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      child: ColorlessInkWell(
        onTap: onTap,
        child: SizedBox(
          width: fixedWidth,
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
        ),
      ),
    );
  }
}
