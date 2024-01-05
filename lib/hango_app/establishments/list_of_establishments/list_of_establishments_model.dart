import '/backend/backend.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_establishments_widget.dart' show ListOfEstablishmentsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListOfEstablishmentsModel
    extends FlutterFlowModel<ListOfEstablishmentsWidget> {
  ///  Local state fields for this page.

  bool filterOnEstMobile = false;

  bool filterOffEstMobile = true;

  bool typeFilterMobile = false;

  bool musicFilterMobile = false;

  bool filterOnEstWeb = false;

  bool filterOffEstWeb = true;

  bool typeFilterWeb = false;

  bool musicFilterWeb = false;

  bool isSearchMobile = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // State field(s) for estblishmentSearchMobile widget.
  FocusNode? estblishmentSearchMobileFocusNode;
  TextEditingController? estblishmentSearchMobileController;
  String? Function(BuildContext, String?)?
      estblishmentSearchMobileControllerValidator;
  // Algolia Search Results from action on estblishmentSearchMobile
  List<EstablishmentsRecord>? algoliaSearchResults = [];
  // State field(s) for ListEstablishmentsQueryWeb widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstablishmentsQueryWebPagingController;
  Query? listEstablishmentsQueryWebPagingQuery;
  List<StreamSubscription?> listEstablishmentsQueryWebStreamSubscriptions = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavWebModel.dispose();
    estblishmentSearchMobileFocusNode?.dispose();
    estblishmentSearchMobileController?.dispose();

    for (var s in listEstablishmentsQueryWebStreamSubscriptions) {
      s?.cancel();
    }
    listEstablishmentsQueryWebPagingController?.dispose();
  }

  /// Action blocks are added here.

  Future estListState(BuildContext context) async {}

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      setListEstablishmentsQueryWebController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEstablishmentsQueryWebPagingController ??=
        _createListEstablishmentsQueryWebController(query, parent);
    if (listEstablishmentsQueryWebPagingQuery != query) {
      listEstablishmentsQueryWebPagingQuery = query;
      listEstablishmentsQueryWebPagingController?.refresh();
    }
    return listEstablishmentsQueryWebPagingController!;
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      _createListEstablishmentsQueryWebController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EstablishmentsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEstablishmentsRecordPage(
          queryBuilder: (_) => listEstablishmentsQueryWebPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEstablishmentsQueryWebStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
