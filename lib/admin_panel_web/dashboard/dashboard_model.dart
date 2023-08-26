import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirmation/confirmation_establishement/confirmation_establishement_widget.dart';
import '/components/confirmation/confirmation_event/confirmation_event_widget.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideBar component.
  late SideBarModel sideBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
