import 'package:name_generator_a/data/data_source/data_source.dart';
import 'package:name_generator_a/data/repository/generator_repository.dart';

class GeneratorRepositoryImpl implements GeneratorRepository {
  final DataSource _dio;

  const GeneratorRepositoryImpl(
    DataSource dio,
  ): _dio = dio;

  @override
  Stream<String> generateName(String message) {
    return _dio.getAiChatResponse(message);
  }
}