import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_establishment_widget.dart' show FilterEstablishmentWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FilterEstablishmentModel
    extends FlutterFlowModel<FilterEstablishmentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for typeEstablishment widget.
  String? typeEstablishmentValue;
  FormFieldController<List<String>>? typeEstablishmentValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for musicType widget.
  String? musicTypeValue;
  FormFieldController<List<String>>? musicTypeValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue5;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue6;

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
