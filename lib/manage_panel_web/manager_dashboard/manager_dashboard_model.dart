import '/components/manager_side_bar/manager_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manager_dashboard_widget.dart' show ManagerDashboardWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ManagerDashboardModel extends FlutterFlowModel<ManagerDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ManagerSideBar component.
  late ManagerSideBarModel managerSideBarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    managerSideBarModel = createModel(context, () => ManagerSideBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    managerSideBarModel.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
