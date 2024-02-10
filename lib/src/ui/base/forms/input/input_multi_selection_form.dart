import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class InputMultiSelectionForm extends StatelessWidget {
  const InputMultiSelectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown<int>(
      onOptionSelected: (List<ValueItem> selectedOptions) {},
      options: const <ValueItem<int>>[
        ValueItem(label: 'Option 1', value: 1),
        ValueItem(label: 'Option 2', value: 2),
        ValueItem(label: 'Option 3', value: 3),
        ValueItem(label: 'Option 4', value: 4),
        ValueItem(label: 'Option 5', value: 5),
        ValueItem(label: 'Option 6', value: 6),
      ],
      selectionType: SelectionType.single,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 300,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),
    );
  }
}
