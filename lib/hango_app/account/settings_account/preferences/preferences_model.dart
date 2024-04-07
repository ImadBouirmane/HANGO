import '/flutter_flow/flutter_flow_util.dart';
import 'preferences_widget.dart' show PreferencesWidget;
import 'package:flutter/material.dart';

class PreferencesModel extends FlutterFlowModel<PreferencesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
