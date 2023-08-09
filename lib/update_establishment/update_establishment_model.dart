import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateEstablishmentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // State field(s) for TFName widget.
  TextEditingController? tFNameController;
  String? Function(BuildContext, String?)? tFNameControllerValidator;
  String? _tFNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for TFStreet widget.
  TextEditingController? tFStreetController;
  String? Function(BuildContext, String?)? tFStreetControllerValidator;
  String? _tFStreetControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFzip_code widget.
  TextEditingController? tFzipCodeController;
  String? Function(BuildContext, String?)? tFzipCodeControllerValidator;
  String? _tFzipCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFcity widget.
  TextEditingController? tFcityController;
  String? Function(BuildContext, String?)? tFcityControllerValidator;
  String? _tFcityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFstate widget.
  TextEditingController? tFstateController;
  String? Function(BuildContext, String?)? tFstateControllerValidator;
  String? _tFstateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFcountry widget.
  TextEditingController? tFcountryController;
  String? Function(BuildContext, String?)? tFcountryControllerValidator;
  String? _tFcountryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFlatLng widget.
  TextEditingController? tFlatLngController;
  String? Function(BuildContext, String?)? tFlatLngControllerValidator;
  String? _tFlatLngControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFemailAddress widget.
  TextEditingController? tFemailAddressController;
  String? Function(BuildContext, String?)? tFemailAddressControllerValidator;
  String? _tFemailAddressControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFphoneNumber widget.
  TextEditingController? tFphoneNumberController;
  String? Function(BuildContext, String?)? tFphoneNumberControllerValidator;
  String? _tFphoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFURLWebSite widget.
  TextEditingController? tFURLWebSiteController;
  String? Function(BuildContext, String?)? tFURLWebSiteControllerValidator;
  String? _tFURLWebSiteControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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
  String? _tFspecialityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for CheckBoxGames widget.
  List<String>? checkBoxGamesValues;
  FormFieldController<List<String>>? checkBoxGamesValueController;
  // State field(s) for TFMonday widget.
  TextEditingController? tFMondayController;
  String? Function(BuildContext, String?)? tFMondayControllerValidator;
  String? _tFMondayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFtuesday widget.
  TextEditingController? tFtuesdayController;
  String? Function(BuildContext, String?)? tFtuesdayControllerValidator;
  String? _tFtuesdayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFWednesday widget.
  TextEditingController? tFWednesdayController;
  String? Function(BuildContext, String?)? tFWednesdayControllerValidator;
  String? _tFWednesdayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFThursday widget.
  TextEditingController? tFThursdayController;
  String? Function(BuildContext, String?)? tFThursdayControllerValidator;
  String? _tFThursdayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFFriday widget.
  TextEditingController? tFFridayController;
  String? Function(BuildContext, String?)? tFFridayControllerValidator;
  String? _tFFridayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFSaturday widget.
  TextEditingController? tFSaturdayController;
  String? Function(BuildContext, String?)? tFSaturdayControllerValidator;
  String? _tFSaturdayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TFSunday widget.
  TextEditingController? tFSundayController;
  String? Function(BuildContext, String?)? tFSundayControllerValidator;
  String? _tFSundayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
    tFNameControllerValidator = _tFNameControllerValidator;
    tFStreetControllerValidator = _tFStreetControllerValidator;
    tFzipCodeControllerValidator = _tFzipCodeControllerValidator;
    tFcityControllerValidator = _tFcityControllerValidator;
    tFstateControllerValidator = _tFstateControllerValidator;
    tFcountryControllerValidator = _tFcountryControllerValidator;
    tFlatLngControllerValidator = _tFlatLngControllerValidator;
    tFemailAddressControllerValidator = _tFemailAddressControllerValidator;
    tFphoneNumberControllerValidator = _tFphoneNumberControllerValidator;
    tFURLWebSiteControllerValidator = _tFURLWebSiteControllerValidator;
    tFspecialityControllerValidator = _tFspecialityControllerValidator;
    tFMondayControllerValidator = _tFMondayControllerValidator;
    tFtuesdayControllerValidator = _tFtuesdayControllerValidator;
    tFWednesdayControllerValidator = _tFWednesdayControllerValidator;
    tFThursdayControllerValidator = _tFThursdayControllerValidator;
    tFFridayControllerValidator = _tFFridayControllerValidator;
    tFSaturdayControllerValidator = _tFSaturdayControllerValidator;
    tFSundayControllerValidator = _tFSundayControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarModel.dispose();
    tFNameController?.dispose();
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
    tFMondayController?.dispose();
    tFtuesdayController?.dispose();
    tFWednesdayController?.dispose();
    tFThursdayController?.dispose();
    tFFridayController?.dispose();
    tFSaturdayController?.dispose();
    tFSundayController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get rBTNRservationValue => rBTNRservationValueController?.value;
  String? get rBTNTerrasseValue => rBTNTerrasseValueController?.value;
  String? get rBTNCigaretteMAchineValue =>
      rBTNCigaretteMAchineValueController?.value;
}
