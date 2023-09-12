import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for lastName widget.
  TextEditingController? lastNameController1;
  String? Function(BuildContext, String?)? lastNameController1Validator;
  // State field(s) for firstName widget.
  TextEditingController? firstNameController1;
  String? Function(BuildContext, String?)? firstNameController1Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for phone widget.
  TextEditingController? phoneController1;
  String? Function(BuildContext, String?)? phoneController1Validator;
  // State field(s) for genre widget.
  String? genreValue1;
  FormFieldController<String>? genreValueController1;
  DateTime? datePicked1;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for lastName widget.
  TextEditingController? lastNameController2;
  String? Function(BuildContext, String?)? lastNameController2Validator;
  // State field(s) for firstName widget.
  TextEditingController? firstNameController2;
  String? Function(BuildContext, String?)? firstNameController2Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for phone widget.
  TextEditingController? phoneController2;
  String? Function(BuildContext, String?)? phoneController2Validator;
  // State field(s) for genre widget.
  String? genreValue2;
  FormFieldController<String>? genreValueController2;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavWebModel.dispose();
    lastNameController1?.dispose();
    firstNameController1?.dispose();
    emailAddressController1?.dispose();
    phoneController1?.dispose();
    lastNameController2?.dispose();
    firstNameController2?.dispose();
    emailAddressController2?.dispose();
    phoneController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
