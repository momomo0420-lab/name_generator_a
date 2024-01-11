import 'package:name_generator_a/data/data_source/data_source.dart';
import 'package:name_generator_a/data/repository/generator_repository.dart';

class GeneratorRepositoryImpl implements GeneratorRepository {
  final DataSource _dataSource;

  const GeneratorRepositoryImpl(
    DataSource dataSource,
  ): _dataSource = dataSource;

  @override
  Stream<String> generateName({
    required String type,
    required String role,
  }) {
    return _dataSource.generateName(type, role);
  }
}