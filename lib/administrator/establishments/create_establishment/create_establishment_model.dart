import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/images_delete_problem_admin_pop_up_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEstablishmentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TFName widget.
  TextEditingController? tFNameController;
  String? Function(BuildContext, String?)? tFNameControllerValidator;
  // State field(s) for TFDescription widget.
  TextEditingController? tFDescriptionController;
  String? Function(BuildContext, String?)? tFDescriptionControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for TFStreet widget.
  TextEditingController? tFStreetController;
  String? Function(BuildContext, String?)? tFStreetControllerValidator;
  // State field(s) for TFzip_code widget.
  TextEditingController? tFzipCodeController;
  String? Function(BuildContext, String?)? tFzipCodeControllerValidator;
  // State field(s) for TFcity widget.
  TextEditingController? tFcityController;
  String? Function(BuildContext, String?)? tFcityControllerValidator;
  // State field(s) for TFstate widget.
  TextEditingController? tFstateController;
  String? Function(BuildContext, String?)? tFstateControllerValidator;
  // State field(s) for TFcountry widget.
  TextEditingController? tFcountryController;
  String? Function(BuildContext, String?)? tFcountryControllerValidator;
  // State field(s) for TFlatLng widget.
  TextEditingController? tFlatLngController;
  String? Function(BuildContext, String?)? tFlatLngControllerValidator;
  // State field(s) for TFemailAddress widget.
  TextEditingController? tFemailAddressController;
  String? Function(BuildContext, String?)? tFemailAddressControllerValidator;
  // State field(s) for TFphoneNumber widget.
  TextEditingController? tFphoneNumberController;
  String? Function(BuildContext, String?)? tFphoneNumberControllerValidator;
  // State field(s) for TFURLWebSite widget.
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
  // State field(s) for CheckBoxMusicStyle widget.
  List<String>? checkBoxMusicStyleValues;
  FormFieldController<List<String>>? checkBoxMusicStyleValueController;
  // State field(s) for CheckBoxFood widget.
  List<String>? checkBoxFoodValues;
  FormFieldController<List<String>>? checkBoxFoodValueController;
  // State field(s) for TFspeciality widget.
  TextEditingController? tFspecialityController;
  String? Function(BuildContext, String?)? tFspecialityControllerValidator;
  // State field(s) for CheckBoxGames widget.
  List<String>? checkBoxGamesValues;
  FormFieldController<List<String>>? checkBoxGamesValueController;
  // State field(s) for mondayOpening widget.
  TextEditingController? mondayOpeningController;
  String? Function(BuildContext, String?)? mondayOpeningControllerValidator;
  // State field(s) for mondayClosing widget.
  TextEditingController? mondayClosingController;
  String? Function(BuildContext, String?)? mondayClosingControllerValidator;
  // State field(s) for monday widget.
  bool? mondayValue;
  // State field(s) for thursdayOpening widget.
  TextEditingController? thursdayOpeningController;
  String? Function(BuildContext, String?)? thursdayOpeningControllerValidator;
  // State field(s) for thursdayClosing widget.
  TextEditingController? thursdayClosingController;
  String? Function(BuildContext, String?)? thursdayClosingControllerValidator;
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
  // State field(s) for tuesdayOpening widget.
  TextEditingController? tuesdayOpeningController;
  String? Function(BuildContext, String?)? tuesdayOpeningControllerValidator;
  // State field(s) for tuesdayClosing widget.
  TextEditingController? tuesdayClosingController;
  String? Function(BuildContext, String?)? tuesdayClosingControllerValidator;
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
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  EstablishmentsRecord? createEstablishment;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarModel.dispose();
    tFNameController?.dispose();
    tFDescriptionController?.dispose();
    tFStreetController?.dispose();
    tFzipCodeController?.dispose();
    tFcityController?.dispose();
    tFstateController?.dispose();
    tFcountryController?.dispose();
    tFlatLngController?.dispose();
    tFemailAddressController?.dispose();
    tFphoneNumberController?.dispose();
    tFURLWebSiteController?.dispose();
    tFspecialityController?.dispose();
    mondayOpeningController?.dispose();
    mondayClosingController?.dispose();
    thursdayOpeningController?.dispose();
    thursdayClosingController?.dispose();
    wednesdayOpeningController?.dispose();
    wednesdayClosingController?.dispose();
    tuesdayOpeningController?.dispose();
    tuesdayClosingController?.dispose();
    fridayOpeningController?.dispose();
    fridayClosingController?.dispose();
    saturdayOpeningController?.dispose();
    saturdayClosingController?.dispose();
    sundayOpeningController?.dispose();
    sundayClosingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get rBTNRservationValue => rBTNRservationValueController?.value;
  String? get rBTNTerrasseValue => rBTNTerrasseValueController?.value;
  String? get rBTNCigaretteMAchineValue =>
      rBTNCigaretteMAchineValueController?.value;
}
