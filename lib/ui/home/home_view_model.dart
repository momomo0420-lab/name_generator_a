import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:name_generator_a/app_container.dart';
import 'package:name_generator_a/ui/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    return const HomeState();
  }

  void setSendMessage(String message) {
    state = state.copyWith(send: message);
  }

  void sendMessage() {
    final gemini = ref.read(geminiProvider);
    final content = gemini.streamGenerateContent(state.send);
    content.listen((event) {
      final message = (event.output == null) ? '' : event.output!;
      state = state.copyWith(receive: state.receive + message);
    });
  }
}
