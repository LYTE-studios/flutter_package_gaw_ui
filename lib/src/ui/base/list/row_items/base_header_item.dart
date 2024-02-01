import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseHeaderItem extends StatefulWidget {
  final String label;

  final Function(bool?)? onSort;

  final bool sorting;

  const BaseHeaderItem({
    super.key,
    required this.label,
    this.onSort,
    this.sorting = false,
  });

  @override
  State<BaseHeaderItem> createState() => _BaseHeaderItemState();
}

class _BaseHeaderItemState extends State<BaseHeaderItem> {
  bool ascending = true;

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      child: Row(
        children: [
          MainText(
            widget.label,
            textStyleOverride: TextStyles.mainStyle.copyWith(
              color: GawTheme.specialText,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Visibility(
            visible: widget.onSort != null,
            child: Padding(
              padding: const EdgeInsets.only(
                left: PaddingSizes.smallPadding,
              ),
              child: ColorlessInkWell(
                onTap: () {
                  if (!widget.sorting) {
                    setState(() {
                      ascending = false;
                    });
                    widget.onSort?.call(false);
                  } else {
                    if (ascending) {
                      setState(() {
                        ascending = true;
                      });
                      widget.onSort?.call(true);
                    } else {
                      setState(() {
                        ascending = true;
                      });
                      widget.onSort?.call(null);
                    }
                  }
                },
                child: const SizedBox(
                  height: 21,
                  width: 21,
                  child: SvgIcon(
                    PixelPerfectIcons.customSort,
                    color: GawTheme.text,
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
