import '/flutter_flow/flutter_flow_util.dart';
import 'manager_wait_list_widget.dart' show ManagerWaitListWidget;
import 'package:flutter/material.dart';

class ManagerWaitListModel extends FlutterFlowModel<ManagerWaitListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
