import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserSignUpModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for lastName widget.
  TextEditingController? lastNameController1;
  String? Function(BuildContext, String?)? lastNameController1Validator;
  // State field(s) for firstName widget.
  TextEditingController? firstNameController1;
  String? Function(BuildContext, String?)? firstNameController1Validator;
  // State field(s) for genre widget.
  String? genreValue1;
  FormFieldController<String>? genreValueController1;
  DateTime? datePicked1;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for password widget.
  TextEditingController? passwordController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordController1Validator;
  // State field(s) for confirmPassword widget.
  TextEditingController? confirmPasswordController1;
  late bool confirmPasswordVisibility1;
  String? Function(BuildContext, String?)? confirmPasswordController1Validator;
  // State field(s) for lastName widget.
  TextEditingController? lastNameController2;
  String? Function(BuildContext, String?)? lastNameController2Validator;
  // State field(s) for firstName widget.
  TextEditingController? firstNameController2;
  String? Function(BuildContext, String?)? firstNameController2Validator;
  // State field(s) for genre widget.
  String? genreValue2;
  FormFieldController<String>? genreValueController2;
  DateTime? datePicked2;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for password widget.
  TextEditingController? passwordController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordController2Validator;
  // State field(s) for confirmPassword widget.
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
    lastNameController1?.dispose();
    firstNameController1?.dispose();
    emailAddressController1?.dispose();
    passwordController1?.dispose();
    confirmPasswordController1?.dispose();
    lastNameController2?.dispose();
    firstNameController2?.dispose();
    emailAddressController2?.dispose();
    passwordController2?.dispose();
    confirmPasswordController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
