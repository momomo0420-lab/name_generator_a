import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:name_generator_a/ui/home/home_screen.dart';

/// アプリの全画面構成
enum AppScreens {
  home('/'),
  ;

  final String screen;

  const AppScreens(this.screen);
}

class AppNavigator extends StatelessWidget {
  /// 画面のナビゲーションを生成する。
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '名前生成アプリ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _buildGoRouter(),
    );
  }

  /// 画面遷移のための構成を作成する。
  GoRouter _buildGoRouter() {
    return GoRouter(
      initialLocation: AppScreens.home.screen,
      routes: [
        GoRoute(
          path: AppScreens.home.screen,
          builder: _buildHomeScreen,
        ),
      ],
    );
  }

  /// ホーム画面を作成する。
  ///
  /// 遷移時のパラメータとして[context]、[state]を使用する。
  Widget _buildHomeScreen(
    BuildContext context,
    GoRouterState state,
  ) {
    return const HomeScreen();
  }
}