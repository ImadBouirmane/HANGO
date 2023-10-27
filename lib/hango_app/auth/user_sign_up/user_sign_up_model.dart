import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_sign_up_widget.dart' show UserSignUpWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserSignUpModel extends FlutterFlowModel<UserSignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode1;
  TextEditingController? lastNameController1;
  String? Function(BuildContext, String?)? lastNameController1Validator;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode1;
  TextEditingController? firstNameController1;
  String? Function(BuildContext, String?)? firstNameController1Validator;
  // State field(s) for genre widget.
  String? genreValue1;
  FormFieldController<String>? genreValueController1;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordController1Validator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode1;
  TextEditingController? confirmPasswordController1;
  late bool confirmPasswordVisibility1;
  String? Function(BuildContext, String?)? confirmPasswordController1Validator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode2;
  TextEditingController? lastNameController2;
  String? Function(BuildContext, String?)? lastNameController2Validator;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode2;
  TextEditingController? firstNameController2;
  String? Function(BuildContext, String?)? firstNameController2Validator;
  // State field(s) for genre widget.
  String? genreValue2;
  FormFieldController<String>? genreValueController2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordController2Validator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode2;
  TextEditingController? confirmPasswordController2;
  late bool confirmPasswordVisibility2;
  String? Function(BuildContext, String?)? confirmPasswordController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    confirmPasswordVisibility1 = false;
    passwordVisibility2 = false;
    confirmPasswordVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    lastNameFocusNode1?.dispose();
    lastNameController1?.dispose();

    firstNameFocusNode1?.dispose();
    firstNameController1?.dispose();

    emailAddressFocusNode1?.dispose();
    emailAddressController1?.dispose();

    passwordFocusNode1?.dispose();
    passwordController1?.dispose();

    confirmPasswordFocusNode1?.dispose();
    confirmPasswordController1?.dispose();

    lastNameFocusNode2?.dispose();
    lastNameController2?.dispose();

    firstNameFocusNode2?.dispose();
    firstNameController2?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressController2?.dispose();

    passwordFocusNode2?.dispose();
    passwordController2?.dispose();

    confirmPasswordFocusNode2?.dispose();
    confirmPasswordController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
