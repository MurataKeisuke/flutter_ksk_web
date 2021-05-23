import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';

/// Layout for the web
enum WebLayout {
  slim,
  wide,
  ultraWide,
}

/// Used by [WebLayoutBuilder.builder]
typedef WebLayoutWidgetBuilder = Widget Function(
  BuildContext context,
  WebLayout layout,
);

/// 論理画面のピクセル幅に依存するWidgetツリーを構築
class WebLayoutBuilder extends StatelessWidget {
  const WebLayoutBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  /// このWidgetのレイアウト幅を指定して、このWidgetの子Widgetを作成する
  final WebLayoutWidgetBuilder builder;

  Widget _build(BuildContext context, BoxConstraints constraints) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final layout = mediaWidth >= ultraWideLayoutThreshold
        ? WebLayout.ultraWide
        : mediaWidth > wideLayoutThreshold
            ? WebLayout.wide
            : WebLayout.slim;
    return builder(context, layout);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _build);
  }
}
