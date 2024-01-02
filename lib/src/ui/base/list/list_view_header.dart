import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ListViewHeader extends StatelessWidget {
  final String headerLabel;

  final Function(String)? onSearch;

  final Function()? onDelete;

  const ListViewHeader({
    super.key,
    required this.headerLabel,
    this.onSearch,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        border: Border(
          bottom: Borders.mainSide,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: PaddingSizes.smallPadding,
            ),
            child: MainText(
              headerLabel,
              textStyleOverride: TextStyles.mainStyleTitle.copyWith(
                fontSize: 21,
              ),
            ),
          ),
          const Spacer(),
          Visibility(
            visible: onDelete != null,
            child: GestureDetector(
              onTap: onDelete,
              child: const SizedBox(
                height: 24,
                width: 24,
                child: SvgIcon(
                  PixelPerfectIcons.trashMedium,
                  color: GawTheme.unselectedText,
                ),
              ),
            ),
          ),
          Visibility(
            visible: onSearch != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.mainPadding,
                vertical: PaddingSizes.mainPadding,
              ),
              child: SizedBox(
                width: 180,
                child: TextField(
                  onSubmitted: onSearch,
                  decoration: InputStyles.largeDecoration.copyWith(
                    hintText: LocaleKeys.search.tr(),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(
                        PaddingSizes.smallPadding,
                      ),
                      child: SvgIcon(
                        PixelPerfectIcons.zoomMedium,
                        color: GawTheme.text,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
