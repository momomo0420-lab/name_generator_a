import 'package:flutter/material.dart';

/// 一行の入力フォーム
class OneLineTextField extends StatelessWidget {
  // コントローラー
  final TextEditingController _controller;
  // ラベル
  final String? _label;
  // ヒント
  final String? _hint;
  // ロード中かどうか？
  final bool _isLoading;
  // 送信可能かどうか？
  final bool _canGenerate;
  // 入力された際の動作
  final Function(String)? _onChanged;
  // 送信された際の動作
  final Function()? _onGenerate;

  /// 一行の入力フォームを生成する。
  ///
  /// [controller]に入力用のコントローラを設定する（必須）。
  /// [label]、[hint]にはフォームに表示されるラベルとヒントを設定する。
  /// [onChanged]は入力された際の動作を登録する。[value]には入力された文字列が渡される。
  /// [onGenerate]はフォームの文字列が送信された際の動作を登録する。
  const OneLineTextField({
    super.key,
    required TextEditingController controller,
    String? label,
    String? hint,
    bool isLoading = false,
    bool canGenerate = true,
    Function(String value)? onChanged,
    Function()? onGenerate,
  }): _controller = controller,
        _label = label,
        _hint = hint,
        _isLoading = isLoading,
        _canGenerate = canGenerate,
        _onChanged = onChanged,
        _onGenerate = onGenerate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: _controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: _label,
        hintText: _hint,
        border: const OutlineInputBorder(),
        suffixIcon: _buildGenerateButton(),
      ),
      onChanged: _onChanged,
    );
  }

  Widget _buildGenerateButton() {
    if(_isLoading) {
      return const CircularProgressIndicator();
    }

    return IconButton(
      onPressed: !_canGenerate ? null : () {
        if(_onGenerate != null) _onGenerate!();
        _controller.clear();
      },
      icon: const Icon(Icons.send),
    );
  }
}