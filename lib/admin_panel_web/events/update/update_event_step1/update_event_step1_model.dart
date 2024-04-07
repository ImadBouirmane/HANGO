import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_event_step1_widget.dart' show UpdateEventStep1Widget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class UpdateEventStep1Model extends FlutterFlowModel<UpdateEventStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for TFTitle widget.
  FocusNode? tFTitleFocusNode;
  TextEditingController? tFTitleController;
  String? Function(BuildContext, String?)? tFTitleControllerValidator;
  // State field(s) for TFDescriion widget.
  FocusNode? tFDescriionFocusNode;
  TextEditingController? tFDescriionController;
  String? Function(BuildContext, String?)? tFDescriionControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for TFURLWebSite widget.
  FocusNode? tFURLWebSiteFocusNode;
  TextEditingController? tFURLWebSiteController;
  String? Function(BuildContext, String?)? tFURLWebSiteControllerValidator;
  // State field(s) for entrancePrice widget.
  FocusNode? entrancePriceFocusNode;
  TextEditingController? entrancePriceController;
  String? Function(BuildContext, String?)? entrancePriceControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for typeEvent widget.
  List<String>? typeEventValues;
  FormFieldController<List<String>>? typeEventValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for CheckBoxMusicStyle widget.
  List<String>? checkBoxMusicStyleValues;
  FormFieldController<List<String>>? checkBoxMusicStyleValueController;

  @override
  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    tFTitleFocusNode?.dispose();
    tFTitleController?.dispose();

    tFDescriionFocusNode?.dispose();
    tFDescriionController?.dispose();

    tFURLWebSiteFocusNode?.dispose();
    tFURLWebSiteController?.dispose();

    entrancePriceFocusNode?.dispose();
    entrancePriceController?.dispose();

    expandableController1.dispose();
    expandableController2.dispose();
  }
}
