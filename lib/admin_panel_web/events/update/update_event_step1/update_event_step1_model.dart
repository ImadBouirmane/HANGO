import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'update_event_step1_widget.dart' show UpdateEventStep1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateEventStep1Model extends FlutterFlowModel<UpdateEventStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for TFTitle widget.
  TextEditingController? tFTitleController;
  String? Function(BuildContext, String?)? tFTitleControllerValidator;
  // State field(s) for TFDescriion widget.
  TextEditingController? tFDescriionController;
  String? Function(BuildContext, String?)? tFDescriionControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for TFURLWebSite widget.
  TextEditingController? tFURLWebSiteController;
  String? Function(BuildContext, String?)? tFURLWebSiteControllerValidator;
  // State field(s) for entrancePrice widget.
  TextEditingController? entrancePriceController;
  String? Function(BuildContext, String?)? entrancePriceControllerValidator;
  // State field(s) for typeEvent widget.
  List<String>? typeEventValues;
  FormFieldController<List<String>>? typeEventValueController;
  // State field(s) for CheckBoxMusicStyle widget.
  List<String>? checkBoxMusicStyleValues;
  FormFieldController<List<String>>? checkBoxMusicStyleValueController;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    tFTitleController?.dispose();
    tFDescriionController?.dispose();
    tFURLWebSiteController?.dispose();
    entrancePriceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
