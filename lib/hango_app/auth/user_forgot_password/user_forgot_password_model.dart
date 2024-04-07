import '/flutter_flow/flutter_flow_util.dart';
import 'user_forgot_password_widget.dart' show UserForgotPasswordWidget;
import 'package:flutter/material.dart';

class UserForgotPasswordModel
    extends FlutterFlowModel<UserForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }
}
