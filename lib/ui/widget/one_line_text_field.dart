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
  final bool _isSendable;
  // 入力された際の動作
  final Function(String)? _onChanged;
  // 送信された際の動作
  final Function()? _onSend;

  /// 一行の入力フォームを生成する。
  ///
  /// [controller]に入力用のコントローラを設定する（必須）。
  /// [label]、[hint]にはフォームに表示されるラベルとヒントを設定する。
  /// [onChanged]は入力された際の動作を登録する。[value]には入力された文字列が渡される。
  /// [onSend]はフォームの文字列が送信された際の動作を登録する。
  const OneLineTextField({
    super.key,
    required TextEditingController controller,
    String? label,
    String? hint,
    bool isLoading = false,
    bool isSendable = true,
    Function(String value)? onChanged,
    Function()? onSend,
  }): _controller = controller,
        _label = label,
        _hint = hint,
        _isLoading = isLoading,
        _isSendable = isSendable,
        _onChanged = onChanged,
        _onSend = onSend;

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
        suffixIcon: _buildSendButton(),
      ),
      onChanged: _onChanged,
    );
  }

  Widget _buildSendButton() {
    if(_isLoading) {
      return const CircularProgressIndicator();
    }

    return IconButton(
      onPressed: _isSendable ? _onSend : null,
      icon: const Icon(Icons.send),
    );
  }
}