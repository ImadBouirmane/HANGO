import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manager_sign_up_widget.dart' show ManagerSignUpWidget;
import 'package:flutter/material.dart';

class ManagerSignUpModel extends FlutterFlowModel<ManagerSignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for estName widget.
  FocusNode? estNameFocusNode;
  TextEditingController? estNameController;
  String? Function(BuildContext, String?)? estNameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ManagerRecord? managerNew;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationsRecord? newNotif;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    estNameFocusNode?.dispose();
    estNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
