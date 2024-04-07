import '/flutter_flow/flutter_flow_util.dart';
import 'search_filter_widget.dart' show SearchFilterWidget;
import 'package:flutter/material.dart';

class SearchFilterModel extends FlutterFlowModel<SearchFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for estblishmentSearchMobile widget.
  FocusNode? estblishmentSearchMobileFocusNode;
  TextEditingController? estblishmentSearchMobileController;
  String? Function(BuildContext, String?)?
      estblishmentSearchMobileControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    estblishmentSearchMobileFocusNode?.dispose();
    estblishmentSearchMobileController?.dispose();
  }
}
