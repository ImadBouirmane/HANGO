import '/backend/backend.dart';
import '/components/list_items/list_items_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class MapsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<EstablishmentsRecord> simpleSearchResults = [];
  // Models for listItems dynamic component.
  late FlutterFlowDynamicModels<ListItemsModel> listItemsModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listItemsModels = FlutterFlowDynamicModels(() => ListItemsModel());
  }

  void dispose() {
    textController?.dispose();
    listItemsModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
