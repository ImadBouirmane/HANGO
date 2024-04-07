import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_widget.dart' show FeedbackWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FeedbackModel extends FlutterFlowModel<FeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FeedbackRecord? newSuggestionMobile;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FeedbackRecord? newReportMobile;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FeedbackRecord? newSuggestionWeb;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FeedbackRecord? newReportWeb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    expandableController2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    expandableController3.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    expandableController4.dispose();
    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
