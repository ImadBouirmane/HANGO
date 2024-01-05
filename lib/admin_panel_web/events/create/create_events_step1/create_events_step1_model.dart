import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_events_step1_widget.dart' show CreateEventsStep1Widget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CreateEventsStep1Model extends FlutterFlowModel<CreateEventsStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for eventTitle widget.
  FocusNode? eventTitleFocusNode;
  TextEditingController? eventTitleController;
  String? Function(BuildContext, String?)? eventTitleControllerValidator;
  String? _eventTitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  EventsRecord? eventCreation;
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  ScheduleEventRecord? eventScheduleInput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
    eventTitleControllerValidator = _eventTitleControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    eventTitleFocusNode?.dispose();
    eventTitleController?.dispose();

    tFDescriionFocusNode?.dispose();
    tFDescriionController?.dispose();

    tFURLWebSiteFocusNode?.dispose();
    tFURLWebSiteController?.dispose();

    entrancePriceFocusNode?.dispose();
    entrancePriceController?.dispose();

    expandableController1.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
