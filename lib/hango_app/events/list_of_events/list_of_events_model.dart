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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ListOfEventsModel extends FlutterFlowModel {
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
  TextEditingController? eventSearchController1;
  String? Function(BuildContext, String?)? eventSearchController1Validator;
  List<EventsRecord> simpleSearchResults1 = [];
  // State field(s) for typeEventChoices widget.
  String? typeEventChoicesValue1;
  FormFieldController<List<String>>? typeEventChoicesValueController1;
  // State field(s) for musicStyleEventChoices widget.
  String? musicStyleEventChoicesValue1;
  FormFieldController<List<String>>? musicStyleEventChoicesValueController1;
  // State field(s) for ListEventsTypeFilter widget.

  PagingController<DocumentSnapshot?, EventsRecord>?
      listEventsTypeFilterPagingController1;
  Query? listEventsTypeFilterPagingQuery1;
  List<StreamSubscription?> listEventsTypeFilterStreamSubscriptions1 = [];

  // State field(s) for ListEventsMusicFilter widget.

  PagingController<DocumentSnapshot?, EventsRecord>?
      listEventsMusicFilterPagingController1;
  Query? listEventsMusicFilterPagingQuery1;
  List<StreamSubscription?> listEventsMusicFilterStreamSubscriptions1 = [];

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // State field(s) for eventSearch widget.
  TextEditingController? eventSearchController2;
  String? Function(BuildContext, String?)? eventSearchController2Validator;
  List<EventsRecord> simpleSearchResults2 = [];
  // State field(s) for typeEventChoices widget.
  String? typeEventChoicesValue2;
  FormFieldController<List<String>>? typeEventChoicesValueController2;
  // State field(s) for musicStyleEventChoices widget.
  String? musicStyleEventChoicesValue2;
  FormFieldController<List<String>>? musicStyleEventChoicesValueController2;
  // State field(s) for ListEventsTypeFilter widget.

  PagingController<DocumentSnapshot?, EventsRecord>?
      listEventsTypeFilterPagingController2;
  Query? listEventsTypeFilterPagingQuery2;
  List<StreamSubscription?> listEventsTypeFilterStreamSubscriptions2 = [];

  // State field(s) for ListEventsMusicFilter widget.

  PagingController<DocumentSnapshot?, EventsRecord>?
      listEventsMusicFilterPagingController2;
  Query? listEventsMusicFilterPagingQuery2;
  List<StreamSubscription?> listEventsMusicFilterStreamSubscriptions2 = [];

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
    eventSearchController1?.dispose();
    listEventsTypeFilterStreamSubscriptions1.forEach((s) => s?.cancel());
    listEventsTypeFilterPagingController1?.dispose();

    listEventsMusicFilterStreamSubscriptions1.forEach((s) => s?.cancel());
    listEventsMusicFilterPagingController1?.dispose();

    eventSearchController2?.dispose();
    listEventsTypeFilterStreamSubscriptions2.forEach((s) => s?.cancel());
    listEventsTypeFilterPagingController2?.dispose();

    listEventsMusicFilterStreamSubscriptions2.forEach((s) => s?.cancel());
    listEventsMusicFilterPagingController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EventsRecord>
      setListEventsTypeFilterController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEventsTypeFilterPagingController1 ??=
        _createListEventsTypeFilterController1(query, parent);
    if (listEventsTypeFilterPagingQuery1 != query) {
      listEventsTypeFilterPagingQuery1 = query;
      listEventsTypeFilterPagingController1?.refresh();
    }
    return listEventsTypeFilterPagingController1!;
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      _createListEventsTypeFilterController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listEventsTypeFilterPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEventsTypeFilterStreamSubscriptions1,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      setListEventsMusicFilterController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEventsMusicFilterPagingController1 ??=
        _createListEventsMusicFilterController1(query, parent);
    if (listEventsMusicFilterPagingQuery1 != query) {
      listEventsMusicFilterPagingQuery1 = query;
      listEventsMusicFilterPagingController1?.refresh();
    }
    return listEventsMusicFilterPagingController1!;
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      _createListEventsMusicFilterController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listEventsMusicFilterPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEventsMusicFilterStreamSubscriptions1,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      setListEventsTypeFilterController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEventsTypeFilterPagingController2 ??=
        _createListEventsTypeFilterController2(query, parent);
    if (listEventsTypeFilterPagingQuery2 != query) {
      listEventsTypeFilterPagingQuery2 = query;
      listEventsTypeFilterPagingController2?.refresh();
    }
    return listEventsTypeFilterPagingController2!;
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      _createListEventsTypeFilterController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listEventsTypeFilterPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEventsTypeFilterStreamSubscriptions2,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      setListEventsMusicFilterController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEventsMusicFilterPagingController2 ??=
        _createListEventsMusicFilterController2(query, parent);
    if (listEventsMusicFilterPagingQuery2 != query) {
      listEventsMusicFilterPagingQuery2 = query;
      listEventsMusicFilterPagingController2?.refresh();
    }
    return listEventsMusicFilterPagingController2!;
  }

  PagingController<DocumentSnapshot?, EventsRecord>
      _createListEventsMusicFilterController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => listEventsMusicFilterPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEventsMusicFilterStreamSubscriptions2,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
