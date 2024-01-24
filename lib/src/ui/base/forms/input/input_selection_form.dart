import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/forms/input/input_form.dart';

class InputSelectionForm extends StatefulWidget {
  final String label;

  final Function(String value)? onSelected;

  final Function(String? value)? onChanged;

  final String? hint;

  final Map<String, String> options;

  const InputSelectionForm({
    super.key,
    required this.label,
    this.onSelected,
    this.onChanged,
    this.hint,
    required this.options,
  });

  @override
  State<InputSelectionForm> createState() => _InputSelectionFormState();
}

class _InputSelectionFormState extends State<InputSelectionForm> {
  late final TextEditingController controller = TextEditingController()
    ..addListener(
      () => widget.onChanged?.call(controller.text),
    );

  @override
  Widget build(BuildContext context) {
    return InputForm(
      label: widget.label,
      child: LayoutBuilder(builder: (context, constraints) {
        return DropdownMenu(
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
          onSelected: (value) {
            widget.onSelected?.call(value as String);
          },
          dropdownMenuEntries: buildEntries(),
        );
      }),
    );
  }

  List<DropdownMenuEntry> buildEntries() {
    List<DropdownMenuEntry> entries = [];

    for (String key in widget.options.keys) {
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
