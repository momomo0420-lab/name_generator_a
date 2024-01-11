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

  void setType(String type) {
    state = state.copyWith(type: type);
  }

  void setRole(String role) {
    state = state.copyWith(role: role);
  }

  bool canGenerate() => (state.type != '') && (state.role != '');

  Future<void> generateName() async {
    state = state.copyWith(
      response: '',
      isLoading: true,
    );

    final repository = ref.read(generatorRepositoryProvider);
    final stream = repository.generateName(
      type: state.type,
      role: state.role,
    );
    state = state.copyWith(role: '');

    await for(var response in stream) {
      state = state.copyWith(response: state.response + response);
    }

    state = state.copyWith(isLoading: false);
  }
}
