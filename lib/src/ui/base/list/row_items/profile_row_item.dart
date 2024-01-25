import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

class ProfileRowItem extends StatelessWidget {
  final String? initials;

  final String? firstName;

  final String? lastName;

  final String? imageUrl;

  const ProfileRowItem({
    super.key,
    this.initials,
    this.firstName,
    this.lastName,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 27,
            width: 27,
            child: InitialsAvatar(
              initials: initials ??
                  '${firstName?.split('').first ?? ''} ${lastName?.split('').first}',
            ),
          ),
          const SizedBox(
            width: PaddingSizes.smallPadding,
          ),
          Expanded(
            child: MainText(
              '${firstName ?? ''} ${lastName ?? ''}',
              textStyleOverride: TextStyles.mainStyle.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
