import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateEstStep2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // State field(s) for mondayOpening widget.
  TextEditingController? mondayOpeningController;
  String? Function(BuildContext, String?)? mondayOpeningControllerValidator;
  // State field(s) for mondayClosing widget.
  TextEditingController? mondayClosingController;
  String? Function(BuildContext, String?)? mondayClosingControllerValidator;
  // State field(s) for monday widget.
  bool? mondayValue;
  // State field(s) for tuesdayOpening widget.
  TextEditingController? tuesdayOpeningController;
  String? Function(BuildContext, String?)? tuesdayOpeningControllerValidator;
  // State field(s) for tuesdayClosing widget.
  TextEditingController? tuesdayClosingController;
  String? Function(BuildContext, String?)? tuesdayClosingControllerValidator;
  // State field(s) for tuesday widget.
  bool? tuesdayValue;
  // State field(s) for wednesdayOpening widget.
  TextEditingController? wednesdayOpeningController;
  String? Function(BuildContext, String?)? wednesdayOpeningControllerValidator;
  // State field(s) for wednesdayClosing widget.
  TextEditingController? wednesdayClosingController;
  String? Function(BuildContext, String?)? wednesdayClosingControllerValidator;
  // State field(s) for wednesday widget.
  bool? wednesdayValue;
  // State field(s) for thursdayOpening widget.
  TextEditingController? thursdayOpeningController;
  String? Function(BuildContext, String?)? thursdayOpeningControllerValidator;
  // State field(s) for thursdayClosing widget.
  TextEditingController? thursdayClosingController;
  String? Function(BuildContext, String?)? thursdayClosingControllerValidator;
  // State field(s) for thursday widget.
  bool? thursdayValue;
  // State field(s) for fridayOpening widget.
  TextEditingController? fridayOpeningController;
  String? Function(BuildContext, String?)? fridayOpeningControllerValidator;
  // State field(s) for fridayClosing widget.
  TextEditingController? fridayClosingController;
  String? Function(BuildContext, String?)? fridayClosingControllerValidator;
  // State field(s) for friday widget.
  bool? fridayValue;
  // State field(s) for saturdayOpening widget.
  TextEditingController? saturdayOpeningController;
  String? Function(BuildContext, String?)? saturdayOpeningControllerValidator;
  // State field(s) for saturdayClosing widget.
  TextEditingController? saturdayClosingController;
  String? Function(BuildContext, String?)? saturdayClosingControllerValidator;
  // State field(s) for saturday widget.
  bool? saturdayValue;
  // State field(s) for sundayOpening widget.
  TextEditingController? sundayOpeningController;
  String? Function(BuildContext, String?)? sundayOpeningControllerValidator;
  // State field(s) for sundayClosing widget.
  TextEditingController? sundayClosingController;
  String? Function(BuildContext, String?)? sundayClosingControllerValidator;
  // State field(s) for sunday widget.
  bool? sundayValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarModel.dispose();
    mondayOpeningController?.dispose();
    mondayClosingController?.dispose();
    tuesdayOpeningController?.dispose();
    tuesdayClosingController?.dispose();
    wednesdayOpeningController?.dispose();
    wednesdayClosingController?.dispose();
    thursdayOpeningController?.dispose();
    thursdayClosingController?.dispose();
    fridayOpeningController?.dispose();
    fridayClosingController?.dispose();
    saturdayOpeningController?.dispose();
    saturdayClosingController?.dispose();
    sundayOpeningController?.dispose();
    sundayClosingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
