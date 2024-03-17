import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_options_list_est_widget.dart' show FilterOptionsListEstWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FilterOptionsListEstModel
    extends FlutterFlowModel<FilterOptionsListEstWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for typeEstablishmentChoices widget.
  FormFieldController<List<String>>? typeEstablishmentChoicesValueController;
  String? get typeEstablishmentChoicesValue =>
      typeEstablishmentChoicesValueController?.value?.firstOrNull;
  set typeEstablishmentChoicesValue(String? val) =>
      typeEstablishmentChoicesValueController?.value = val != null ? [val] : [];
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for musicStyleEstablishmentChoices widget.
  FormFieldController<List<String>>?
      musicStyleEstablishmentChoicesValueController;
  String? get musicStyleEstablishmentChoicesValue =>
      musicStyleEstablishmentChoicesValueController?.value?.firstOrNull;
  set musicStyleEstablishmentChoicesValue(String? val) =>
      musicStyleEstablishmentChoicesValueController?.value =
          val != null ? [val] : [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableController1.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
