import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_of_establishments_widget.dart' show ListOfEstablishmentsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ListOfEstablishmentsModel
    extends FlutterFlowModel<ListOfEstablishmentsWidget> {
  ///  Local state fields for this page.

  bool filterOnEstMobile = false;

  bool filterOffEstMobile = true;

  bool searchStateMobile = false;

  bool typeFilterMobile = false;

  bool musicFilterMobile = false;

  bool filterOnEstWeb = false;

  bool filterOffEstWeb = true;

  bool searchStateWeb = false;

  bool typeFilterWeb = false;

  bool musicFilterWeb = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // State field(s) for ListEstMobile widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstMobilePagingController;
  Query? listEstMobilePagingQuery;
  List<StreamSubscription?> listEstMobileStreamSubscriptions = [];

  // State field(s) for ListEstablishmentsQueryWeb widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstablishmentsQueryWebPagingController;
  Query? listEstablishmentsQueryWebPagingQuery;
  List<StreamSubscription?> listEstablishmentsQueryWebStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavWebModel.dispose();
    listEstMobileStreamSubscriptions.forEach((s) => s?.cancel());
    listEstMobilePagingController?.dispose();

    listEstablishmentsQueryWebStreamSubscriptions.forEach((s) => s?.cancel());
    listEstablishmentsQueryWebPagingController?.dispose();
  }

  /// Action blocks are added here.

  Future estListState(BuildContext context) async {}

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      setListEstMobileController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEstMobilePagingController ??=
        _createListEstMobileController(query, parent);
    if (listEstMobilePagingQuery != query) {
      listEstMobilePagingQuery = query;
      listEstMobilePagingController?.refresh();
    }
    return listEstMobilePagingController!;
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      _createListEstMobileController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EstablishmentsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEstablishmentsRecordPage(
          queryBuilder: (_) => listEstMobilePagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEstMobileStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }

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
