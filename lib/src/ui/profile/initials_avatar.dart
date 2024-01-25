import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:http/http.dart';

class InitialsAvatar extends StatefulWidget {
  final String initials;

  final String? imageUrl;

  const InitialsAvatar({
    super.key,
    required this.initials,
    this.imageUrl,
  });

  @override
  State<InitialsAvatar> createState() => _InitialsAvatarState();
}

class _InitialsAvatarState extends State<InitialsAvatar> {
  Uint8List? bytes;

  void loadImage() {
    // if the url is null, return null.
    if (widget.imageUrl == null) {
      return;
    }

    get(
      Uri.parse(widget.imageUrl!),
    ).then((Response response) {
      setState(() {
        bytes = response.bodyBytes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 48,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: GawTheme.darkBackground,
      ),
      child: bytes != null
          ? Image.memory(
              bytes!,
              fit: BoxFit.fill,
            )
          : Center(
              child: MainText(
                widget.initials,
                alignment: TextAlign.center,
                textStyleOverride: TextStyles.titleStyle.copyWith(
                  fontSize: 14,
                  color: GawTheme.clearText,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
    );
  }
}
