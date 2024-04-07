import '/flutter_flow/flutter_flow_util.dart';
import 'web_view_establishment_widget.dart' show WebViewEstablishmentWidget;
import 'package:flutter/material.dart';

class WebViewEstablishmentModel
    extends FlutterFlowModel<WebViewEstablishmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
