import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/components/artist_input/form_artist_event/form_artist_event_widget.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateEventStep2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
