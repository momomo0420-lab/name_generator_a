import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:name_generator_a/data/data_source/data_source.dart';

class DataSourceImpl implements DataSource {
  final Gemini _gemini;

  const DataSourceImpl(
    Gemini gemini,
  ): _gemini = gemini;

  @override
  Stream<String> generateName(String type, String role) async* {
    final prompt = _createPrompt(type, role);
    final content = _gemini.streamGenerateContent(prompt);

    const header = '名前の候補は以下となります。\n'
      '------------------------------------------\n';
    yield header;

    await for(var value in content) {
      final response = (value.output == null) ? '' : value.output!;
      yield response;
    }
  }

  String _createPrompt(String type, String role) {
    return '''
      あなたはFlutterアプリの開発者です。
      以下の役割を持つ$typeの名前を考えてください。
      ----------------------\n
        ・$role
      ''';
  }
}