import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:name_generator_a/ui/home/home_state.dart';
import 'package:name_generator_a/ui/home/home_view_model.dart';
import 'package:name_generator_a/ui/widget/one_line_text_field.dart';

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
      children: [
        OneLineTextField(
          controller: useTextEditingController(text: _state.send),
          hint: '聞きたいことは何ですか？',
          isLoading: _state.isLoading,
          isSendable: _viewModel.isGeneratable(),
          onChanged: (message) => _viewModel.setSendMessage(message),
          onSend: () => _viewModel.generateName(),
        ),
        const SizedBox(height: 10,),

        Text(_state.receive),
      ],
    );
  }
}
