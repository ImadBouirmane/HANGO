import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/empty_image/empty_image_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CreateEventsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // Model for emptyImage component.
  late EmptyImageModel emptyImageModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for establishmentName widget.
  final establishmentNameKey = GlobalKey();
  TextEditingController? establishmentNameController;
  String? establishmentNameSelectedOption;
  String? Function(BuildContext, String?)? establishmentNameControllerValidator;
  List<EstablishmentsRecord> simpleSearchResults = [];
  // State field(s) for TFTitle widget.
  TextEditingController? tFTitleController;
  String? Function(BuildContext, String?)? tFTitleControllerValidator;
  // State field(s) for TFDescriion widget.
  TextEditingController? tFDescriionController;
  String? Function(BuildContext, String?)? tFDescriionControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for TFURLWebSite widget.
  TextEditingController? tFURLWebSiteController;
  String? Function(BuildContext, String?)? tFURLWebSiteControllerValidator;
  // State field(s) for CheckBoxMusicStyle widget.
  List<String>? checkBoxMusicStyleValues1;
  FormFieldController<List<String>>? checkBoxMusicStyleValueController1;
  // State field(s) for CheckBoxMusicStyle widget.
  List<String>? checkBoxMusicStyleValues2;
  FormFieldController<List<String>>? checkBoxMusicStyleValueController2;
  // State field(s) for eventPromo widget.
  TextEditingController? eventPromoController1;
  String? Function(BuildContext, String?)? eventPromoController1Validator;
  // State field(s) for eventPromo widget.
  TextEditingController? eventPromoController2;
  String? Function(BuildContext, String?)? eventPromoController2Validator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for artists widget.
  List<String>? artistsValues;
  FormFieldController<List<String>>? artistsValueController;
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  EventsRecord? eventCreation;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
    emptyImageModel = createModel(context, () => EmptyImageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarModel.dispose();
    emptyImageModel.dispose();
    tFTitleController?.dispose();
    tFDescriionController?.dispose();
    tFURLWebSiteController?.dispose();
    eventPromoController1?.dispose();
    eventPromoController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
