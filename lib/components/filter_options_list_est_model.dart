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
  String? typeEstablishmentChoicesValue;
  FormFieldController<List<String>>? typeEstablishmentChoicesValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for musicStyleEstablishmentChoices widget.
  String? musicStyleEstablishmentChoicesValue;
  FormFieldController<List<String>>?
      musicStyleEstablishmentChoicesValueController;

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
