import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_confirmation_event/delete_confirmation_event_widget.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/manager_side_bar/manager_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'manager_dashboard_model.dart';
export 'manager_dashboard_model.dart';

class ManagerDashboardWidget extends StatefulWidget {
  const ManagerDashboardWidget({super.key});

  @override
  State<ManagerDashboardWidget> createState() => _ManagerDashboardWidgetState();
}

class _ManagerDashboardWidgetState extends State<ManagerDashboardWidget> {
  late ManagerDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerDashboardModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ManagerDashboard'});
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        List<EventsRecord> managerDashboardEventsRecordList = snapshot.data!;
        return Title(
            title: 'ManagerDashboard',
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
                                wrapWithModel(
                                  model: _model.managerSideBarModel,
                                  updateCallback: () => setState(() {}),
                                  child: const ManagerSideBarWidget(
                                    oneIcon: Icon(
                                      Icons.dashboard,
                                    ),
                                    twoIcon: Icon(
                                      Icons.event,
                                    ),
                                    threeIcon: Icon(
                                      Icons.home_work,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: StreamBuilder<EventsRecord>(
                                    stream: EventsRecord.getDocument(
                                        managerDashboardEventsRecordList
                                            .first.reference),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 30.0,
                                            height: 30.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final columnEventsRecord = snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: StreamBuilder<
                                                    EstablishmentsRecord>(
                                                  stream: EstablishmentsRecord
                                                      .getDocument(
                                                          columnEventsRecord
                                                              .establishmentId!),
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
                                                    final clipContainerEstablishmentsRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.95,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                15.0,
                                                                                0.0,
                                                                                15.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: const BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(16.0),
                                                                                  topRight: Radius.circular(16.0),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        'Mes Événements',
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                      ),
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('MANAGER_DASHBOARD_CRÉER_UN_ÉVÉNEMENT_BTN');
                                                                                        logFirebaseEvent('Button_navigate_to');

                                                                                        context.pushNamed(
                                                                                          'CreateEventsStep1',
                                                                                          queryParameters: {
                                                                                            'establishmentRef': serializeParam(
                                                                                              clipContainerEstablishmentsRecord.reference,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      text: 'Créer un événement',
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                    ),
                                                                                  ].addToStart(const SizedBox(width: 15.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final listEvents = managerDashboardEventsRecordList.map((e) => e).toList();
                                                                              if (listEvents.isEmpty) {
                                                                                return EmptyListWidget(
                                                                                  icon: Icon(
                                                                                    Icons.event,
                                                                                    color: FlutterFlowTheme.of(context).grayIcon,
                                                                                    size: 50.0,
                                                                                  ),
                                                                                  title: 'La liste des événements est vide!',
                                                                                  description: 'Créez des événements',
                                                                                );
                                                                              }
                                                                              return ListView.separated(
                                                                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listEvents.length,
                                                                                separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                                                                                itemBuilder: (context, listEventsIndex) {
                                                                                  final listEventsItem = listEvents[listEventsIndex];
                                                                                  return StreamBuilder<List<MediaRecord>>(
                                                                                    stream: queryMediaRecord(
                                                                                      parent: columnEventsRecord.reference,
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
                                                                                      List<MediaRecord> containerMediaRecordList = snapshot.data!;
                                                                                      final containerMediaRecord = containerMediaRecordList.isNotEmpty ? containerMediaRecordList.first : null;
                                                                                      return Container(
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          color: const Color(0x00000000),
                                                                                          child: ExpandableNotifier(
                                                                                            initialExpanded: false,
                                                                                            child: ExpandablePanel(
                                                                                              header: Container(
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    StreamBuilder<List<ScheduleEventRecord>>(
                                                                                                      stream: queryScheduleEventRecord(
                                                                                                        parent: listEventsItem.reference,
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
                                                                                                        List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
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
                                                                                                                      containerMediaRecord?.image != null && containerMediaRecord?.image != ''
                                                                                                                          ? valueOrDefault<String>(
                                                                                                                              containerMediaRecord?.image,
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
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        SelectionArea(
                                                                                                                            child: AutoSizeText(
                                                                                                                          listEventsItem.title,
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                              ),
                                                                                                                        )),
                                                                                                                        Text(
                                                                                                                          dateTimeFormat(
                                                                                                                            'd/M H:mm',
                                                                                                                            rowScheduleEventRecord!.date!,
                                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: const Color(0xFFFCDC0C),
                                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                                          ),
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  'Promotion en cours',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                ),
                                                                                                                                const FaIcon(
                                                                                                                                  FontAwesomeIcons.percentage,
                                                                                                                                  color: Color(0xFF10212E),
                                                                                                                                  size: 20.0,
                                                                                                                                ),
                                                                                                                              ].divide(const SizedBox(width: 10.0)),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 4.0)),
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
                                                                                                                logFirebaseEvent('MANAGER_DASHBOARD_mode_edit_ICN_ON_TAP');
                                                                                                                logFirebaseEvent('IconButton_navigate_to');

                                                                                                                context.pushNamed(
                                                                                                                  'UpdateEventStep1',
                                                                                                                  queryParameters: {
                                                                                                                    'eventstDetails': serializeParam(
                                                                                                                      listEventsItem.reference,
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
                                                                                                                logFirebaseEvent('MANAGER_DASHBOARD_PAGE_delete_ICN_ON_TAP');
                                                                                                                logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                                await showModalBottomSheet(
                                                                                                                  isScrollControlled: true,
                                                                                                                  backgroundColor: Colors.transparent,
                                                                                                                  enableDrag: false,
                                                                                                                  context: context,
                                                                                                                  builder: (context) {
                                                                                                                    return WebViewAware(
                                                                                                                      child: GestureDetector(
                                                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                        child: Padding(
                                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                                          child: DeleteConfirmationEventWidget(
                                                                                                                            eventRef: listEventsItem.reference,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ).then((value) => safeSetState(() {}));
                                                                                                              },
                                                                                                            ),
                                                                                                          ].divide(const SizedBox(width: 15.0)).around(const SizedBox(width: 15.0)),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      height: 1.0,
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                    ),
                                                                                                  ].divide(const SizedBox(height: 10.0)),
                                                                                                ),
                                                                                              ),
                                                                                              collapsed: Container(
                                                                                                height: 1.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                              ),
                                                                                              expanded: Align(
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(15.0),
                                                                                                  child: StreamBuilder<List<PromotionEventRecord>>(
                                                                                                    stream: queryPromotionEventRecord(
                                                                                                      parent: listEventsItem.reference,
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
                                                                                                      List<PromotionEventRecord> containerPromotionEventRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final containerPromotionEventRecord = containerPromotionEventRecordList.isNotEmpty ? containerPromotionEventRecordList.first : null;
                                                                                                      return Material(
                                                                                                        color: Colors.transparent,
                                                                                                        elevation: 1.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 10.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Text(
                                                                                                                        'Promotions',
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    FFButtonWidget(
                                                                                                                      onPressed: () async {
                                                                                                                        logFirebaseEvent('MANAGER_DASHBOARD_CRÉER_UNE_PROMOTION_BT');
                                                                                                                        logFirebaseEvent('Button_navigate_to');

                                                                                                                        context.pushNamed(
                                                                                                                          'UpdateEventStep3',
                                                                                                                          queryParameters: {
                                                                                                                            'eventstDetails': serializeParam(
                                                                                                                              listEventsItem.reference,
                                                                                                                              ParamType.DocumentReference,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
                                                                                                                        );
                                                                                                                      },
                                                                                                                      text: 'Créer une promotion',
                                                                                                                      options: FFButtonOptions(
                                                                                                                        height: 40.0,
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              color: Colors.white,
                                                                                                                            ),
                                                                                                                        elevation: 3.0,
                                                                                                                        borderSide: const BorderSide(
                                                                                                                          color: Colors.transparent,
                                                                                                                          width: 1.0,
                                                                                                                        ),
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ].divide(const SizedBox(width: 20.0)).addToStart(const SizedBox(width: 20.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                              ListView(
                                                                                                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                                                                                shrinkWrap: true,
                                                                                                                scrollDirection: Axis.vertical,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsets.all(10.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              CircularPercentIndicator(
                                                                                                                                percent: valueOrDefault<double>(
                                                                                                                                  containerPromotionEventRecord!.entranceValue > 0.1 ? containerPromotionEventRecord.entranceValue : null,
                                                                                                                                  0.0,
                                                                                                                                ),
                                                                                                                                radius: 45.0,
                                                                                                                                lineWidth: 12.0,
                                                                                                                                animation: true,
                                                                                                                                animateFromLastPercent: true,
                                                                                                                                progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                center: Text(
                                                                                                                                  '50%',
                                                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Expanded(
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Expanded(
                                                                                                                                                child: Text(
                                                                                                                                                  valueOrDefault<String>(
                                                                                                                                                    containerPromotionEventRecord.title,
                                                                                                                                                    'Aucune',
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            valueOrDefault<String>(
                                                                                                                                              containerPromotionEventRecord.subTitle,
                                                                                                                                              'Aucune',
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            valueOrDefault<String>(
                                                                                                                                              '${dateTimeFormat(
                                                                                                                                                'd/M/y',
                                                                                                                                                containerPromotionEventRecord.startTrack,
                                                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                                                              )} - ${dateTimeFormat(
                                                                                                                                                'd/M/y',
                                                                                                                                                containerPromotionEventRecord.endTrack,
                                                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                                                              )}',
                                                                                                                                              'Il n\'y a pas !',
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ].divide(const SizedBox(width: 15.0)),
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
                                                                                                                                  logFirebaseEvent('MANAGER_DASHBOARD_mode_edit_ICN_ON_TAP');
                                                                                                                                  logFirebaseEvent('IconButton_navigate_to');

                                                                                                                                  context.pushNamed(
                                                                                                                                    'UpdateEventStep3',
                                                                                                                                    queryParameters: {
                                                                                                                                      'eventstDetails': serializeParam(
                                                                                                                                        listEventsItem.reference,
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
                                                                                                                                  logFirebaseEvent('MANAGER_DASHBOARD_PAGE_delete_ICN_ON_TAP');
                                                                                                                                  logFirebaseEvent('IconButton_backend_call');
                                                                                                                                  await containerPromotionEventRecord.reference.delete();
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ].divide(const SizedBox(width: 15.0)).around(const SizedBox(width: 15.0)),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 5.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(height: 10.0)),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              theme: const ExpandableThemeData(
                                                                                                tapHeaderToExpand: true,
                                                                                                tapBodyToExpand: true,
                                                                                                tapBodyToCollapse: true,
                                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                hasIcon: true,
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
                                                                        ].addToStart(const SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                VerticalDivider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                                ),
                                                                Flexible(
                                                                  child: StreamBuilder<
                                                                      EstablishmentsRecord>(
                                                                    stream: EstablishmentsRecord.getDocument(
                                                                        managerDashboardEventsRecordList
                                                                            .first
                                                                            .establishmentId!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                30.0,
                                                                            height:
                                                                                30.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final establishmenDetailsEstablishmentsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.5,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(16.0),
                                                                                    topRight: Radius.circular(16.0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          'Mon établissement',
                                                                                          style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                        ),
                                                                                      ),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('MANAGER_DASHBOARD_MODIFIER_BTN_ON_TAP');
                                                                                          logFirebaseEvent('Button_navigate_to');

                                                                                          context.pushNamed(
                                                                                            'UpdateEstStep1',
                                                                                            queryParameters: {
                                                                                              'establishmentDetails': serializeParam(
                                                                                                clipContainerEstablishmentsRecord.reference,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        text: 'Modifier',
                                                                                        options: FFButtonOptions(
                                                                                          height: 40.0,
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                          elevation: 3.0,
                                                                                          borderSide: const BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                      ),
                                                                                    ].addToStart(const SizedBox(width: 15.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(10.0),
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: MediaQuery.sizeOf(context).height * 1.069,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).accent3,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: SingleChildScrollView(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 1.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                height: 300.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: StreamBuilder<List<ImagesRecord>>(
                                                                                                  stream: queryImagesRecord(
                                                                                                    parent: establishmenDetailsEstablishmentsRecord.reference,
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
                                                                                                    List<ImagesRecord> stackImagesRecordList = snapshot.data!;
                                                                                                    final stackImagesRecord = stackImagesRecordList.isNotEmpty ? stackImagesRecordList.first : null;
                                                                                                    return Stack(
                                                                                                      children: [
                                                                                                        Builder(
                                                                                                          builder: (context) {
                                                                                                            if ((stackImagesRecord?.image1 != null && stackImagesRecord?.image1 != '') && (stackImagesRecord?.video != null && stackImagesRecord?.video != '')) {
                                                                                                              return SizedBox(
                                                                                                                width: double.infinity,
                                                                                                                height: 300.0,
                                                                                                                child: Stack(
                                                                                                                  children: [
                                                                                                                    PageView(
                                                                                                                      controller: _model.pageViewController ??= PageController(initialPage: 0),
                                                                                                                      onPageChanged: (_) => setState(() {}),
                                                                                                                      scrollDirection: Axis.horizontal,
                                                                                                                      children: [
                                                                                                                        ClipRRect(
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          child: Image.network(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              stackImagesRecord?.image1,
                                                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                                            ),
                                                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                            height: 300.0,
                                                                                                                            fit: BoxFit.cover,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        FlutterFlowMediaDisplay(
                                                                                                                          path: valueOrDefault<String>(
                                                                                                                            stackImagesRecord?.video,
                                                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                                          ),
                                                                                                                          imageBuilder: (path) => ClipRRect(
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                            child: Image.network(
                                                                                                                              path,
                                                                                                                              width: 300.0,
                                                                                                                              height: 200.0,
                                                                                                                              fit: BoxFit.cover,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                                                            path: path,
                                                                                                                            width: 300.0,
                                                                                                                            autoPlay: true,
                                                                                                                            looping: true,
                                                                                                                            showControls: false,
                                                                                                                            allowFullScreen: true,
                                                                                                                            allowPlaybackSpeedMenu: false,
                                                                                                                            pauseOnNavigate: false,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                    Align(
                                                                                                                      alignment: const AlignmentDirectional(-1.0, 1.0),
                                                                                                                      child: Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                                                                                                                        child: smooth_page_indicator.SmoothPageIndicator(
                                                                                                                          controller: _model.pageViewController ??= PageController(initialPage: 0),
                                                                                                                          count: 2,
                                                                                                                          axisDirection: Axis.horizontal,
                                                                                                                          onDotClicked: (i) async {
                                                                                                                            await _model.pageViewController!.animateToPage(
                                                                                                                              i,
                                                                                                                              duration: const Duration(milliseconds: 500),
                                                                                                                              curve: Curves.ease,
                                                                                                                            );
                                                                                                                          },
                                                                                                                          effect: smooth_page_indicator.ExpandingDotsEffect(
                                                                                                                            expansionFactor: 3.0,
                                                                                                                            spacing: 8.0,
                                                                                                                            radius: 16.0,
                                                                                                                            dotWidth: 16.0,
                                                                                                                            dotHeight: 8.0,
                                                                                                                            dotColor: FlutterFlowTheme.of(context).primaryTransparent,
                                                                                                                            activeDotColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            paintStyle: PaintingStyle.fill,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              );
                                                                                                            } else if ((stackImagesRecord?.image1 != null && stackImagesRecord?.image1 != '') && (stackImagesRecord?.video == null || stackImagesRecord?.video == '')) {
                                                                                                              return ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.network(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    stackImagesRecord?.image1,
                                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                                  ),
                                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                  height: 300.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              );
                                                                                                            } else {
                                                                                                              return FlutterFlowMediaDisplay(
                                                                                                                path: valueOrDefault<String>(
                                                                                                                  stackImagesRecord?.video,
                                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                                ),
                                                                                                                imageBuilder: (path) => ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.network(
                                                                                                                    path,
                                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                    height: 300.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                                                  path: path,
                                                                                                                  width: 300.0,
                                                                                                                  autoPlay: true,
                                                                                                                  looping: true,
                                                                                                                  showControls: true,
                                                                                                                  allowFullScreen: true,
                                                                                                                  allowPlaybackSpeedMenu: false,
                                                                                                                ),
                                                                                                              );
                                                                                                            }
                                                                                                          },
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                              child: Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).accent3,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          color: Colors.white,
                                                                                                          child: ExpandableNotifier(
                                                                                                            controller: _model.expandableController2,
                                                                                                            child: ExpandablePanel(
                                                                                                              header: Text(
                                                                                                                establishmenDetailsEstablishmentsRecord.name,
                                                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                              ),
                                                                                                              collapsed: Container(
                                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 8.0),
                                                                                                                  child: Text(
                                                                                                                    establishmenDetailsEstablishmentsRecord.description.maybeHandleOverflow(
                                                                                                                      maxChars: 40,
                                                                                                                      replacement: '…',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                                                          fontWeight: FontWeight.w300,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              expanded: Container(
                                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Text(
                                                                                                                        establishmenDetailsEstablishmentsRecord.description,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              color: const Color(0x8A000000),
                                                                                                                              fontWeight: FontWeight.w300,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              theme: const ExpandableThemeData(
                                                                                                                tapHeaderToExpand: true,
                                                                                                                tapBodyToExpand: false,
                                                                                                                tapBodyToCollapse: false,
                                                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                hasIcon: true,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                ),
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  height: 120.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    shape: BoxShape.rectangle,
                                                                                                                    border: Border.all(
                                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsets.all(4.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            'Style établissement',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        ListView(
                                                                                                                          padding: EdgeInsets.zero,
                                                                                                                          shrinkWrap: true,
                                                                                                                          scrollDirection: Axis.vertical,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                                              child: Text(
                                                                                                                                establishmenDetailsEstablishmentsRecord.type.first,
                                                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  height: 120.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    shape: BoxShape.rectangle,
                                                                                                                    border: Border.all(
                                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsets.all(4.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                          child: Text(
                                                                                                                            'Style musical',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        ListView(
                                                                                                                          padding: EdgeInsets.zero,
                                                                                                                          shrinkWrap: true,
                                                                                                                          scrollDirection: Axis.vertical,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                                              child: Text(
                                                                                                                                establishmenDetailsEstablishmentsRecord.musicStyle.first,
                                                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: 320.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Détails',
                                                                                                            style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Réservation',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (establishmenDetailsEstablishmentsRecord.reservation == false)
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                child: Icon(
                                                                                                                  Icons.close,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                  size: 27.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (establishmenDetailsEstablishmentsRecord.reservation == true)
                                                                                                              Icon(
                                                                                                                Icons.done_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 27.0,
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Terrasse',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (establishmenDetailsEstablishmentsRecord.terrasse == false)
                                                                                                              Icon(
                                                                                                                Icons.close,
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                size: 27.0,
                                                                                                              ),
                                                                                                            if (establishmenDetailsEstablishmentsRecord.terrasse == true)
                                                                                                              Icon(
                                                                                                                Icons.done_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 27.0,
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Machine à cigarette ',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (establishmenDetailsEstablishmentsRecord.cigaretteMachine == false)
                                                                                                              Icon(
                                                                                                                Icons.close,
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                size: 27.0,
                                                                                                              ),
                                                                                                            if (establishmenDetailsEstablishmentsRecord.cigaretteMachine == true)
                                                                                                              Icon(
                                                                                                                Icons.done_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 27.0,
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                    ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Nourriture',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            flex: 1,
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Align(
                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Builder(
                                                                                                                      builder: (context) {
                                                                                                                        final foodList = establishmenDetailsEstablishmentsRecord.food.toList().take(2).toList();
                                                                                                                        return SingleChildScrollView(
                                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                            children: List.generate(foodList.length, (foodListIndex) {
                                                                                                                              final foodListItem = foodList[foodListIndex];
                                                                                                                              return Align(
                                                                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  foodListItem,
                                                                                                                                  textAlign: TextAlign.end,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                                                                        fontWeight: FontWeight.w300,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }).divide(const SizedBox(width: 5.0)),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    if (establishmenDetailsEstablishmentsRecord.food.isEmpty)
                                                                                                                      Icon(
                                                                                                                        Icons.close,
                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                        size: 27.0,
                                                                                                                      ),
                                                                                                                    if (establishmenDetailsEstablishmentsRecord.food.isNotEmpty)
                                                                                                                      Icon(
                                                                                                                        Icons.done_rounded,
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 27.0,
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ].divide(const SizedBox(width: 15.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Spécialité',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 300.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Align(
                                                                                                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        establishmenDetailsEstablishmentsRecord.speciality,
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                                                                              fontWeight: FontWeight.w300,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                if (establishmenDetailsEstablishmentsRecord.speciality == '')
                                                                                                                  Icon(
                                                                                                                    Icons.close,
                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                    size: 27.0,
                                                                                                                  ),
                                                                                                                if (establishmenDetailsEstablishmentsRecord.speciality != '')
                                                                                                                  Icon(
                                                                                                                    Icons.done_rounded,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 27.0,
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ].divide(const SizedBox(width: 15.0)),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                    ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Jeux',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Align(
                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Builder(
                                                                                                                      builder: (context) {
                                                                                                                        final gamesList = establishmenDetailsEstablishmentsRecord.game.toList().take(2).toList();
                                                                                                                        return SingleChildScrollView(
                                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                            children: List.generate(gamesList.length, (gamesListIndex) {
                                                                                                                              final gamesListItem = gamesList[gamesListIndex];
                                                                                                                              return Align(
                                                                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  gamesListItem,
                                                                                                                                  textAlign: TextAlign.end,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                                                                        fontWeight: FontWeight.w300,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }).divide(const SizedBox(width: 5.0)),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    if (establishmenDetailsEstablishmentsRecord.game.isEmpty)
                                                                                                                      Icon(
                                                                                                                        Icons.close,
                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                        size: 27.0,
                                                                                                                      ),
                                                                                                                    if (establishmenDetailsEstablishmentsRecord.game.isNotEmpty)
                                                                                                                      Icon(
                                                                                                                        Icons.done_rounded,
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 27.0,
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ].divide(const SizedBox(width: 15.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            StreamBuilder<List<ScheduleRecord>>(
                                                                                              stream: queryScheduleRecord(
                                                                                                parent: establishmenDetailsEstablishmentsRecord.reference,
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
                                                                                                List<ScheduleRecord> scheduleScheduleRecordList = snapshot.data!;
                                                                                                // Return an empty Container when the item does not exist.
                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                  return Container();
                                                                                                }
                                                                                                final scheduleScheduleRecord = scheduleScheduleRecordList.isNotEmpty ? scheduleScheduleRecordList.first : null;
                                                                                                return Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).accent3,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Horaires',
                                                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Lundi',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                scheduleScheduleRecord?.mondayIsClose == true ? 'Fermé' : '${scheduleScheduleRecord?.mondayOpening}-${scheduleScheduleRecord?.mondayClosing}',
                                                                                                                'Aucun horaire',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 1.0,
                                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Mardi',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                scheduleScheduleRecord?.tuesdayIsClose == true ? 'Fermé' : '${scheduleScheduleRecord?.tuesdayOpening}-${scheduleScheduleRecord?.tuesdayClosing}',
                                                                                                                'Aucun horaire',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 1.0,
                                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Mercredi',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                scheduleScheduleRecord?.wednesdayIsClose == true ? 'Fermé' : '${scheduleScheduleRecord?.wednesdayOpening}-${scheduleScheduleRecord?.wednesdayClosing}',
                                                                                                                'Aucun horaire',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 1.0,
                                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Jeudi',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                scheduleScheduleRecord?.thursdayIsClose == true ? 'Fermé' : '${scheduleScheduleRecord?.thursdayOpening}-${scheduleScheduleRecord?.thursdayClosing}',
                                                                                                                'Aucun horaire',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 1.0,
                                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Vendredi',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                scheduleScheduleRecord?.fridayIsClose == true ? 'Fermé' : '${scheduleScheduleRecord?.fridayOpening}-${scheduleScheduleRecord?.fridayClosing}',
                                                                                                                'Aucun horaire',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 1.0,
                                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Samedi',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                scheduleScheduleRecord?.saturdayIsClose == true ? 'Fermé' : '${scheduleScheduleRecord?.saturdayOpening}-${scheduleScheduleRecord?.saturdayClosing}',
                                                                                                                'Aucun horaire',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 1.0,
                                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Dimanche',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                scheduleScheduleRecord?.sundayIsClose == true ? 'Fermé' : '${scheduleScheduleRecord?.sundayOpening}-${scheduleScheduleRecord?.sundayClosing}',
                                                                                                                'Aucun horaire',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Contact',
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (establishmenDetailsEstablishmentsRecord.email != '')
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Email',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                              ),
                                                                                                              SelectionArea(
                                                                                                                  child: Text(
                                                                                                                establishmenDetailsEstablishmentsRecord.email,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                              )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    if (establishmenDetailsEstablishmentsRecord.phoneNumber != '')
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Telephone',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                              ),
                                                                                                              SelectionArea(
                                                                                                                  child: Text(
                                                                                                                establishmenDetailsEstablishmentsRecord.phoneNumber,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                              )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    if (establishmenDetailsEstablishmentsRecord.webSite != '')
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Site Web ',
                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                ),
                                                                                                                SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  establishmenDetailsEstablishmentsRecord.webSite,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                )),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(const SizedBox(width: 10.0)),
                                                                                                      ),
                                                                                                  ].divide(const SizedBox(height: 16.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Adresse',
                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Align(
                                                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: SelectionArea(
                                                                                                                  child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  '${establishmenDetailsEstablishmentsRecord.adresse.street}, ${establishmenDetailsEstablishmentsRecord.adresse.zipCode}, ${establishmenDetailsEstablishmentsRecord.adresse.city}',
                                                                                                                  'Aucune adresse ',
                                                                                                                ),
                                                                                                                textAlign: TextAlign.start,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                              )),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(const SizedBox(width: 15.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(height: 15.0)).addToEnd(const SizedBox(height: 35.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].addToStart(const SizedBox(height: 5.0)),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (valueOrDefault<bool>(
                              currentUserDocument?.managerRole, false) ==
                          false) {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
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
                                'Vous n\'etes pas un manager !',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 30.0)),
                          ),
                        );
                      } else {
                        return Visibility(
                          visible: responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                            desktop: false,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
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
                                  'Cette fenêtre est uniquement visible sur ordinateur !',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                ),
                              ].divide(const SizedBox(height: 30.0)),
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
