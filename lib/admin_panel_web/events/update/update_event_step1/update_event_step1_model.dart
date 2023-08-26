import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateEventStep1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // State field(s) for TFName widget.
  TextEditingController? tFNameController;
  String? Function(BuildContext, String?)? tFNameControllerValidator;
  // State field(s) for TFTitle widget.
  TextEditingController? tFTitleController;
  String? Function(BuildContext, String?)? tFTitleControllerValidator;
  // State field(s) for TFDescriion widget.
  TextEditingController? tFDescriionController;
  String? Function(BuildContext, String?)? tFDescriionControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TFURLWebSite widget.
  TextEditingController? tFURLWebSiteController;
  String? Function(BuildContext, String?)? tFURLWebSiteControllerValidator;
  // State field(s) for CheckBoxMusicStyle widget.
  List<String>? checkBoxMusicStyleValues;
  FormFieldController<List<String>>? checkBoxMusicStyleValueController;
  // State field(s) for eventPromo widget.
  TextEditingController? eventPromoController;
  String? Function(BuildContext, String?)? eventPromoControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for artists widget.
  List<String>? artistsValues;
  FormFieldController<List<String>>? artistsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarModel.dispose();
    tFNameController?.dispose();
    tFTitleController?.dispose();
    tFDescriionController?.dispose();
    tFURLWebSiteController?.dispose();
    eventPromoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
