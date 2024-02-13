import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class InputMultiSelectionForm extends StatelessWidget {
  final Map<String, int> options;

  const InputMultiSelectionForm({
    super.key,
    required this.options,
  });

  List<ValueItem<int>> getOptions() {
    return options.keys
        .map((key) => ValueItem(label: key, value: options[key]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown<int>(
      onOptionSelected: (List<ValueItem> selectedOptions) {},
      options: getOptions(),
      selectionType: SelectionType.single,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 300,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),
    );
  }
}
