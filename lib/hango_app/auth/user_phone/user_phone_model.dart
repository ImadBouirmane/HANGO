import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'user_phone_widget.dart' show UserPhoneWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserPhoneModel extends FlutterFlowModel<UserPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phone widget.
  TextEditingController? phoneController1;
  String? Function(BuildContext, String?)? phoneController1Validator;
  // State field(s) for phone widget.
  TextEditingController? phoneController2;
  String? Function(BuildContext, String?)? phoneController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    phoneController1?.dispose();
    phoneController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
