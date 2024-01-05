import '/components/back_navigation_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'show_of_establishment_widget.dart' show ShowOfEstablishmentWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ShowOfEstablishmentModel
    extends FlutterFlowModel<ShowOfEstablishmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Model for backNavigation component.
  late BackNavigationModel backNavigationModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Model for backNavigation component.
  late BackNavigationModel backNavigationModel2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    backNavigationModel1 = createModel(context, () => BackNavigationModel());
    backNavigationModel2 = createModel(context, () => BackNavigationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavWebModel.dispose();
    backNavigationModel1.dispose();
    expandableController1.dispose();
    backNavigationModel2.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
