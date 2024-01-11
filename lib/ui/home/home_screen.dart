import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:name_generator_a/ui/home/home_body.dart';
import 'package:name_generator_a/ui/home/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('名前生成アプリ')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeBody(
            state: state,
            viewModel: viewModel,
          ),
        ),
      ),
    );
  }
}
