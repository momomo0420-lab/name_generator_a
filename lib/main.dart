import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:name_generator_a/app_navigator.dart';
import 'package:name_generator_a/env/env.dart';

void main() {
  Gemini.init(apiKey: Env.key);

  runApp(
    const ProviderScope(
      child: AppNavigator(),
    ),
  );
}
