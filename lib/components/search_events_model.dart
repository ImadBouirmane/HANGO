import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_events_widget.dart' show SearchEventsWidget;
import 'package:flutter/material.dart';

class SearchEventsModel extends FlutterFlowModel<SearchEventsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for eventsSearchMobile widget.
  FocusNode? eventsSearchMobileFocusNode;
  TextEditingController? eventsSearchMobileController;
  String? Function(BuildContext, String?)?
      eventsSearchMobileControllerValidator;
  // Algolia Search Results from action on eventsSearchMobile
  List<EventsRecord>? algoliaSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    eventsSearchMobileFocusNode?.dispose();
    eventsSearchMobileController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
