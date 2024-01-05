import '/backend/api_requests/api_calls.dart';
import '/components/back_navigation_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'show_of_events_widget.dart' show ShowOfEventsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ShowOfEventsModel extends FlutterFlowModel<ShowOfEventsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // Model for backNavigation component.
  late BackNavigationModel backNavigationModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // Stores action output result for [Backend Call - API (Send Email)] action in Button widget.
  ApiCallResponse? sendingEmailPromotion;
  // State field(s) for Timer widget.
  int timerMilliseconds1 = 0;
  String timerValue1 = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  String currentPageLink = '';
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // Stores action output result for [Backend Call - API (Send Email)] action in Button widget.
  ApiCallResponse? sendingEmailPromotionWeb;
  // State field(s) for Timer widget.
  int timerMilliseconds2 = 0;
  String timerValue2 = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    backNavigationModel = createModel(context, () => BackNavigationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavWebModel.dispose();
    backNavigationModel.dispose();
    expandableController1.dispose();
    timerController1.dispose();
    expandableController2.dispose();
    timerController2.dispose();
    expandableController3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
