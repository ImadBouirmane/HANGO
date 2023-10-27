import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'list_of_events_widget.dart' show ListOfEventsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ListOfEventsModel extends FlutterFlowModel<ListOfEventsWidget> {
  ///  Local state fields for this page.

  bool filterOnEventMobile = false;

  bool filterOffEventMobile = false;

  bool typeFilterMobile = false;

  bool musicFilterMobile = false;

  bool searchEventStateMobile = false;

  bool filterOnEventWeb = false;

  bool filterOffEventWeb = false;

  bool typeFilterWeb = false;

  bool? musicFilterWeb;

  bool searchEventStateWeb = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // State field(s) for eventSearch widget.
  FocusNode? eventSearchFocusNode1;
  TextEditingController? eventSearchController1;
  String? Function(BuildContext, String?)? eventSearchController1Validator;
  List<EventsRecord> simpleSearchResults1 = [];
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for typeEventChoices widget.
  String? typeEventChoicesValue1;
  FormFieldController<List<String>>? typeEventChoicesValueController1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for musicStyleEventChoices widget.
  String? musicStyleEventChoicesValue1;
  FormFieldController<List<String>>? musicStyleEventChoicesValueController1;
  // State field(s) for ListEventsTypeFilter widget.

  PagingController<DocumentSnapshot?, EventsRecord>?
      listEventsTypeFilterPagingController;
  Query? listEventsTypeFilterPagingQuery;
  List<StreamSubscription?> listEventsTypeFilterStreamSubscriptions = [];

  // State field(s) for ListEventsMusicFilter widget.

  PagingController<DocumentSnapshot?, EventsRecord>?
      listEventsMusicFilterPagingController;
  Query? listEventsMusicFilterPagingQuery;
  List<StreamSubscription?> listEventsMusicFilterStreamSubscriptions = [];

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // State field(s) for eventSearch widget.
  FocusNode? eventSearchFocusNode2;
  TextEditingController? eventSearchController2;
  String? Function(BuildContext, String?)? eventSearchController2Validator;
  List<EventsRecord> simpleSearchResults2 = [];
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for typeEventChoices widget.
  String? typeEventChoicesValue2;
  FormFieldController<List<String>>? typeEventChoicesValueController2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for musicStyleEventChoices widget.
  String? musicStyleEventChoicesValue2;
  FormFieldController<List<String>>? musicStyleEventChoicesValueController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavWebModel.dispose();
    eventSearchFocusNode1?.dispose();
    eventSearchController1?.dispose();

    expandableController1.dispose();
    expandableController2.dispose();
    listEventsTypeFilterStreamSubscriptions.forEach((s) => s?.cancel());
    listEventsTypeFilterPagingController?.dispose();

    listEventsMusicFilterStreamSubscriptions.forEach((s) => s?.cancel());
    listEventsMusicFilterPagingController?.dispose();

    eventSearchFocusNode2?.dispose();
    eventSearchController2?.dispose();

    expandableController3.dispose();
    expandableController4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EventsRecord>
      setListEventsTypeFilterController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEventsTypeFilterPagingController ??=
        _createListEventsTypeFilterController(query, parent);
    if (listEventsTypeFilterPagingQuery != query) {
      listEventsTypeFilterPagingQuery = query;
      listEventsTypeFilterPagingController?.refresh();
    }
    return listEventsTypeFilterPagingController!;
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      _createListEventsTypeFilterController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listEventsTypeFilterPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEventsTypeFilterStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      setListEventsMusicFilterController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEventsMusicFilterPagingController ??=
        _createListEventsMusicFilterController(query, parent);
    if (listEventsMusicFilterPagingQuery != query) {
      listEventsMusicFilterPagingQuery = query;
      listEventsMusicFilterPagingController?.refresh();
    }
    return listEventsMusicFilterPagingController!;
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      _createListEventsMusicFilterController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listEventsMusicFilterPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEventsMusicFilterStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
