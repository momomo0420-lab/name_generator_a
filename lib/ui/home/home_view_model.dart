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

  bool isGeneratable() => state.send != '';

  Future<void> generateName() async {
    const receiveMessage = '名前の候補を以下に示します。\n'
      '------------------------------------------\n\n';
    state = state.copyWith(
      receive: receiveMessage,
      isLoading: true,
    );

    final repository = ref.read(generatorRepositoryProvider);
    final stream = repository.generateName(state.send);
    state = state.copyWith(send: '');

    await for(var response in stream) {
      state = state.copyWith(receive: state.receive + response);
    }

    state = state.copyWith(isLoading: false);
  }
}
