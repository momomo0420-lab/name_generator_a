import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:name_generator_a/data/data_source/data_source.dart';

class DataSourceImpl implements DataSource {
  final Gemini _gemini;

  const DataSourceImpl(
    Gemini gemini,
  ): _gemini = gemini;

  @override
  Stream<String> getAiChatResponse(String message) async* {
    debugPrint(message);
    final content = _gemini.streamGenerateContent(message);

    await for(var value in content) {
      final response = (value.output == null) ? '' : value.output!;
      yield response;
    }
  }
}