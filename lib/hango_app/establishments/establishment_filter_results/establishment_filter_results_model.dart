import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'establishment_filter_results_widget.dart'
    show EstablishmentFilterResultsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class EstablishmentFilterResultsModel
    extends FlutterFlowModel<EstablishmentFilterResultsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListEstablishments widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstablishmentsPagingController;
  Query? listEstablishmentsPagingQuery;
  List<StreamSubscription?> listEstablishmentsStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    listEstablishmentsStreamSubscriptions.forEach((s) => s?.cancel());
    listEstablishmentsPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      setListEstablishmentsController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEstablishmentsPagingController ??=
        _createListEstablishmentsController(query, parent);
    if (listEstablishmentsPagingQuery != query) {
      listEstablishmentsPagingQuery = query;
      listEstablishmentsPagingController?.refresh();
    }
    return listEstablishmentsPagingController!;
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      _createListEstablishmentsController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EstablishmentsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEstablishmentsRecordPage(
          queryBuilder: (_) => listEstablishmentsPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEstablishmentsStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
