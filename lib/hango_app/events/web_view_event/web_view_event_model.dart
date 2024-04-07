import '/flutter_flow/flutter_flow_util.dart';
import 'web_view_event_widget.dart' show WebViewEventWidget;
import 'package:flutter/material.dart';

class WebViewEventModel extends FlutterFlowModel<WebViewEventWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
