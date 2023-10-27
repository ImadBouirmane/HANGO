import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/components/confirmation/delete_confirmation_establishement/delete_confirmation_establishement_widget.dart';
import '/components/confirmation/delete_confirmation_event/delete_confirmation_event_widget.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<EventsRecord> dashboardEventsRecordList = snapshot.data!;
        return Title(
            title: 'Dashboard',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Builder(
                    builder: (context) {
                      if (isWeb) {
                        return Visibility(
                          visible: responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.adminSideBarModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: AdminSideBarWidget(
                                      oneBG: FlutterFlowTheme.of(context)
                                          .tertiary400,
                                      oneIcon: Icon(
                                        Icons.home_filled,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 25.0,
                                      ),
                                      twoBG: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      twoIcon: Icon(
                                        Icons.event,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 25.0,
                                      ),
                                      threeColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      threeIcon: Icon(
                                        Icons.house_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.95,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, -1.00),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => ListTile(
                                                  title: Text(
                                                    valueOrDefault<String>(
                                                      'Bonjour ${currentUserDisplayName}',
                                                      'Bonjour utilisateur! (Essayez d\'indiquer votre nom complet)',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                  subtitle: Text(
                                                    functions.timeCheck(
                                                        getCurrentTimestamp)!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 0.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(16.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 15.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(16.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Établissements',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall,
                                                          ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryTransparent,
                                                          hoverIconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons.add,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'DASHBOARD_PAGE_add_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                                'CreateEstStep1');
                                                          },
                                                        ),
                                                      ].addToStart(SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<EstablishmentsRecord>>(
                                                stream:
                                                    queryEstablishmentsRecord(
                                                  queryBuilder:
                                                      (establishmentsRecord) =>
                                                          establishmentsRecord
                                                              .orderBy(
                                                                  'created_time'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<EstablishmentsRecord>
                                                      listViewEstablishmentsRecordList =
                                                      snapshot.data!;
                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15.0),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewEstablishmentsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 15.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewEstablishmentsRecord =
                                                          listViewEstablishmentsRecordList[
                                                              listViewIndex];
                                                      return StreamBuilder<
                                                          List<ImagesRecord>>(
                                                        stream:
                                                            queryImagesRecord(
                                                          parent:
                                                              listViewEstablishmentsRecord
                                                                  .reference,
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ImagesRecord>
                                                              containerImagesRecordList =
                                                              snapshot.data!;
                                                          final containerImagesRecord =
                                                              containerImagesRecordList
                                                                      .isNotEmpty
                                                                  ? containerImagesRecordList
                                                                      .first
                                                                  : null;
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              color: Color(
                                                                  0x00000000),
                                                              child:
                                                                  ExpandableNotifier(
                                                                child:
                                                                    ExpandablePanel(
                                                                  header:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        StreamBuilder<
                                                                            List<ScheduleRecord>>(
                                                                          stream:
                                                                              queryScheduleRecord(
                                                                            parent:
                                                                                listViewEstablishmentsRecord.reference,
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 30.0,
                                                                                  height: 30.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<ScheduleRecord>
                                                                                rowScheduleRecordList =
                                                                                snapshot.data!;
                                                                            final rowScheduleRecord = rowScheduleRecordList.isNotEmpty
                                                                                ? rowScheduleRecordList.first
                                                                                : null;
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          containerImagesRecord?.image1 != null && containerImagesRecord?.image1 != ''
                                                                                              ? valueOrDefault<String>(
                                                                                                  containerImagesRecord?.image1,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                )
                                                                                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        ),
                                                                                        width: 100.0,
                                                                                        height: 100.0,
                                                                                        fit: BoxFit.cover,
                                                                                        errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                          'assets/images/error_image.png',
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          listViewEstablishmentsRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: 20.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 40.0,
                                                                                  icon: Icon(
                                                                                    Icons.mode_edit,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('DASHBOARD_PAGE_mode_edit_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'UpdateEstStep1',
                                                                                      queryParameters: {
                                                                                        'establishmentDetails': serializeParam(
                                                                                          listViewEstablishmentsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 20.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                  icon: Icon(
                                                                                    Icons.delete,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('DASHBOARD_PAGE_delete_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_bottom_sheet');
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: DeleteConfirmationEstablishementWidget(
                                                                                              establishementRef: listViewEstablishmentsRecord.reference,
                                                                                              mediaEst: containerImagesRecord!.reference,
                                                                                              scheduleEst: rowScheduleRecord!.reference,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                ),
                                                                              ].divide(SizedBox(width: 15.0)).around(SizedBox(width: 15.0)),
                                                                            );
                                                                          },
                                                                        ),
                                                                        Divider(
                                                                          height:
                                                                              1.0,
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 10.0)),
                                                                    ),
                                                                  ),
                                                                  collapsed:
                                                                      Container(
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                  expanded:
                                                                      Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.7,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      'Événements',
                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 20.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 40.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).primary,
                                                                                    hoverColor: FlutterFlowTheme.of(context).primaryTransparent,
                                                                                    hoverIconColor: FlutterFlowTheme.of(context).primary,
                                                                                    icon: Icon(
                                                                                      Icons.add,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('DASHBOARD_PAGE_add_ICN_ON_TAP');
                                                                                      logFirebaseEvent('IconButton_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'CreateEventsStep1',
                                                                                        queryParameters: {
                                                                                          'establishmentRef': serializeParam(
                                                                                            listViewEstablishmentsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 20.0)),
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<List<EventsRecord>>(
                                                                              stream: queryEventsRecord(
                                                                                queryBuilder: (eventsRecord) => eventsRecord.where(
                                                                                  'establishment_id',
                                                                                  isEqualTo: listViewEstablishmentsRecord.reference,
                                                                                ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 30.0,
                                                                                      height: 30.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<EventsRecord> listViewEventsRecordList = snapshot.data!;
                                                                                if (listViewEventsRecordList.isEmpty) {
                                                                                  return EmptyListWidget(
                                                                                    icon: Icon(
                                                                                      Icons.event,
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                      size: 50.0,
                                                                                    ),
                                                                                    title: 'La liste des événements est vide!',
                                                                                    description: 'Essayez d\'ajouter des nouvels événements',
                                                                                  );
                                                                                }
                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: listViewEventsRecordList.length,
                                                                                  separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                    final listViewEventsRecord = listViewEventsRecordList[listViewIndex];
                                                                                    return StreamBuilder<EventsRecord>(
                                                                                      stream: EventsRecord.getDocument(listViewEventsRecord.reference),
                                                                                      builder: (context, snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot.hasData) {
                                                                                          return Center(
                                                                                            child: SizedBox(
                                                                                              width: 30.0,
                                                                                              height: 30.0,
                                                                                              child: CircularProgressIndicator(
                                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        final containerEventsRecord = snapshot.data!;
                                                                                        return Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                child: StreamBuilder<List<MediaRecord>>(
                                                                                                  stream: queryMediaRecord(
                                                                                                    parent: listViewEventsRecord.reference,
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<MediaRecord> rowMediaRecordList = snapshot.data!;
                                                                                                    final rowMediaRecord = rowMediaRecordList.isNotEmpty ? rowMediaRecordList.first : null;
                                                                                                    return Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              rowMediaRecord?.image != null && rowMediaRecord?.image != '' ? rowMediaRecord?.image : null,
                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                            ),
                                                                                                            width: 100.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    listViewEventsRecord.title != null && listViewEventsRecord.title != '' ? listViewEventsRecord.title : '',
                                                                                                                    'Aucune',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                ),
                                                                                                              ),
                                                                                                              StreamBuilder<List<ScheduleEventRecord>>(
                                                                                                                stream: queryScheduleEventRecord(
                                                                                                                  parent: listViewEventsRecord.reference,
                                                                                                                  singleRecord: true,
                                                                                                                ),
                                                                                                                builder: (context, snapshot) {
                                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                                  if (!snapshot.hasData) {
                                                                                                                    return Center(
                                                                                                                      child: SizedBox(
                                                                                                                        width: 30.0,
                                                                                                                        height: 30.0,
                                                                                                                        child: CircularProgressIndicator(
                                                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }
                                                                                                                  List<ScheduleEventRecord> dateEventScheduleEventRecordList = snapshot.data!;
                                                                                                                  final dateEventScheduleEventRecord = dateEventScheduleEventRecordList.isNotEmpty ? dateEventScheduleEventRecordList.first : null;
                                                                                                                  return Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      dateTimeFormat(
                                                                                                                                    'd/M/y',
                                                                                                                                    dateEventScheduleEventRecord?.date,
                                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                                  ) !=
                                                                                                                                  null &&
                                                                                                                              dateTimeFormat(
                                                                                                                                    'd/M/y',
                                                                                                                                    dateEventScheduleEventRecord?.date,
                                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                                  ) !=
                                                                                                                                  ''
                                                                                                                          ? dateTimeFormat(
                                                                                                                              'd/M/y',
                                                                                                                              dateEventScheduleEventRecord?.date,
                                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                                            )
                                                                                                                          : '',
                                                                                                                      'Aucune',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ].divide(SizedBox(width: 15.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FlutterFlowIconButton(
                                                                                                          borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                          borderRadius: 20.0,
                                                                                                          borderWidth: 1.0,
                                                                                                          buttonSize: 40.0,
                                                                                                          icon: Icon(
                                                                                                            Icons.mode_edit,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            logFirebaseEvent('DASHBOARD_PAGE_mode_edit_ICN_ON_TAP');
                                                                                                            logFirebaseEvent('IconButton_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              'UpdateEventStep1',
                                                                                                              queryParameters: {
                                                                                                                'eventstDetails': serializeParam(
                                                                                                                  listViewEventsRecord.reference,
                                                                                                                  ParamType.DocumentReference,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                        FlutterFlowIconButton(
                                                                                                          borderColor: Colors.transparent,
                                                                                                          borderRadius: 20.0,
                                                                                                          borderWidth: 1.0,
                                                                                                          buttonSize: 40.0,
                                                                                                          fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          icon: Icon(
                                                                                                            Icons.delete,
                                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            size: 20.0,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            logFirebaseEvent('DASHBOARD_PAGE_delete_ICN_ON_TAP');
                                                                                                            final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                                            try {
                                                                                                              logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                enableDrag: false,
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return GestureDetector(
                                                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                    child: Padding(
                                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                                      child: DeleteConfirmationEventWidget(
                                                                                                                        eventRef: listViewEventsRecord.reference,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => safeSetState(() {}));

                                                                                                              logFirebaseEvent('IconButton_backend_call');
                                                                                                              firestoreBatch.delete(listViewEstablishmentsRecord.eventRef!);
                                                                                                              logFirebaseEvent('IconButton_backend_call');
                                                                                                              firestoreBatch.delete(listViewEstablishmentsRecord.eventsReferences.first);
                                                                                                            } finally {
                                                                                                              await firestoreBatch.commit();
                                                                                                            }
                                                                                                          },
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 15.0)).around(SizedBox(width: 15.0)),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Divider(
                                                                                                height: 1.0,
                                                                                                thickness: 1.0,
                                                                                                indent: 30.0,
                                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 5.0)),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        true,
                                                                    tapBodyToCollapse:
                                                                        true,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ].addToStart(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (valueOrDefault<bool>(
                                  _model.notifOpen == true,
                                  false,
                                ))
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: FutureBuilder<int>(
                                      future: queryNotificationsRecordCount(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        int conditionalBuilderCount =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            if (valueOrDefault<bool>(
                                              _model.notifOpen == true,
                                              false,
                                            )) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.3,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.95,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, -1.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Notifications Panel',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall,
                                                              ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons
                                                                    .close_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'DASHBOARD_PAGE_close_sharp_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_update_page_state');
                                                                setState(() {
                                                                  _model.notifOpen =
                                                                      false;
                                                                });
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                        Expanded(
                                                          child: PagedListView<
                                                              DocumentSnapshot<
                                                                  Object?>?,
                                                              NotificationsRecord>(
                                                            pagingController: _model
                                                                .setListViewController3(
                                                              NotificationsRecord
                                                                  .collection
                                                                  .orderBy(
                                                                      'createdAt'),
                                                            ),
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            reverse: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            builderDelegate:
                                                                PagedChildBuilderDelegate<
                                                                    NotificationsRecord>(
                                                              // Customize what your widget looks like when it's loading the first page.
                                                              firstPageProgressIndicatorBuilder:
                                                                  (_) => Center(
                                                                child: SizedBox(
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // Customize what your widget looks like when it's loading another page.
                                                              newPageProgressIndicatorBuilder:
                                                                  (_) => Center(
                                                                child: SizedBox(
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              itemBuilder: (context,
                                                                  _,
                                                                  listViewIndex) {
                                                                final listViewNotificationsRecord = _model
                                                                        .listViewPagingController3!
                                                                        .itemList![
                                                                    listViewIndex];
                                                                return Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    listViewNotificationsRecord.isRead ==
                                                                            false
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryTransparent
                                                                        : FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryTransparent,
                                                                  ),
                                                                  elevation:
                                                                      0.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                listViewNotificationsRecord.title,
                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                listViewNotificationsRecord.description,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              15.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<List<ByManagersRecord>>(
                                                                            stream:
                                                                                queryByManagersRecord(
                                                                              parent: listViewNotificationsRecord.reference,
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<ByManagersRecord> rowByManagersRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final rowByManagersRecord = rowByManagersRecordList.isNotEmpty ? rowByManagersRecordList.first : null;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('DASHBOARD_PAGE_REFUSEZ_BTN_ON_TAP');
                                                                                      final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                      try {
                                                                                        logFirebaseEvent('Button_backend_call');

                                                                                        firestoreBatch.update(
                                                                                            rowByManagersRecord!.reference,
                                                                                            createByManagersRecordData(
                                                                                              isConfirmed: false,
                                                                                            ));
                                                                                        logFirebaseEvent('Button_backend_call');

                                                                                        firestoreBatch.update(
                                                                                            listViewNotificationsRecord.reference,
                                                                                            createNotificationsRecordData(
                                                                                              isRead: true,
                                                                                              updatedAt: getCurrentTimestamp,
                                                                                            ));
                                                                                      } finally {
                                                                                        await firestoreBatch.commit();
                                                                                      }
                                                                                    },
                                                                                    text: 'Refusez',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                    ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('DASHBOARD_PAGE_ACCEPTEZ_BTN_ON_TAP');
                                                                                      final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                      try {
                                                                                        logFirebaseEvent('Button_backend_call');

                                                                                        firestoreBatch.update(
                                                                                            rowByManagersRecord!.reference,
                                                                                            createByManagersRecordData(
                                                                                              isConfirmed: true,
                                                                                            ));
                                                                                        logFirebaseEvent('Button_backend_call');

                                                                                        firestoreBatch.update(
                                                                                            listViewNotificationsRecord.reference,
                                                                                            createNotificationsRecordData(
                                                                                              isRead: true,
                                                                                              updatedAt: getCurrentTimestamp,
                                                                                            ));
                                                                                      } finally {
                                                                                        await firestoreBatch.commit();
                                                                                      }
                                                                                    },
                                                                                    text: 'Acceptez',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              15.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  listViewNotificationsRecord.isRead == false ? 'Marqué comme lu !' : 'Lu !',
                                                                                  'Marqué comme lu !',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                              ),
                                                                              Theme(
                                                                                data: ThemeData(
                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                    visualDensity: VisualDensity.compact,
                                                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                                child: Checkbox(
                                                                                  value: _model.checkboxValueMap[listViewNotificationsRecord] ??= true,
                                                                                  onChanged: (newValue) async {
                                                                                    setState(() => _model.checkboxValueMap[listViewNotificationsRecord] = newValue!);
                                                                                    if (newValue!) {
                                                                                      logFirebaseEvent('DASHBOARD_Checkbox_6nm4abo2_ON_TOGGLE_ON');
                                                                                      logFirebaseEvent('Checkbox_backend_call');

                                                                                      await listViewNotificationsRecord.reference.update(createNotificationsRecordData(
                                                                                        isRead: true,
                                                                                      ));
                                                                                    } else {
                                                                                      logFirebaseEvent('DASHBOARD_Checkbox_6nm4abo2_ON_TOGGLE_OF');
                                                                                      logFirebaseEvent('Checkbox_backend_call');

                                                                                      await listViewNotificationsRecord.reference.update(createNotificationsRecordData(
                                                                                        isRead: false,
                                                                                      ));
                                                                                    }
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                  checkColor: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 15.0))
                                                          .addToStart(SizedBox(
                                                              height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, -0.90),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 15.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'DASHBOARD_PAGE_Badge_rna3l8p2_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Badge_update_page_state');
                                                      setState(() {
                                                        _model.notifOpen = true;
                                                      });
                                                    },
                                                    child: badges.Badge(
                                                      badgeContent: Text(
                                                        valueOrDefault<String>(
                                                          conditionalBuilderCount
                                                              .toString(),
                                                          '0',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 3,
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                      showBadge: true,
                                                      shape: badges
                                                          .BadgeShape.circle,
                                                      badgeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      elevation: 4.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      position:
                                                          badges.BadgePosition
                                                              .topEnd(),
                                                      animationType: badges
                                                          .BadgeAnimationType
                                                          .scale,
                                                      toAnimate: true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.notifications,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Visibility(
                          visible: responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.card_membership_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                                Text(
                                  'Only support web now !',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
