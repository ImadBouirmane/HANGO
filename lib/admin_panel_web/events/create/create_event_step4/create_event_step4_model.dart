import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_event_step4_widget.dart' show CreateEventStep4Widget;
import 'package:flutter/material.dart';

class CreateEventStep4Model extends FlutterFlowModel<CreateEventStep4Widget> {
  ///  Local state fields for this page.

  List<ArtistStruct> artistInput = [];
  void addToArtistInput(ArtistStruct item) => artistInput.add(item);
  void removeFromArtistInput(ArtistStruct item) => artistInput.remove(item);
  void removeAtIndexFromArtistInput(int index) => artistInput.removeAt(index);
  void insertAtIndexInArtistInput(int index, ArtistStruct item) =>
      artistInput.insert(index, item);
  void updateArtistInputAtIndex(int index, Function(ArtistStruct) updateFn) =>
      artistInput[index] = updateFn(artistInput[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  MediaRecord? mediaEventUpload;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
