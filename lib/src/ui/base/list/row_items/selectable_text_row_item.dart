import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaw_ui/gaw_ui.dart';

class SelectableTextRowItem extends StatelessWidget {
  final String? value;

  final double? fixedWidth;

  final int? flex;

  const SelectableTextRowItem({
    super.key,
    this.value,
    this.fixedWidth,
    this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      child: SizedBox(
        width: fixedWidth,
        child: ColorlessInkWell(
          onTap: () {
            if (value == null) {
              return;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 0,
                duration: const Duration(
                  seconds: 1,
                ),
                backgroundColor: Colors.transparent,
                content: BasicSnackBar(
                  title: '${LocaleKeys.copied.tr()}!',
                  description:
                      '${value ?? '${LocaleKeys.something.tr()}..'} ${LocaleKeys.gotCopiedToYourClipboard.tr()}',
                ),
              ),
            );

            Clipboard.setData(
              ClipboardData(
                text: value ?? '',
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: PaddingSizes.smallPadding,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth - 20,
                    ),
                    child: MainText(
                      value ?? '',
                      overflow: TextOverflow.ellipsis,
                      alignment: TextAlign.left,
                    ),
                  ),
                  Visibility(
                    visible: value?.isNotEmpty ?? false,
                    child: const Padding(
                      padding: EdgeInsets.all(
                        PaddingSizes.extraMiniPadding,
                      ),
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child: SvgIcon(
                          PixelPerfectIcons.customCopy,
                          color: GawTheme.unselectedText,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
