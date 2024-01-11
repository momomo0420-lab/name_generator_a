import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_container.g.dart';

@riverpod
Gemini gemini(GeminiRef ref) {
  return Gemini.instance;
}