import '/backend/backend.dart';
import '/components/list_items/list_items_widget.dart';
import '/components/map_side/map_establishment_pop_up/map_establishment_pop_up_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'maps_widget.dart' show MapsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class MapsModel extends FlutterFlowModel<MapsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<EstablishmentsRecord> simpleSearchResults1 = [];
  // Models for listItems dynamic component.
  late FlutterFlowDynamicModels<ListItemsModel> listItemsModels1;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<EstablishmentsRecord> simpleSearchResults2 = [];
  // Models for listItems dynamic component.
  late FlutterFlowDynamicModels<ListItemsModel> listItemsModels2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    listItemsModels1 = FlutterFlowDynamicModels(() => ListItemsModel());
    listItemsModels2 = FlutterFlowDynamicModels(() => ListItemsModel());
  }

  void dispose() {
    sideNavWebModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    listItemsModels1.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    listItemsModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
