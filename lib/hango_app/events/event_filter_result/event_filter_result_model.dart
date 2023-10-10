import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'event_filter_result_widget.dart' show EventFilterResultWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EventFilterResultModel extends FlutterFlowModel<EventFilterResultWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListEvents widget.

  PagingController<DocumentSnapshot?, EventsRecord>? listEventsPagingController;
  Query? listEventsPagingQuery;
  List<StreamSubscription?> listEventsStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    listEventsStreamSubscriptions.forEach((s) => s?.cancel());
    listEventsPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EventsRecord> setListEventsController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEventsPagingController ??= _createListEventsController(query, parent);
    if (listEventsPagingQuery != query) {
      listEventsPagingQuery = query;
      listEventsPagingController?.refresh();
    }
    return listEventsPagingController!;
  }

  PagingController<DocumentSnapshot?, EventsRecord> _createListEventsController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listEventsPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEventsStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
