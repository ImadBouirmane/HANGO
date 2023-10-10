import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'list_of_establishments_widget.dart' show ListOfEstablishmentsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

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
  // State field(s) for estblishmentSearch widget.
  TextEditingController? estblishmentSearchController1;
  String? Function(BuildContext, String?)?
      estblishmentSearchController1Validator;
  List<EstablishmentsRecord> simpleSearchResults1 = [];
  // State field(s) for typeEstablishmentChoices widget.
  String? typeEstablishmentChoicesValue1;
  FormFieldController<List<String>>? typeEstablishmentChoicesValueController1;
  // State field(s) for musicStyleEstablishmentChoices widget.
  String? musicStyleEstablishmentChoicesValue1;
  FormFieldController<List<String>>?
      musicStyleEstablishmentChoicesValueController1;
  // State field(s) for ListEstablishmentsQuery widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstablishmentsQueryPagingController1;
  Query? listEstablishmentsQueryPagingQuery1;
  List<StreamSubscription?> listEstablishmentsQueryStreamSubscriptions1 = [];

  // State field(s) for ListEstablishmentsQueryMusicFilter widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstablishmentsQueryMusicFilterPagingController1;
  Query? listEstablishmentsQueryMusicFilterPagingQuery1;
  List<StreamSubscription?>
      listEstablishmentsQueryMusicFilterStreamSubscriptions1 = [];

  // State field(s) for estblishmentSearch widget.
  TextEditingController? estblishmentSearchController2;
  String? Function(BuildContext, String?)?
      estblishmentSearchController2Validator;
  List<EstablishmentsRecord> simpleSearchResults2 = [];
  // State field(s) for typeEstablishmentChoices widget.
  String? typeEstablishmentChoicesValue2;
  FormFieldController<List<String>>? typeEstablishmentChoicesValueController2;
  // State field(s) for musicStyleEstablishmentChoices widget.
  String? musicStyleEstablishmentChoicesValue2;
  FormFieldController<List<String>>?
      musicStyleEstablishmentChoicesValueController2;
  // State field(s) for ListEstablishmentsQuery widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstablishmentsQueryPagingController2;
  Query? listEstablishmentsQueryPagingQuery2;
  List<StreamSubscription?> listEstablishmentsQueryStreamSubscriptions2 = [];

  // State field(s) for ListEstablishmentsQueryMusicFilter widget.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>?
      listEstablishmentsQueryMusicFilterPagingController2;
  Query? listEstablishmentsQueryMusicFilterPagingQuery2;
  List<StreamSubscription?>
      listEstablishmentsQueryMusicFilterStreamSubscriptions2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavWebModel.dispose();
    estblishmentSearchController1?.dispose();
    listEstablishmentsQueryStreamSubscriptions1.forEach((s) => s?.cancel());
    listEstablishmentsQueryPagingController1?.dispose();

    listEstablishmentsQueryMusicFilterStreamSubscriptions1
        .forEach((s) => s?.cancel());
    listEstablishmentsQueryMusicFilterPagingController1?.dispose();

    estblishmentSearchController2?.dispose();
    listEstablishmentsQueryStreamSubscriptions2.forEach((s) => s?.cancel());
    listEstablishmentsQueryPagingController2?.dispose();

    listEstablishmentsQueryMusicFilterStreamSubscriptions2
        .forEach((s) => s?.cancel());
    listEstablishmentsQueryMusicFilterPagingController2?.dispose();
  }

  /// Action blocks are added here.

  Future estListState(BuildContext context) async {}

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      setListEstablishmentsQueryController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEstablishmentsQueryPagingController1 ??=
        _createListEstablishmentsQueryController1(query, parent);
    if (listEstablishmentsQueryPagingQuery1 != query) {
      listEstablishmentsQueryPagingQuery1 = query;
      listEstablishmentsQueryPagingController1?.refresh();
    }
    return listEstablishmentsQueryPagingController1!;
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      _createListEstablishmentsQueryController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EstablishmentsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEstablishmentsRecordPage(
          queryBuilder: (_) => listEstablishmentsQueryPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEstablishmentsQueryStreamSubscriptions1,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      setListEstablishmentsQueryMusicFilterController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEstablishmentsQueryMusicFilterPagingController1 ??=
        _createListEstablishmentsQueryMusicFilterController1(query, parent);
    if (listEstablishmentsQueryMusicFilterPagingQuery1 != query) {
      listEstablishmentsQueryMusicFilterPagingQuery1 = query;
      listEstablishmentsQueryMusicFilterPagingController1?.refresh();
    }
    return listEstablishmentsQueryMusicFilterPagingController1!;
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      _createListEstablishmentsQueryMusicFilterController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EstablishmentsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEstablishmentsRecordPage(
          queryBuilder: (_) =>
              listEstablishmentsQueryMusicFilterPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions:
              listEstablishmentsQueryMusicFilterStreamSubscriptions1,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      setListEstablishmentsQueryController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEstablishmentsQueryPagingController2 ??=
        _createListEstablishmentsQueryController2(query, parent);
    if (listEstablishmentsQueryPagingQuery2 != query) {
      listEstablishmentsQueryPagingQuery2 = query;
      listEstablishmentsQueryPagingController2?.refresh();
    }
    return listEstablishmentsQueryPagingController2!;
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      _createListEstablishmentsQueryController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EstablishmentsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEstablishmentsRecordPage(
          queryBuilder: (_) => listEstablishmentsQueryPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listEstablishmentsQueryStreamSubscriptions2,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      setListEstablishmentsQueryMusicFilterController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listEstablishmentsQueryMusicFilterPagingController2 ??=
        _createListEstablishmentsQueryMusicFilterController2(query, parent);
    if (listEstablishmentsQueryMusicFilterPagingQuery2 != query) {
      listEstablishmentsQueryMusicFilterPagingQuery2 = query;
      listEstablishmentsQueryMusicFilterPagingController2?.refresh();
    }
    return listEstablishmentsQueryMusicFilterPagingController2!;
  }

  PagingController<DocumentSnapshot?, EstablishmentsRecord>
      _createListEstablishmentsQueryMusicFilterController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EstablishmentsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEstablishmentsRecordPage(
          queryBuilder: (_) =>
              listEstablishmentsQueryMusicFilterPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions:
              listEstablishmentsQueryMusicFilterStreamSubscriptions2,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
