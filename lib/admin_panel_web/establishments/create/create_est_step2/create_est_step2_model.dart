import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_est_step2_widget.dart' show CreateEstStep2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEstStep2Model extends FlutterFlowModel<CreateEstStep2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for mondayOpening widget.
  FocusNode? mondayOpeningFocusNode;
  TextEditingController? mondayOpeningController;
  String? Function(BuildContext, String?)? mondayOpeningControllerValidator;
  // State field(s) for mondayClosing widget.
  FocusNode? mondayClosingFocusNode;
  TextEditingController? mondayClosingController;
  String? Function(BuildContext, String?)? mondayClosingControllerValidator;
  // State field(s) for monday widget.
  bool? mondayValue;
  // State field(s) for thursdayOpening widget.
  FocusNode? thursdayOpeningFocusNode;
  TextEditingController? thursdayOpeningController;
  String? Function(BuildContext, String?)? thursdayOpeningControllerValidator;
  // State field(s) for thursdayClosing widget.
  FocusNode? thursdayClosingFocusNode;
  TextEditingController? thursdayClosingController;
  String? Function(BuildContext, String?)? thursdayClosingControllerValidator;
  // State field(s) for tuesday widget.
  bool? tuesdayValue;
  // State field(s) for wednesdayOpening widget.
  FocusNode? wednesdayOpeningFocusNode;
  TextEditingController? wednesdayOpeningController;
  String? Function(BuildContext, String?)? wednesdayOpeningControllerValidator;
  // State field(s) for wednesdayClosing widget.
  FocusNode? wednesdayClosingFocusNode;
  TextEditingController? wednesdayClosingController;
  String? Function(BuildContext, String?)? wednesdayClosingControllerValidator;
  // State field(s) for wednesday widget.
  bool? wednesdayValue;
  // State field(s) for tuesdayOpening widget.
  FocusNode? tuesdayOpeningFocusNode;
  TextEditingController? tuesdayOpeningController;
  String? Function(BuildContext, String?)? tuesdayOpeningControllerValidator;
  // State field(s) for tuesdayClosing widget.
  FocusNode? tuesdayClosingFocusNode;
  TextEditingController? tuesdayClosingController;
  String? Function(BuildContext, String?)? tuesdayClosingControllerValidator;
  // State field(s) for thursday widget.
  bool? thursdayValue;
  // State field(s) for fridayOpening widget.
  FocusNode? fridayOpeningFocusNode;
  TextEditingController? fridayOpeningController;
  String? Function(BuildContext, String?)? fridayOpeningControllerValidator;
  // State field(s) for fridayClosing widget.
  FocusNode? fridayClosingFocusNode;
  TextEditingController? fridayClosingController;
  String? Function(BuildContext, String?)? fridayClosingControllerValidator;
  // State field(s) for friday widget.
  bool? fridayValue;
  // State field(s) for saturdayOpening widget.
  FocusNode? saturdayOpeningFocusNode;
  TextEditingController? saturdayOpeningController;
  String? Function(BuildContext, String?)? saturdayOpeningControllerValidator;
  // State field(s) for saturdayClosing widget.
  FocusNode? saturdayClosingFocusNode;
  TextEditingController? saturdayClosingController;
  String? Function(BuildContext, String?)? saturdayClosingControllerValidator;
  // State field(s) for saturday widget.
  bool? saturdayValue;
  // State field(s) for sundayOpening widget.
  FocusNode? sundayOpeningFocusNode;
  TextEditingController? sundayOpeningController;
  String? Function(BuildContext, String?)? sundayOpeningControllerValidator;
  // State field(s) for sundayClosing widget.
  FocusNode? sundayClosingFocusNode;
  TextEditingController? sundayClosingController;
  String? Function(BuildContext, String?)? sundayClosingControllerValidator;
  // State field(s) for sunday widget.
  bool? sundayValue;
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  ScheduleRecord? estScheduleInput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    mondayOpeningFocusNode?.dispose();
    mondayOpeningController?.dispose();

    mondayClosingFocusNode?.dispose();
    mondayClosingController?.dispose();

    thursdayOpeningFocusNode?.dispose();
    thursdayOpeningController?.dispose();

    thursdayClosingFocusNode?.dispose();
    thursdayClosingController?.dispose();

    wednesdayOpeningFocusNode?.dispose();
    wednesdayOpeningController?.dispose();

    wednesdayClosingFocusNode?.dispose();
    wednesdayClosingController?.dispose();

    tuesdayOpeningFocusNode?.dispose();
    tuesdayOpeningController?.dispose();

    tuesdayClosingFocusNode?.dispose();
    tuesdayClosingController?.dispose();

    fridayOpeningFocusNode?.dispose();
    fridayOpeningController?.dispose();

    fridayClosingFocusNode?.dispose();
    fridayClosingController?.dispose();

    saturdayOpeningFocusNode?.dispose();
    saturdayOpeningController?.dispose();

    saturdayClosingFocusNode?.dispose();
    saturdayClosingController?.dispose();

    sundayOpeningFocusNode?.dispose();
    sundayOpeningController?.dispose();

    sundayClosingFocusNode?.dispose();
    sundayClosingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
