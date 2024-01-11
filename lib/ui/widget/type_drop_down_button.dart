import 'package:flutter/material.dart';

enum TypeItems {
  none(''),
  classType('クラス'),
  variableType('変数'),
  functionType('関数'),
  defineType('定数')
  ;

  final String value;

  const TypeItems(this.value);
}

class TypeDropDownButton extends StatelessWidget {
  final String _selectedItem;
  final Function(String)? _onChanged;

  const TypeDropDownButton({
    super.key,
    required String selectedItem,
    Function(String type)? onChanged,
  }): _selectedItem = selectedItem,
        _onChanged = onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: TypeItems.none.value,
          child: const Text('--- タイプを選択してください ---'),
        ),
        DropdownMenuItem(
          value: TypeItems.classType.value,
          child: Text(TypeItems.classType.value),
        ),
        DropdownMenuItem(
          value: TypeItems.variableType.value,
          child: Text(TypeItems.variableType.value),
        ),
        DropdownMenuItem(
          value: TypeItems.functionType.value,
          child: Text(TypeItems.functionType.value),
        ),
        DropdownMenuItem(
          value: TypeItems.defineType.value,
          child: Text(TypeItems.defineType.value),
        ),
      ],
      value: _selectedItem,
      onChanged: (value) {
        final type = (value == null) ? '' : value;
        if(_onChanged != null) _onChanged!(type);
      },
    );
  }
}
