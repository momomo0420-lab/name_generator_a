import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:name_generator_a/ui/home/home_state.dart';
import 'package:name_generator_a/ui/home/home_view_model.dart';
import 'package:name_generator_a/ui/widget/one_line_text_field.dart';
import 'package:name_generator_a/ui/widget/type_drop_down_button.dart';

class HomeBody extends HookWidget {
  final HomeState _state;
  final HomeViewModel _viewModel;

  const HomeBody({
    super.key,
    required HomeState state,
    required HomeViewModel viewModel,
  }): _viewModel = viewModel,
    _state = state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypeDropDownButton(
          selectedItem: _state.type,
          onChanged: (type) => _viewModel.setType(type),
        ),
        const SizedBox(height: 10,),

        OneLineTextField(
          controller: useTextEditingController(),
          label: '役割',
          hint: '役割を入力してください',
          isLoading: _state.isLoading,
          canGenerate: _viewModel.canGenerate(),
          onChanged: (role) => _viewModel.setRole(role),
          onGenerate: () => _viewModel.generateName(),
        ),
        const SizedBox(height: 10,),

        Text(_state.response),
      ],
    );
  }
}
