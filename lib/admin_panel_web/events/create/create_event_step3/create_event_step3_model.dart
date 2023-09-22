import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEventStep3Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> artistInput = [];
  void addToArtistInput(String item) => artistInput.add(item);
  void removeFromArtistInput(String item) => artistInput.remove(item);
  void removeAtIndexFromArtistInput(int index) => artistInput.removeAt(index);
  void updateArtistInputAtIndex(int index, Function(String) updateFn) =>
      artistInput[index] = updateFn(artistInput[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for promorTitle widget.
  TextEditingController? promorTitleController;
  String? Function(BuildContext, String?)? promorTitleControllerValidator;
  // State field(s) for promorSousTitle widget.
  TextEditingController? promorSousTitleController;
  String? Function(BuildContext, String?)? promorSousTitleControllerValidator;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for nbrEntrance widget.
  TextEditingController? nbrEntranceController;
  String? Function(BuildContext, String?)? nbrEntranceControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  PromotionEventRecord? promotionEventCreation;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    promorTitleController?.dispose();
    promorSousTitleController?.dispose();
    descriptionController?.dispose();
    nbrEntranceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
