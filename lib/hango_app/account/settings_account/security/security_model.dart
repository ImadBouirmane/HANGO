import '/flutter_flow/flutter_flow_util.dart';
import 'security_widget.dart' show SecurityWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SecurityModel extends FlutterFlowModel<SecurityWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailOnMobile widget.
  FocusNode? emailOnMobileFocusNode;
  TextEditingController? emailOnMobileController;
  String? Function(BuildContext, String?)? emailOnMobileControllerValidator;
  // State field(s) for phoneOnMobile widget.
  FocusNode? phoneOnMobileFocusNode;
  TextEditingController? phoneOnMobileController;
  final phoneOnMobileMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneOnMobileControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  final textFieldMask2 = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailOnMobileFocusNode?.dispose();
    emailOnMobileController?.dispose();

    phoneOnMobileFocusNode?.dispose();
    phoneOnMobileController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
