import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:name_generator_a/ui/home/home_state.dart';
import 'package:name_generator_a/ui/home/home_view_model.dart';
import 'package:name_generator_a/ui/widget/multiple_lines_text_field.dart';

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
        MultipleLinesTextField(
          controller: useTextEditingController(),
          hint: '聞きたいことは何ですか？',
          onChanged: (text) => _viewModel.setSendMessage(text),
        ),
        const SizedBox(height: 10,),

        ElevatedButton(
          onPressed: () => _viewModel.sendMessage(),
          child: const Text('作成'),
        ),
        const SizedBox(height: 10,),

        Text(_state.receive),
      ],
    );
  }

  GeminiResponseTypeView _buildGeminiResponseTypeView() {
    return GeminiResponseTypeView(
      builder: (context, child, response, loading) {
        if(loading) {
          return const CircularProgressIndicator();
        }

        if(response != null) {
          return Text(response);
        } else {
          return const Text('END');
        }
      },
    );
  }
}
