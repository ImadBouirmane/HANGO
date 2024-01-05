import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_artist_event_widget.dart' show FormArtistEventWidget;
import 'package:flutter/material.dart';

class FormArtistEventModel extends FlutterFlowModel<FormArtistEventWidget> {
  ///  Local state fields for this component.

  List<ArtistStruct> artistsListInput = [];
  void addToArtistsListInput(ArtistStruct item) => artistsListInput.add(item);
  void removeFromArtistsListInput(ArtistStruct item) =>
      artistsListInput.remove(item);
  void removeAtIndexFromArtistsListInput(int index) =>
      artistsListInput.removeAt(index);
  void insertAtIndexInArtistsListInput(int index, ArtistStruct item) =>
      artistsListInput.insert(index, item);
  void updateArtistsListInputAtIndex(
          int index, Function(ArtistStruct) updateFn) =>
      artistsListInput[index] = updateFn(artistsListInput[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for ArtistNameTextField widget.
  FocusNode? artistNameTextFieldFocusNode;
  TextEditingController? artistNameTextFieldController;
  String? Function(BuildContext, String?)?
      artistNameTextFieldControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in DeleteBTN widget.
  ArtistsRecord? artistInput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    artistNameTextFieldFocusNode?.dispose();
    artistNameTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
