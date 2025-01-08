import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InputSelectionForm extends StatefulWidget {
  final String? label;

  final Function(dynamic value)? onSelected;

  final Function(String? value)? onChanged;

  final dynamic value;

  final String? hint;

  final Map<dynamic, String> options;

  final bool enabled;

  final bool enableText;

  const InputSelectionForm({
    super.key,
    this.label,
    this.onSelected,
    this.onChanged,
    this.value,
    this.hint,
    this.enabled = true,
    this.enableText = true,
    required this.options,
  });

  @override
  State<InputSelectionForm> createState() => _InputSelectionFormState();
}

class _InputSelectionFormState extends State<InputSelectionForm> {
  late final TextEditingController controller =
      TextEditingController(text: widget.options[widget.value])
        ..addListener(
          () => widget.onChanged?.call(controller.text),
        );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InputForm(
        label: widget.label,
        child: LayoutBuilder(builder: (context, constraints) {
          if (!widget.enabled) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: GawTheme.specialBackground,
                border: const Border.fromBorderSide(
                  Borders.lightSide,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: PaddingSizes.mainPadding + 2,
                horizontal: PaddingSizes.mainPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MainText(
                  widget.options[widget.value] ?? '',
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    fontSize: 14,
                    color: GawTheme.text,
                  ),
                ),
              ),
            );
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: DropdownMenu(
              enabled: widget.enabled,
              menuHeight: 180,
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: Borders.lightSelectedInputSide.copyWith(
                    color: GawTheme.mainTint,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: Borders.lightUnselectedInputSide.copyWith(
                    color: GawTheme.unselectedBackground,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: Borders.lightUnselectedInputSide.copyWith(
                    color: GawTheme.unselectedBackground,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(
                  PaddingSizes.smallPadding,
                ),
                hintStyle: TextStyles.mainStyle.copyWith(fontSize: 14),
                labelStyle: TextStyles.mainStyle.copyWith(fontSize: 14),
              ),
              width: constraints.maxWidth,
              controller: controller,
              onSelected: widget.onSelected,
              dropdownMenuEntries: buildEntries(),
            ),
          );
        }),
      ),
    );
  }

  List<DropdownMenuEntry> buildEntries() {
    List<DropdownMenuEntry> entries = [];

    for (dynamic key in widget.options.keys) {
      entries.add(
        DropdownMenuEntry(
          value: key,
          label: widget.options[key] ?? '',
          style: ButtonStyle(
            shadowColor: MaterialStateColor.resolveWith(
              (states) => Colors.transparent,
            ),
            foregroundColor: MaterialStateColor.resolveWith(
              (states) => GawTheme.text,
            ),
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => GawTheme.clearBackground,
            ),
          ),
        ),
      );
    }

    return entries;
  }
}
