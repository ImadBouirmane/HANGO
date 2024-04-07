import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_event_step3_widget.dart' show UpdateEventStep3Widget;
import 'package:flutter/material.dart';

class UpdateEventStep3Model extends FlutterFlowModel<UpdateEventStep3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for promorTitle widget.
  FocusNode? promorTitleFocusNode;
  TextEditingController? promorTitleController;
  String? Function(BuildContext, String?)? promorTitleControllerValidator;
  // State field(s) for promorSousTitle widget.
  FocusNode? promorSousTitleFocusNode;
  TextEditingController? promorSousTitleController;
  String? Function(BuildContext, String?)? promorSousTitleControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for nbrEntrance widget.
  FocusNode? nbrEntranceFocusNode;
  TextEditingController? nbrEntranceController;
  String? Function(BuildContext, String?)? nbrEntranceControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    promorTitleFocusNode?.dispose();
    promorTitleController?.dispose();

    promorSousTitleFocusNode?.dispose();
    promorSousTitleController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    nbrEntranceFocusNode?.dispose();
    nbrEntranceController?.dispose();
  }
}
