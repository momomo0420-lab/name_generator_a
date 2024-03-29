import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('')
    String type,
    @Default('')
    String role,
    @Default('')
    String response,
    @Default(false)
    bool isLoading,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, Object?> json) => _$HomeStateFromJson(json);
}