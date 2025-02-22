import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ListViewHeader extends StatefulWidget {
  final String headerLabel;

  final Function(String)? onSearch;
  final Function(String)? onChange;

  final Function()? onDelete;
  final bool canDelete;

  const ListViewHeader({
    super.key,
    required this.headerLabel,
    this.onSearch,
    this.onChange,
    this.onDelete,
    this.canDelete = false,
  });

  @override
  State<ListViewHeader> createState() => _ListViewHeaderState();
}

class _ListViewHeaderState extends State<ListViewHeader> {
  bool hoveringDelete = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: PaddingSizes.bigPadding,
            ),
            child: MainText(
              widget.headerLabel,
              textStyleOverride: TextStyles.mainStyleTitle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          !widget.canDelete
              ? const SizedBox()
              : ColorlessInkWell(
                  onTap: widget.onDelete,
                  onExitHover: () {
                    setState(() {
                      hoveringDelete = false;
                    });
                  },
                  onHover: () {
                    setState(() {
                      hoveringDelete = true;
                    });
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgIcon(
                      PixelPerfectIcons.trashMedium,
                      color: widget.canDelete
                          ? GawTheme.error
                          : GawTheme.unselectedText,
                    ),
                  ),
                ),
          Visibility(
            visible: widget.onSearch != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.mainPadding,
                vertical: PaddingSizes.mainPadding,
              ),
              child: SizedBox(
                width: 180,
                child: TextField(
                  onSubmitted: widget.onSearch,
                  onChanged: widget.onChange,
                  cursorHeight: 16,
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
