import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_events_widget.dart' show FilterEventsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FilterEventsModel extends FlutterFlowModel<FilterEventsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<List<String>>? typeValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for music widget.
  String? musicValue;
  FormFieldController<List<String>>? musicValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;

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
