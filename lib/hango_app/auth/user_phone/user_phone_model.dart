import '/flutter_flow/flutter_flow_util.dart';
import 'user_phone_widget.dart' show UserPhoneWidget;
import 'package:flutter/material.dart';

class UserPhoneModel extends FlutterFlowModel<UserPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode1;
  TextEditingController? phoneController1;
  String? Function(BuildContext, String?)? phoneController1Validator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode2;
  TextEditingController? phoneController2;
  String? Function(BuildContext, String?)? phoneController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneFocusNode1?.dispose();
    phoneController1?.dispose();

    phoneFocusNode2?.dispose();
    phoneController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
