import '/flutter_flow/flutter_flow_util.dart';
import 'drawer_loged_widget.dart' show DrawerLogedWidget;
import 'package:flutter/material.dart';

class DrawerLogedModel extends FlutterFlowModel<DrawerLogedWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
