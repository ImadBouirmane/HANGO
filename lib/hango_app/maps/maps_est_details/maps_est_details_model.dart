import '/components/back_navigation_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'maps_est_details_widget.dart' show MapsEstDetailsWidget;
import 'package:flutter/material.dart';

class MapsEstDetailsModel extends FlutterFlowModel<MapsEstDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // Model for backNavigation component.
  late BackNavigationModel backNavigationModel1;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // Model for backNavigation component.
  late BackNavigationModel backNavigationModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    backNavigationModel1 = createModel(context, () => BackNavigationModel());
    backNavigationModel2 = createModel(context, () => BackNavigationModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    backNavigationModel1.dispose();
    backNavigationModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
