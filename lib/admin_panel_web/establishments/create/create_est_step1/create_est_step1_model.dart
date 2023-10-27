import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'create_est_step1_widget.dart' show CreateEstStep1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEstStep1Model extends FlutterFlowModel<CreateEstStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for TFName widget.
  FocusNode? tFNameFocusNode;
  TextEditingController? tFNameController;
  String? Function(BuildContext, String?)? tFNameControllerValidator;
  // State field(s) for TFDescription widget.
  FocusNode? tFDescriptionFocusNode;
  TextEditingController? tFDescriptionController;
  String? Function(BuildContext, String?)? tFDescriptionControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for TFStreet widget.
  FocusNode? tFStreetFocusNode;
  TextEditingController? tFStreetController;
  String? Function(BuildContext, String?)? tFStreetControllerValidator;
  // State field(s) for TFzip_code widget.
  FocusNode? tFzipCodeFocusNode;
  TextEditingController? tFzipCodeController;
  String? Function(BuildContext, String?)? tFzipCodeControllerValidator;
  // State field(s) for TFcity widget.
  FocusNode? tFcityFocusNode;
  TextEditingController? tFcityController;
  String? Function(BuildContext, String?)? tFcityControllerValidator;
  // State field(s) for TFstate widget.
  FocusNode? tFstateFocusNode;
  TextEditingController? tFstateController;
  String? Function(BuildContext, String?)? tFstateControllerValidator;
  // State field(s) for TFcountry widget.
  FocusNode? tFcountryFocusNode;
  TextEditingController? tFcountryController;
  String? Function(BuildContext, String?)? tFcountryControllerValidator;
  // State field(s) for TFemailAddress widget.
  FocusNode? tFemailAddressFocusNode;
  TextEditingController? tFemailAddressController;
  String? Function(BuildContext, String?)? tFemailAddressControllerValidator;
  // State field(s) for TFphoneNumber widget.
  FocusNode? tFphoneNumberFocusNode;
  TextEditingController? tFphoneNumberController;
  String? Function(BuildContext, String?)? tFphoneNumberControllerValidator;
  // State field(s) for TFURLWebSite widget.
  FocusNode? tFURLWebSiteFocusNode;
  TextEditingController? tFURLWebSiteController;
  String? Function(BuildContext, String?)? tFURLWebSiteControllerValidator;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for RBTNRservation widget.
  FormFieldController<String>? rBTNRservationValueController;
  // State field(s) for RBTNTerrasse widget.
  FormFieldController<String>? rBTNTerrasseValueController;
  // State field(s) for RBTNCigaretteMAchine widget.
  FormFieldController<String>? rBTNCigaretteMAchineValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for CheckBoxMusicStyle widget.
  List<String>? checkBoxMusicStyleValues;
  FormFieldController<List<String>>? checkBoxMusicStyleValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for CheckBoxFood widget.
  List<String>? checkBoxFoodValues;
  FormFieldController<List<String>>? checkBoxFoodValueController;
  // State field(s) for TFspeciality widget.
  FocusNode? tFspecialityFocusNode;
  TextEditingController? tFspecialityController;
  String? Function(BuildContext, String?)? tFspecialityControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for CheckBoxGames widget.
  List<String>? checkBoxGamesValues;
  FormFieldController<List<String>>? checkBoxGamesValueController;
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  EstablishmentsRecord? createEstablishment;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    tFNameFocusNode?.dispose();
    tFNameController?.dispose();

    tFDescriptionFocusNode?.dispose();
    tFDescriptionController?.dispose();

    tFStreetFocusNode?.dispose();
    tFStreetController?.dispose();

    tFzipCodeFocusNode?.dispose();
    tFzipCodeController?.dispose();

    tFcityFocusNode?.dispose();
    tFcityController?.dispose();

    tFstateFocusNode?.dispose();
    tFstateController?.dispose();

    tFcountryFocusNode?.dispose();
    tFcountryController?.dispose();

    tFemailAddressFocusNode?.dispose();
    tFemailAddressController?.dispose();

    tFphoneNumberFocusNode?.dispose();
    tFphoneNumberController?.dispose();

    tFURLWebSiteFocusNode?.dispose();
    tFURLWebSiteController?.dispose();

    expandableController1.dispose();
    expandableController2.dispose();
    tFspecialityFocusNode?.dispose();
    tFspecialityController?.dispose();

    expandableController3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get rBTNRservationValue => rBTNRservationValueController?.value;
  String? get rBTNTerrasseValue => rBTNTerrasseValueController?.value;
  String? get rBTNCigaretteMAchineValue =>
      rBTNCigaretteMAchineValueController?.value;
}
