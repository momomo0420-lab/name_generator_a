import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:name_generator_a/data/data_source/data_source.dart';
import 'package:name_generator_a/data/data_source/data_source_impl.dart';
import 'package:name_generator_a/data/repository/generator_repository.dart';
import 'package:name_generator_a/data/repository/generator_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_container.g.dart';

@riverpod
DataSource dataSource(DataSourceRef ref) {
  final gemini = Gemini.instance;
  return DataSourceImpl(gemini);
}

@riverpod
GeneratorRepository generatorRepository(GeneratorRepositoryRef ref) {
  final dio = ref.watch(dataSourceProvider);
  return GeneratorRepositoryImpl(dio);
}
