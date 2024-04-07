import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_event_step3_widget.dart' show CreateEventStep3Widget;
import 'package:flutter/material.dart';

class CreateEventStep3Model extends FlutterFlowModel<CreateEventStep3Widget> {
  ///  Local state fields for this page.

  List<String> artistInput = [];
  void addToArtistInput(String item) => artistInput.add(item);
  void removeFromArtistInput(String item) => artistInput.remove(item);
  void removeAtIndexFromArtistInput(int index) => artistInput.removeAt(index);
  void insertAtIndexInArtistInput(int index, String item) =>
      artistInput.insert(index, item);
  void updateArtistInputAtIndex(int index, Function(String) updateFn) =>
      artistInput[index] = updateFn(artistInput[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AdminSideBar component.
  late AdminSideBarModel adminSideBarModel;
  // State field(s) for promorTitle widget.
  FocusNode? promorTitleFocusNode;
  TextEditingController? promorTitleController;
  String? Function(BuildContext, String?)? promorTitleControllerValidator;
  // State field(s) for promorSousTitle widget.
  FocusNode? promorSousTitleFocusNode;
  TextEditingController? promorSousTitleController;
  String? Function(BuildContext, String?)? promorSousTitleControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for nbrEntrance widget.
  FocusNode? nbrEntranceFocusNode;
  TextEditingController? nbrEntranceController;
  String? Function(BuildContext, String?)? nbrEntranceControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in BTNValidateFrom widget.
  PromotionEventRecord? promotionEventCreation;

  @override
  void initState(BuildContext context) {
    adminSideBarModel = createModel(context, () => AdminSideBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminSideBarModel.dispose();
    promorTitleFocusNode?.dispose();
    promorTitleController?.dispose();

    promorSousTitleFocusNode?.dispose();
    promorSousTitleController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    nbrEntranceFocusNode?.dispose();
    nbrEntranceController?.dispose();
  }
}
