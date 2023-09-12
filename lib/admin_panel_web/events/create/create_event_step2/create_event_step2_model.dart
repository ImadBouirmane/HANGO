import '/backend/backend.dart';
import '/components/artist_input/form_artist_event/form_artist_event_widget.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEventStep2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> artistInput = [];
  void addToArtistInput(String item) => artistInput.add(item);
  void removeFromArtistInput(String item) => artistInput.remove(item);
  void removeAtIndexFromArtistInput(int index) => artistInput.removeAt(index);
  void updateArtistInputAtIndex(int index, Function(String) updateFn) =>
      artistInput[index] = updateFn(artistInput[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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
