import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_navigation_widget.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'show_of_events_model.dart';
export 'show_of_events_model.dart';

class ShowOfEventsWidget extends StatefulWidget {
  const ShowOfEventsWidget({
    super.key,
    required this.showOfEvents,
  });

  final DocumentReference? showOfEvents;

  @override
  State<ShowOfEventsWidget> createState() => _ShowOfEventsWidgetState();
}

class _ShowOfEventsWidgetState extends State<ShowOfEventsWidget> {
  late ShowOfEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowOfEventsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ShowOfEvents'});
    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EventsRecord>(
      stream: EventsRecord.getDocument(widget.showOfEvents!),
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
        final showOfEventsEventsRecord = snapshot.data!;
        return Title(
            title: 'ShowOfEvents',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                resizeToAvoidBottomInset: false,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
                        wrapWithModel(
                          model: _model.sideNavWebModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: const SideNavWebWidget(
                            nav1: false,
                            nav2: true,
                            nav3: false,
                          ),
                        ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.98, -0.9),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.arrow_back_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary400,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SHOW_OF_EVENTS_arrow_back_rounded_ICN_ON');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              desktop: false,
                            ))
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<EstablishmentsRecord>(
                                    stream: EstablishmentsRecord.getDocument(
                                        showOfEventsEventsRecord
                                            .establishmentId!),
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
                                      final stackEstablishmentsRecord =
                                          snapshot.data!;
                                      return Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  StreamBuilder<
                                                      List<MediaRecord>>(
                                                    stream: queryMediaRecord(
                                                      parent:
                                                          widget.showOfEvents,
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
                                                      List<MediaRecord>
                                                          imagesEventMediaRecordList =
                                                          snapshot.data!;
                                                      final imagesEventMediaRecord =
                                                          imagesEventMediaRecordList
                                                                  .isNotEmpty
                                                              ? imagesEventMediaRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: double.infinity,
                                                        height: 300.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                          ),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  imagesEventMediaRecord
                                                                      ?.image,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                ),
                                                                width: double
                                                                    .infinity,
                                                                height: 300.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.05,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0x0010212E),
                                                                      Color(
                                                                          0x3E10212E)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -0.98,
                                                                      -0.9),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .backNavigationModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    const BackNavigationWidget(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(15.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    showOfEventsEventsRecord
                                                                        .title,
                                                                    'Inconnu',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  ScheduleEventRecord>>(
                                                            stream:
                                                                queryScheduleEventRecord(
                                                              parent: widget
                                                                  .showOfEvents,
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              List<ScheduleEventRecord>
                                                                  rowScheduleScheduleEventRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final rowScheduleScheduleEventRecord =
                                                                  rowScheduleScheduleEventRecordList
                                                                          .isNotEmpty
                                                                      ? rowScheduleScheduleEventRecordList
                                                                          .first
                                                                      : null;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        '${dateTimeFormat(
                                                                          'MMMEd',
                                                                          rowScheduleScheduleEventRecord
                                                                              ?.date,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}  de  ${dateTimeFormat(
                                                                          'Hm',
                                                                          rowScheduleScheduleEventRecord
                                                                              ?.scheduleStart,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )} - ${dateTimeFormat(
                                                                          'Hm',
                                                                          rowScheduleScheduleEventRecord
                                                                              ?.scheduleEnd,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        'Aucun horaire',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall,
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  ExpandableNotifier(
                                                                controller: _model
                                                                    .expandableController1,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header:
                                                                      AutoSizeText(
                                                                    'Description:',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                  collapsed:
                                                                      Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                  ),
                                                                  expanded: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          showOfEventsEventsRecord
                                                                              .description,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  theme:
                                                                      const ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        false,
                                                                    tapBodyToCollapse:
                                                                        false,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Style musical',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .circle_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            6.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        showOfEventsEventsRecord
                                                                            .musicSytle
                                                                            .first,
                                                                        'Inconnu',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            showOfEventsEventsRecord.entrancePrice != ''
                                                                                ? '${showOfEventsEventsRecord.entrancePrice}.-'
                                                                                : 'Gratuit',
                                                                            'Prix inconnu',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 2.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<
                                                          PromotionEventRecord>>(
                                                    stream:
                                                        queryPromotionEventRecord(
                                                      parent:
                                                          widget.showOfEvents,
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
                                                      List<PromotionEventRecord>
                                                          promotionIsMobilePromotionEventRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final promotionIsMobilePromotionEventRecord =
                                                          promotionIsMobilePromotionEventRecordList
                                                                  .isNotEmpty
                                                              ? promotionIsMobilePromotionEventRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  15.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.95,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            9.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    AutoSizeText(
                                                                                      'Entrée gratuite \"Sponsorisé par le festival LaBelleNuit\"',
                                                                                      maxLines: 2,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      minFontSize: 10.0,
                                                                                    ),
                                                                                    AutoSizeText(
                                                                                      'Détails de l\'offre dans l\'email',
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontWeight: FontWeight.w300,
                                                                                          ),
                                                                                      minFontSize: 8.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  if (valueOrDefault<bool>(
                                                                                    promotionIsMobilePromotionEventRecord?.entranceCheck == false,
                                                                                    true,
                                                                                  )) {
                                                                                    return FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('SHOW_OF_EVENTS_J\'EN_PROFITE_BTN_ON_TAP');
                                                                                        var shouldSetState = false;
                                                                                        final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                        try {
                                                                                          if (loggedIn) {
                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                            firestoreBatch.update(promotionIsMobilePromotionEventRecord!.reference, {
                                                                                              ...createPromotionEventRecordData(
                                                                                                userRef: currentUserReference,
                                                                                                entranceCheck: true,
                                                                                              ),
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'usersJoined': FieldValue.arrayUnion([
                                                                                                    currentUserReference
                                                                                                  ]),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                            firestoreBatch.update(promotionIsMobilePromotionEventRecord.reference, {
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'entranceValue': FieldValue.increment(valueOrDefault<double>(
                                                                                                    functions.sumEntrancePromotionValue(promotionIsMobilePromotionEventRecord.entranceValue >= 0.01 ? 0.01 : null),
                                                                                                    0.0,
                                                                                                  )),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                            firestoreBatch.update(currentUserReference!, {
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'promotionEvents': FieldValue.arrayUnion([
                                                                                                    promotionIsMobilePromotionEventRecord.reference
                                                                                                  ]),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                            _model.sendingEmailPromotion = await SendGridAPIGroup.sendEmailCall.call(
                                                                                              receiverEmail: currentUserEmail,
                                                                                              subjectEmail: valueOrDefault<String>(
                                                                                                'Hango - ${promotionIsMobilePromotionEventRecord.title} - ${valueOrDefault<String>(
                                                                                                  dateTimeFormat(
                                                                                                    'd/M H:mm',
                                                                                                    showOfEventsEventsRecord.dateEvent,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ),
                                                                                                  'Ca sera ajoute !',
                                                                                                )}',
                                                                                                'HANGO Promotion',
                                                                                              ),
                                                                                              bodyEmail: functions.textFormat(
                                                                                                  valueOrDefault<String>(
                                                                                                    currentUserDisplayName,
                                                                                                    'User Name',
                                                                                                  ),
                                                                                                  promotionIsMobilePromotionEventRecord.title,
                                                                                                  promotionIsMobilePromotionEventRecord.subTitle,
                                                                                                  promotionIsMobilePromotionEventRecord.message != '' ? promotionIsMobilePromotionEventRecord.message : '',
                                                                                                  currentUserDocument?.birthday,
                                                                                                  stackEstablishmentsRecord.name != '' ? stackEstablishmentsRecord.name : '',
                                                                                                  showOfEventsEventsRecord.title != '' ? showOfEventsEventsRecord.title : '',
                                                                                                  showOfEventsEventsRecord.dateEvent),
                                                                                            );
                                                                                            shouldSetState = true;
                                                                                            if ((_model.sendingEmailPromotion?.succeeded ?? true)) {
                                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'L\'email a été envoyé, veuillez vérifier votre boite d\'email !',
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        ),
                                                                                                  ),
                                                                                                  duration: const Duration(milliseconds: 1800),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'Il y a une erreure !',
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        ),
                                                                                                  ),
                                                                                                  duration: const Duration(milliseconds: 1800),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              );
                                                                                              if (shouldSetState) setState(() {});
                                                                                              return;
                                                                                            }
                                                                                          } else {
                                                                                            logFirebaseEvent('Button_navigate_to');

                                                                                            context.pushNamed('UserSignUp');
                                                                                          }
                                                                                        } finally {
                                                                                          await firestoreBatch.commit();
                                                                                        }

                                                                                        if (shouldSetState) setState(() {});
                                                                                      },
                                                                                      text: 'J\'en profite',
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return Card(
                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                      color: FlutterFlowTheme.of(context).accent3,
                                                                                      elevation: 2.0,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(10.0),
                                                                                        child: Text(
                                                                                          'Offre utilisée',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ].divide(const SizedBox(width: 15.0)),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                LinearPercentIndicator(
                                                                              percent: valueOrDefault<double>(
                                                                                promotionIsMobilePromotionEventRecord?.entranceValue,
                                                                                0.0,
                                                                              ),
                                                                              lineHeight: 14.0,
                                                                              animation: true,
                                                                              animateFromLastPercent: true,
                                                                              progressColor: FlutterFlowTheme.of(context).primary,
                                                                              backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                              barRadius: const Radius.circular(300.0),
                                                                              padding: EdgeInsets.zero,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    functions.getPourcentageValue(functions.getDecimalNumber(promotionIsMobilePromotionEventRecord?.entranceValue)?.toDouble())!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                        ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      'de l\'offre restante !',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontWeight: FontWeight.w300,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                            FlutterFlowTimer(
                                                                              initialTime: valueOrDefault<int>(
                                                                                (dateTimeFormat(
                                                                                                  '00:00',
                                                                                                  promotionIsMobilePromotionEventRecord?.trackTime,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ) !=
                                                                                                ''
                                                                                        ? promotionIsMobilePromotionEventRecord?.trackTime
                                                                                        : null)
                                                                                    ?.secondsSinceEpoch,
                                                                                0,
                                                                              ),
                                                                              getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                                                                                value,
                                                                                hours: false,
                                                                                milliSecond: false,
                                                                              ),
                                                                              controller: _model.timerController1,
                                                                              updateStateInterval: const Duration(milliseconds: 1000),
                                                                              onChanged: (value, displayTime, shouldUpdate) {
                                                                                _model.timerMilliseconds1 = value;
                                                                                _model.timerValue1 = displayTime;
                                                                                if (shouldUpdate) setState(() {});
                                                                              },
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                            ),
                                                                          ].divide(const SizedBox(width: 15.0)),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              height: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  StreamBuilder<
                                                      List<ArtistsRecord>>(
                                                    stream: queryArtistsRecord(
                                                      parent:
                                                          widget.showOfEvents,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<ArtistsRecord>
                                                          artistsArtistsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              artistsArtistsRecordList
                                                                      .length !=
                                                                  null,
                                                          child: StreamBuilder<
                                                              List<
                                                                  ArtistsRecord>>(
                                                            stream:
                                                                queryArtistsRecord(
                                                              parent: widget
                                                                  .showOfEvents,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              List<ArtistsRecord>
                                                                  containerProgramationArtistsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent3,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Programation',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleMedium,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final listArtists =
                                                                                containerProgramationArtistsRecordList.toList();
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: List.generate(listArtists.length, (listArtistsIndex) {
                                                                                final listArtistsItem = listArtists[listArtistsIndex];
                                                                                return Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.person_sharp,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            listArtistsItem.name.maybeHandleOverflow(
                                                                                              maxChars: 30,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat(
                                                                                            'Hm',
                                                                                            listArtistsItem.scheduleStart!,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  if (showOfEventsEventsRecord
                                                          .establishmentId !=
                                                      null)
                                                    StreamBuilder<
                                                        EstablishmentsRecord>(
                                                      stream: EstablishmentsRecord
                                                          .getDocument(
                                                              showOfEventsEventsRecord
                                                                  .establishmentId!),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        final containerEstablishmentEstablishmentsRecord =
                                                            snapshot.data!;
                                                        return Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 0.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'L\'événement se passe ici :',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.05),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SHOW_OF_EVENTS_CardEstablishment_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'CardEstablishment_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'ShowOfEstablishment',
                                                                        queryParameters:
                                                                            {
                                                                          'estRef':
                                                                              serializeParam(
                                                                            containerEstablishmentEstablishmentsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'estRef':
                                                                              containerEstablishmentEstablishmentsRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<ImagesRecord>>(
                                                                            stream:
                                                                                queryImagesRecord(
                                                                              parent: containerEstablishmentEstablishmentsRecord.reference,
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
                                                                              List<ImagesRecord> cardImageEstablishmentImagesRecordList = snapshot.data!;
                                                                              final cardImageEstablishmentImagesRecord = cardImageEstablishmentImagesRecordList.isNotEmpty ? cardImageEstablishmentImagesRecordList.first : null;
                                                                              return Image.network(
                                                                                valueOrDefault<String>(
                                                                                  cardImageEstablishmentImagesRecord?.image1,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                ),
                                                                                width: double.infinity,
                                                                                height: 220.0,
                                                                                fit: BoxFit.cover,
                                                                              );
                                                                            },
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                              child: Text(
                                                                                                containerEstablishmentEstablishmentsRecord.name,
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                            child: StreamBuilder<List<ScheduleRecord>>(
                                                                                              stream: queryScheduleRecord(
                                                                                                parent: containerEstablishmentEstablishmentsRecord.reference,
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
                                                                                                List<ScheduleRecord> rowMusicStyleScheduleRecordList = snapshot.data!;
                                                                                                final rowMusicStyleScheduleRecord = rowMusicStyleScheduleRecordList.isNotEmpty ? rowMusicStyleScheduleRecordList.first : null;
                                                                                                return SingleChildScrollView(
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Style musical',
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              fontSize: 14.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                        child: Icon(
                                                                                                          Icons.circle_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 6.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerEstablishmentEstablishmentsRecord.musicStyle.first,
                                                                                                          '*',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              fontSize: 14.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Type',
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 14.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.circle_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 6.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  containerEstablishmentEstablishmentsRecord.type.first,
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 14.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              containerEstablishmentEstablishmentsRecord.adresse.city,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].addToStart(const SizedBox(height: 10.0)).addToEnd(const SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
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
                                                        );
                                                      },
                                                    ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(15.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Contact',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          if (stackEstablishmentsRecord
                                                                      .email !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Email',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                      AutoSizeText(
                                                                        stackEstablishmentsRecord
                                                                            .email,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    borderRadius:
                                                                        40.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor:
                                                                        const Color(
                                                                            0x2E39D2C0),
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .email,
                                                                      color: Color(
                                                                          0xFF57CFAD),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SHOW_OF_EVENTS_PAGE_email_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_send_email');
                                                                      await launchUrl(Uri(
                                                                          scheme: 'mailto',
                                                                          path: stackEstablishmentsRecord.email,
                                                                          query: {
                                                                            'subject':
                                                                                'Hango - réservation  - ${showOfEventsEventsRecord.title}',
                                                                            'body':
                                                                                'L\'équipe Hango et  l\'équipe ${showOfEventsEventsRecord.description} te remercient de procéder à une réservation de table via email. Tu peux également nous faire parvenir un retour constructif si ta soirée c\'est bien passée ou peut-être suite à un problème !',
                                                                          }.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')));
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (stackEstablishmentsRecord
                                                                      .phoneNumber !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Téléphone',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                      AutoSizeText(
                                                                        stackEstablishmentsRecord
                                                                            .phoneNumber,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    borderRadius:
                                                                        40.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor:
                                                                        const Color(
                                                                            0x2E39D2C0),
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: Color(
                                                                          0xFF57CFAD),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SHOW_OF_EVENTS_PAGE_phone_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_call_number');
                                                                      await launchUrl(
                                                                          Uri(
                                                                        scheme:
                                                                            'tel',
                                                                        path: stackEstablishmentsRecord
                                                                            .phoneNumber,
                                                                      ));
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (stackEstablishmentsRecord
                                                                      .webSite !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Site Web ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.7,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            AutoSizeText(
                                                                          stackEstablishmentsRecord
                                                                              .webSite,
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    borderRadius:
                                                                        40.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor:
                                                                        const Color(
                                                                            0x2E39D2C0),
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .link_sharp,
                                                                      color: Color(
                                                                          0xFF57CFAD),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SHOW_OF_EVENTS_link_sharp_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_launch_u_r_l');
                                                                      await launchURL(
                                                                          showOfEventsEventsRecord
                                                                              .siteWeb);
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(15.0),
                                                      child: StreamBuilder<
                                                          EstablishmentsRecord>(
                                                        stream: EstablishmentsRecord
                                                            .getDocument(
                                                                showOfEventsEventsRecord
                                                                    .establishmentId!),
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
                                                          final columnEstablishmentsRecord =
                                                              snapshot.data!;
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Adresse',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child: SelectionArea(
                                                                            child: Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            columnEstablishmentsRecord.adresse.street,
                                                                            'Aucune adresse ',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                        )),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      fillColor:
                                                                          const Color(
                                                                              0x2E39D2C0),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .content_copy,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SHOW_OF_EVENTS_content_copy_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_copy_to_clipboard');
                                                                        await Clipboard.setData(ClipboardData(
                                                                            text:
                                                                                '${columnEstablishmentsRecord.adresse.street}${columnEstablishmentsRecord.adresse.zipCode} ${columnEstablishmentsRecord.adresse.city}'));
                                                                      },
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          15.0)),
                                                                ),
                                                              ),
                                                              if (columnEstablishmentsRecord
                                                                      .location !=
                                                                  null)
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        150.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child: Builder(
                                                                        builder:
                                                                            (context) {
                                                                      final googleMapMarker =
                                                                          columnEstablishmentsRecord
                                                                              .location;
                                                                      return FlutterFlowGoogleMap(
                                                                        controller:
                                                                            _model.googleMapsController1,
                                                                        onCameraIdle:
                                                                            (latLng) =>
                                                                                _model.googleMapsCenter1 = latLng,
                                                                        initialLocation:
                                                                            _model.googleMapsCenter1 ??=
                                                                                columnEstablishmentsRecord.location!,
                                                                        markers: [
                                                                          if (googleMapMarker !=
                                                                              null)
                                                                            FlutterFlowMarker(
                                                                              googleMapMarker.serialize(),
                                                                              googleMapMarker,
                                                                            ),
                                                                        ],
                                                                        markerColor:
                                                                            GoogleMarkerColor.red,
                                                                        mapType:
                                                                            MapType.normal,
                                                                        style: GoogleMapStyle
                                                                            .standard,
                                                                        initialZoom:
                                                                            14.0,
                                                                        allowInteraction:
                                                                            true,
                                                                        allowZoom:
                                                                            true,
                                                                        showZoomControls:
                                                                            true,
                                                                        showLocation:
                                                                            true,
                                                                        showCompass:
                                                                            false,
                                                                        showMapToolbar:
                                                                            false,
                                                                        showTraffic:
                                                                            false,
                                                                        centerMapOnMarkerTap:
                                                                            true,
                                                                      );
                                                                    }),
                                                                  ),
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  if (showOfEventsEventsRecord
                                                          .dateEvent! >=
                                                      getCurrentTimestamp)
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Autres événements à venir',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
                                                            ),
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  EventsRecord>>(
                                                            stream:
                                                                queryEventsRecord(
                                                              queryBuilder: (eventsRecord) =>
                                                                  eventsRecord
                                                                      .where(
                                                                        'dateEvent',
                                                                        isGreaterThanOrEqualTo:
                                                                            getCurrentTimestamp,
                                                                      )
                                                                      .orderBy(
                                                                          'dateEvent'),
                                                              limit: 8,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              List<EventsRecord>
                                                                  otherEventsListEventsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: List.generate(
                                                                      otherEventsListEventsRecordList
                                                                          .length,
                                                                      (otherEventsListIndex) {
                                                                    final otherEventsListEventsRecord =
                                                                        otherEventsListEventsRecordList[
                                                                            otherEventsListIndex];
                                                                    return StreamBuilder<
                                                                        EstablishmentsRecord>(
                                                                      stream: EstablishmentsRecord.getDocument(
                                                                          otherEventsListEventsRecord
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
                                                                        final cardEstablishmentEstablishmentsRecord =
                                                                            snapshot.data!;
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SHOW_OF_EVENTS_CardEstablishment_ON_TAP');
                                                                            logFirebaseEvent('CardEstablishment_navigate_to');

                                                                            context.pushNamed(
                                                                              'ShowOfEvents',
                                                                              queryParameters: {
                                                                                'showOfEvents': serializeParam(
                                                                                  otherEventsListEventsRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.4,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.27,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                StreamBuilder<List<MediaRecord>>(
                                                                                  stream: queryMediaRecord(
                                                                                    parent: otherEventsListEventsRecord.reference,
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
                                                                                    List<MediaRecord> imageContainerMediaRecordList = snapshot.data!;
                                                                                    final imageContainerMediaRecord = imageContainerMediaRecordList.isNotEmpty ? imageContainerMediaRecordList.first : null;
                                                                                    return Container(
                                                                                      height: MediaQuery.sizeOf(context).height * 0.17,
                                                                                      decoration: const BoxDecoration(
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                          bottomRight: Radius.circular(0.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                          bottomRight: Radius.circular(0.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            imageContainerMediaRecord?.image,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          ),
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        otherEventsListEventsRecord.title.maybeHandleOverflow(
                                                                                          maxChars: 18,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      StreamBuilder<List<ScheduleEventRecord>>(
                                                                                        stream: queryScheduleEventRecord(
                                                                                          parent: otherEventsListEventsRecord.reference,
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
                                                                                          List<ScheduleEventRecord> dateScheduleEventRecordList = snapshot.data!;
                                                                                          final dateScheduleEventRecord = dateScheduleEventRecordList.isNotEmpty ? dateScheduleEventRecordList.first : null;
                                                                                          return Text(
                                                                                            valueOrDefault<String>(
                                                                                              dateTimeFormat(
                                                                                                'MMMEd',
                                                                                                dateScheduleEventRecord?.date,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              'Aucun horaire',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              cardEstablishmentEstablishmentsRecord.name,
                                                                                              textAlign: TextAlign.end,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].divide(const SizedBox(height: 3.0)).addToStart(const SizedBox(height: 3.0)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }).divide(
                                                                      const SizedBox(
                                                                          width:
                                                                              5.0)),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ].divide(
                                                    const SizedBox(height: 15.0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: StreamBuilder<EstablishmentsRecord>(
                                      stream: EstablishmentsRecord.getDocument(
                                          showOfEventsEventsRecord
                                              .establishmentId!),
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
                                        final mainColumnEstablishmentsRecord =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: StreamBuilder<
                                                    List<MediaRecord>>(
                                                  stream: queryMediaRecord(
                                                    parent: widget.showOfEvents,
                                                    singleRecord: true,
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
                                                    List<MediaRecord>
                                                        imagesEventMediaRecordList =
                                                        snapshot.data!;
                                                    final imagesEventMediaRecord =
                                                        imagesEventMediaRecordList
                                                                .isNotEmpty
                                                            ? imagesEventMediaRecordList
                                                                .first
                                                            : null;
                                                    return Material(
                                                      color: Colors.transparent,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 300.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                          ),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: 300.0,
                                                              child: Stack(
                                                                children: [
                                                                  PageView(
                                                                    controller: _model
                                                                            .pageViewController ??=
                                                                        PageController(
                                                                            initialPage:
                                                                                0),
                                                                    onPageChanged: (_) =>
                                                                        setState(
                                                                            () {}),
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            imagesEventMediaRecord?.image,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                          ),
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            300.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            FlutterFlowVideoPlayer(
                                                                          path:
                                                                              valueOrDefault<String>(
                                                                            imagesEventMediaRecord?.video,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                          ),
                                                                          videoType:
                                                                              VideoType.network,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              300.0,
                                                                          autoPlay:
                                                                              true,
                                                                          looping:
                                                                              true,
                                                                          showControls:
                                                                              true,
                                                                          allowFullScreen:
                                                                              true,
                                                                          allowPlaybackSpeedMenu:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child: smooth_page_indicator
                                                                          .SmoothPageIndicator(
                                                                        controller:
                                                                            _model.pageViewController ??=
                                                                                PageController(initialPage: 0),
                                                                        count:
                                                                            2,
                                                                        axisDirection:
                                                                            Axis.horizontal,
                                                                        onDotClicked:
                                                                            (i) async {
                                                                          await _model
                                                                              .pageViewController!
                                                                              .animateToPage(
                                                                            i,
                                                                            duration:
                                                                                const Duration(milliseconds: 500),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                        },
                                                                        effect:
                                                                            smooth_page_indicator.ExpandingDotsEffect(
                                                                          expansionFactor:
                                                                              3.0,
                                                                          spacing:
                                                                              8.0,
                                                                          radius:
                                                                              16.0,
                                                                          dotWidth:
                                                                              16.0,
                                                                          dotHeight:
                                                                              8.0,
                                                                          dotColor:
                                                                              FlutterFlowTheme.of(context).primaryTransparent,
                                                                          activeDotColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          paintStyle:
                                                                              PaintingStyle.fill,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.05,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0x0010212E),
                                                                      Color(
                                                                          0x3E10212E)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.98,
                                                                      0.9),
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .share_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary400,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SHOW_OF_EVENTS_share_sharp_ICN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconButton_generate_current_page_link');
                                                                    _model.currentPageLink =
                                                                        await generateCurrentPageLink(
                                                                      context,
                                                                      title: showOfEventsEventsRecord
                                                                          .title,
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        imagesEventMediaRecord
                                                                            ?.image,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                      ),
                                                                      description:
                                                                          showOfEventsEventsRecord
                                                                              .description,
                                                                      forceRedirect:
                                                                          true,
                                                                    );

                                                                    logFirebaseEvent(
                                                                        'IconButton_share');
                                                                    await Share
                                                                        .share(
                                                                      _model
                                                                          .currentPageLink,
                                                                      sharePositionOrigin:
                                                                          getWidgetBoundingBox(
                                                                              context),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(15.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                showOfEventsEventsRecord
                                                                    .title,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                ScheduleEventRecord>>(
                                                          stream:
                                                              queryScheduleEventRecord(
                                                            parent: widget
                                                                .showOfEvents,
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
                                                            List<ScheduleEventRecord>
                                                                rowScheduleScheduleEventRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final rowScheduleScheduleEventRecord =
                                                                rowScheduleScheduleEventRecordList
                                                                        .isNotEmpty
                                                                    ? rowScheduleScheduleEventRecordList
                                                                        .first
                                                                    : null;
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${dateTimeFormat(
                                                                        'MMMEd',
                                                                        rowScheduleScheduleEventRecord
                                                                            ?.date,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}  de  ${dateTimeFormat(
                                                                        'Hm',
                                                                        rowScheduleScheduleEventRecord
                                                                            ?.scheduleStart,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} - ${dateTimeFormat(
                                                                        'Hm',
                                                                        rowScheduleScheduleEventRecord
                                                                            ?.scheduleEnd,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}',
                                                                      'Aucun horaire',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            color: Colors.white,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableController2,
                                                              child:
                                                                  ExpandablePanel(
                                                                header:
                                                                    AutoSizeText(
                                                                  'Description:',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                ),
                                                                expanded: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        showOfEventsEventsRecord
                                                                            .description,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                theme:
                                                                    const ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Style musical',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .circle_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 6.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      showOfEventsEventsRecord
                                                                          .musicSytle
                                                                          .first,
                                                                      'Inconnu',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          showOfEventsEventsRecord.entrancePrice != ''
                                                                              ? '${showOfEventsEventsRecord.entrancePrice}.-'
                                                                              : 'Gratuit',
                                                                          'Prix inconnu',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 2.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<PromotionEventRecord>>(
                                                stream:
                                                    queryPromotionEventRecord(
                                                  parent: widget.showOfEvents,
                                                  singleRecord: true,
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
                                                  List<PromotionEventRecord>
                                                      promotionIsWebPromotionEventRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final promotionIsWebPromotionEventRecord =
                                                      promotionIsWebPromotionEventRecordList
                                                              .isNotEmpty
                                                          ? promotionIsWebPromotionEventRecordList
                                                              .first
                                                          : null;
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.58,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  AutoSizeText(
                                                                                    'Entrée gratuite \"Sponsorisé par le festival LaBelleNuit\"',
                                                                                    maxLines: 2,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    minFontSize: 10.0,
                                                                                  ),
                                                                                  AutoSizeText(
                                                                                    'Détails de l\'offre dans l\'email',
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                    minFontSize: 8.0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if (valueOrDefault<bool>(
                                                                                  promotionIsWebPromotionEventRecord?.entranceCheck == false,
                                                                                  true,
                                                                                )) {
                                                                                  return FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('SHOW_OF_EVENTS_J\'EN_PROFITE_BTN_ON_TAP');
                                                                                      var shouldSetState = false;
                                                                                      final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                      try {
                                                                                        if (loggedIn) {
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          firestoreBatch.update(promotionIsWebPromotionEventRecord!.reference, {
                                                                                            ...createPromotionEventRecordData(
                                                                                              userRef: currentUserReference,
                                                                                              entranceCheck: true,
                                                                                            ),
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'usersJoined': FieldValue.arrayUnion([
                                                                                                  currentUserReference
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          firestoreBatch.update(promotionIsWebPromotionEventRecord.reference, {
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'entranceValue': FieldValue.increment(valueOrDefault<double>(
                                                                                                  functions.sumEntrancePromotionValue(promotionIsWebPromotionEventRecord.entranceValue >= 0.01 ? 0.01 : null),
                                                                                                  0.0,
                                                                                                )),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          firestoreBatch.update(currentUserReference!, {
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'promotionEvents': FieldValue.arrayUnion([
                                                                                                  promotionIsWebPromotionEventRecord.reference
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                          _model.sendingEmailPromotionWeb = await SendGridAPIGroup.sendEmailCall.call(
                                                                                            receiverEmail: currentUserEmail,
                                                                                            subjectEmail: valueOrDefault<String>(
                                                                                              'Hango - ${promotionIsWebPromotionEventRecord.title} - ${valueOrDefault<String>(
                                                                                                dateTimeFormat(
                                                                                                  'd/M H:mm',
                                                                                                  showOfEventsEventsRecord.dateEvent,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                                'Ca sera ajoute !',
                                                                                              )}',
                                                                                              'HANGO Promotion',
                                                                                            ),
                                                                                            bodyEmail: functions.textFormat(
                                                                                                valueOrDefault<String>(
                                                                                                  currentUserDisplayName,
                                                                                                  'User Name',
                                                                                                ),
                                                                                                promotionIsWebPromotionEventRecord.title,
                                                                                                promotionIsWebPromotionEventRecord.subTitle,
                                                                                                dateTimeFormat(
                                                                                                              'd/M/y',
                                                                                                              currentUserDocument?.birthday,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            ) !=
                                                                                                            ''
                                                                                                    ? dateTimeFormat(
                                                                                                        'd/M/y',
                                                                                                        currentUserDocument?.birthday,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )
                                                                                                    : '',
                                                                                                currentUserDocument?.birthday,
                                                                                                mainColumnEstablishmentsRecord.name != '' ? mainColumnEstablishmentsRecord.name : '',
                                                                                                showOfEventsEventsRecord.title != '' ? showOfEventsEventsRecord.title : '',
                                                                                                showOfEventsEventsRecord.dateEvent),
                                                                                          );
                                                                                          shouldSetState = true;
                                                                                          if ((_model.sendingEmailPromotionWeb?.succeeded ?? true)) {
                                                                                            logFirebaseEvent('Button_show_snack_bar');
                                                                                            ScaffoldMessenger.of(context).clearSnackBars();
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  'L\'email a été envoyé, veuillez vérifier votre boite d\'email !',
                                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      ),
                                                                                                ),
                                                                                                duration: const Duration(milliseconds: 1800),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            );
                                                                                          } else {
                                                                                            logFirebaseEvent('Button_show_snack_bar');
                                                                                            ScaffoldMessenger.of(context).clearSnackBars();
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  'Il y a une erreure !',
                                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      ),
                                                                                                ),
                                                                                                duration: const Duration(milliseconds: 1800),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            );
                                                                                            if (shouldSetState) setState(() {});
                                                                                            return;
                                                                                          }
                                                                                        } else {
                                                                                          logFirebaseEvent('Button_navigate_to');

                                                                                          context.pushNamed('UserSignUp');
                                                                                        }
                                                                                      } finally {
                                                                                        await firestoreBatch.commit();
                                                                                      }

                                                                                      if (shouldSetState) setState(() {});
                                                                                    },
                                                                                    text: 'J\'en profite',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: const BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Card(
                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                    color: FlutterFlowTheme.of(context).accent3,
                                                                                    elevation: 2.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(10.0),
                                                                                      child: Text(
                                                                                        'Offre utilisée',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ].divide(const SizedBox(width: 15.0)),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.55,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              LinearPercentIndicator(
                                                                            percent:
                                                                                valueOrDefault<double>(
                                                                              promotionIsWebPromotionEventRecord?.entranceValue,
                                                                              0.0,
                                                                            ),
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.55,
                                                                            lineHeight:
                                                                                14.0,
                                                                            animation:
                                                                                true,
                                                                            animateFromLastPercent:
                                                                                true,
                                                                            progressColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                            barRadius:
                                                                                const Radius.circular(300.0),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  functions.getPourcentageValue(functions.getDecimalNumber(promotionIsWebPromotionEventRecord?.entranceValue)?.toDouble())!,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                      ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    'de l\'offre restante !',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                          FlutterFlowTimer(
                                                                            initialTime:
                                                                                valueOrDefault<int>(
                                                                              (dateTimeFormat(
                                                                                                '00:00',
                                                                                                promotionIsWebPromotionEventRecord?.trackTime,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ) !=
                                                                                              ''
                                                                                      ? promotionIsWebPromotionEventRecord?.trackTime
                                                                                      : null)
                                                                                  ?.secondsSinceEpoch,
                                                                              0,
                                                                            ),
                                                                            getDisplayTime: (value) =>
                                                                                StopWatchTimer.getDisplayTime(
                                                                              value,
                                                                              hours: false,
                                                                              milliSecond: false,
                                                                            ),
                                                                            controller:
                                                                                _model.timerController2,
                                                                            updateStateInterval:
                                                                                const Duration(milliseconds: 1000),
                                                                            onChanged: (value,
                                                                                displayTime,
                                                                                shouldUpdate) {
                                                                              _model.timerMilliseconds2 = value;
                                                                              _model.timerValue2 = displayTime;
                                                                              if (shouldUpdate) {
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 15.0)),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              StreamBuilder<
                                                  List<ArtistsRecord>>(
                                                stream: queryArtistsRecord(
                                                  parent: widget.showOfEvents,
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
                                                  List<ArtistsRecord>
                                                      containerProgramationArtistsRecordList =
                                                      snapshot.data!;
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Programation',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final listArtists =
                                                                        containerProgramationArtistsRecordList
                                                                            .toList();
                                                                    if (listArtists
                                                                        .isEmpty) {
                                                                      return EmptyListWidget(
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .music_note,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                        title:
                                                                            'Il n\'y a pas des artistes !',
                                                                        description:
                                                                            'Sera ajouté après !',
                                                                      );
                                                                    }
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          listArtists
                                                                              .length,
                                                                          (listArtistsIndex) {
                                                                        final listArtistsItem =
                                                                            listArtists[listArtistsIndex];
                                                                        return Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.person_sharp,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                  SelectionArea(
                                                                                      child: Text(
                                                                                    listArtistsItem.name.maybeHandleOverflow(maxChars: 30),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  )),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat(
                                                                                    'Hm',
                                                                                    listArtistsItem.scheduleStart!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              if (mainColumnEstablishmentsRecord
                                                          .description !=
                                                      '')
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Colors.white,
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableController3,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Text(
                                                                  'À propos',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      showOfEventsEventsRecord
                                                                          .description
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            40,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                expanded:
                                                                    Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      showOfEventsEventsRecord
                                                                          .description,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                  expandIcon: Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  iconSize:
                                                                      32.0,
                                                                  iconColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  iconPadding: const EdgeInsets
                                                                      .fromLTRB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              StreamBuilder<List<MediaRecord>>(
                                                stream: queryMediaRecord(
                                                  parent: widget.showOfEvents,
                                                  singleRecord: true,
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
                                                  List<MediaRecord>
                                                      containeShareMediaRecordList =
                                                      snapshot.data!;
                                                  final containeShareMediaRecord =
                                                      containeShareMediaRecordList
                                                              .isNotEmpty
                                                          ? containeShareMediaRecordList
                                                              .first
                                                          : null;
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Invite tes ami.e.s',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder: (context) =>
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                icon: Icon(
                                                                  Icons
                                                                      .share_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SHOW_OF_EVENTS_share_sharp_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_generate_current_page_link');
                                                                  _model.currentPageLink =
                                                                      await generateCurrentPageLink(
                                                                    context,
                                                                    title: showOfEventsEventsRecord
                                                                        .title,
                                                                    imageUrl:
                                                                        containeShareMediaRecord
                                                                            ?.image,
                                                                    description:
                                                                        showOfEventsEventsRecord
                                                                            .description,
                                                                  );

                                                                  logFirebaseEvent(
                                                                      'IconButton_share');
                                                                  await Share
                                                                      .share(
                                                                    _model
                                                                        .currentPageLink,
                                                                    sharePositionOrigin:
                                                                        getWidgetBoundingBox(
                                                                            context),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              if (showOfEventsEventsRecord
                                                      .establishmentId !=
                                                  null)
                                                StreamBuilder<
                                                    EstablishmentsRecord>(
                                                  stream: EstablishmentsRecord
                                                      .getDocument(
                                                          showOfEventsEventsRecord
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
                                                    final containerEstablishmentEstablishmentsRecord =
                                                        snapshot.data!;
                                                    return Material(
                                                      color: Colors.transparent,
                                                      elevation: 0.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'L\'event se passe ici :',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      0.05),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SHOW_OF_EVENTS_CardEstablishment_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'CardEstablishment_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'ShowOfEstablishment',
                                                                    queryParameters:
                                                                        {
                                                                      'estRef':
                                                                          serializeParam(
                                                                        containerEstablishmentEstablishmentsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'estRef':
                                                                          containerEstablishmentEstablishmentsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child: Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      StreamBuilder<
                                                                          List<
                                                                              ImagesRecord>>(
                                                                        stream:
                                                                            queryImagesRecord(
                                                                          parent:
                                                                              containerEstablishmentEstablishmentsRecord.reference,
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<ImagesRecord>
                                                                              cardImageEstablishmentImagesRecordList =
                                                                              snapshot.data!;
                                                                          final cardImageEstablishmentImagesRecord = cardImageEstablishmentImagesRecordList.isNotEmpty
                                                                              ? cardImageEstablishmentImagesRecordList.first
                                                                              : null;
                                                                          return Image
                                                                              .network(
                                                                            valueOrDefault<String>(
                                                                              cardImageEstablishmentImagesRecord?.image1,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                            ),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                220.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          );
                                                                        },
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                          child: Text(
                                                                                            containerEstablishmentEstablishmentsRecord.name,
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                        child: StreamBuilder<List<ScheduleRecord>>(
                                                                                          stream: queryScheduleRecord(
                                                                                            parent: containerEstablishmentEstablishmentsRecord.reference,
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
                                                                                            List<ScheduleRecord> rowMusicStyleScheduleRecordList = snapshot.data!;
                                                                                            final rowMusicStyleScheduleRecord = rowMusicStyleScheduleRecordList.isNotEmpty ? rowMusicStyleScheduleRecordList.first : null;
                                                                                            return SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Style musical',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 14.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                    child: Icon(
                                                                                                      Icons.circle_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 6.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    rowMusicStyleScheduleRecord!.saturdayClosing,
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 14.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                    child: Icon(
                                                                                                      Icons.circle_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 6.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    rowMusicStyleScheduleRecord.sundayClosing,
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 14.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Type',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                              child: Icon(
                                                                                                Icons.circle_rounded,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 6.0,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerEstablishmentEstablishmentsRecord.type.first,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Text(
                                                                                          containerEstablishmentEstablishmentsRecord.adresse.city,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
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
                                                    );
                                                  },
                                                ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Contact',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (mainColumnEstablishmentsRecord
                                                                    .email !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Email',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      mainColumnEstablishmentsRecord
                                                                          .name,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      40.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      60.0,
                                                                  icon: const Icon(
                                                                    Icons.email,
                                                                    color: Color(
                                                                        0xFF57CFAD),
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SHOW_OF_EVENTS_PAGE_email_ICN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconButton_send_email');
                                                                    await launchUrl(Uri(
                                                                        scheme: 'mailto',
                                                                        path: mainColumnEstablishmentsRecord.email,
                                                                        query: {
                                                                          'subject':
                                                                              'Hango - réservation  - ${showOfEventsEventsRecord.title}',
                                                                          'body':
                                                                              'L\'équipe Hango et  l\'équipe ${showOfEventsEventsRecord.description} te remercient de procéder à une réservation de table via email. Tu peux également nous faire parvenir un retour constructif si ta soirée c\'est bien passée ou peut-être suite à un problème !',
                                                                        }.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')));
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (mainColumnEstablishmentsRecord
                                                                    .phoneNumber !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Telephone',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      mainColumnEstablishmentsRecord
                                                                          .phoneNumber,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      40.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      60.0,
                                                                  icon: const Icon(
                                                                    Icons
                                                                        .phone_sharp,
                                                                    color: Color(
                                                                        0xFF57CFAD),
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SHOW_OF_EVENTS_phone_sharp_ICN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconButton_call_number');
                                                                    await launchUrl(
                                                                        Uri(
                                                                      scheme:
                                                                          'tel',
                                                                      path: mainColumnEstablishmentsRecord
                                                                          .phoneNumber,
                                                                    ));
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: ClipRRect(
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.6,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Visibility(
                                                                visible: mainColumnEstablishmentsRecord
                                                                            .webSite !=
                                                                        '',
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Site Web ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            AutoSizeText(
                                                                              mainColumnEstablishmentsRecord.webSite,
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    fontWeight: FontWeight.w300,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            40.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            60.0,
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .insert_link_sharp,
                                                                          color:
                                                                              Color(0xFF57CFAD),
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'SHOW_OF_EVENTS_insert_link_sharp_ICN_ON_');
                                                                          logFirebaseEvent(
                                                                              'IconButton_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'WebViewEvent',
                                                                            queryParameters:
                                                                                {
                                                                              'itemUrl': serializeParam(
                                                                                widget.showOfEvents,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
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
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: StreamBuilder<
                                                      EstablishmentsRecord>(
                                                    stream: EstablishmentsRecord
                                                        .getDocument(
                                                            showOfEventsEventsRecord
                                                                .establishmentId!),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      final columnEstablishmentsRecord =
                                                          snapshot.data!;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Adresse',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: SelectionArea(
                                                                        child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        '${columnEstablishmentsRecord.adresse.street}, ${columnEstablishmentsRecord.adresse.zipCode}, ${columnEstablishmentsRecord.adresse.city}',
                                                                        'Aucune adresse ',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    )),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SHOW_OF_EVENTS_PAGE_Icon_x6yery0d_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_copy_to_clipboard');
                                                                    await Clipboard.setData(ClipboardData(
                                                                        text: columnEstablishmentsRecord
                                                                            .adresse
                                                                            .street));
                                                                    logFirebaseEvent(
                                                                        'Icon_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Adresse copiée !',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                        ),
                                                                        duration:
                                                                            const Duration(milliseconds: 2000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .content_copy,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 15.0)),
                                                            ),
                                                          ),
                                                          if (columnEstablishmentsRecord
                                                                  .location !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 1.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Builder(
                                                                      builder:
                                                                          (context) {
                                                                    final googleMapMarker =
                                                                        columnEstablishmentsRecord
                                                                            .location;
                                                                    return FlutterFlowGoogleMap(
                                                                      controller:
                                                                          _model
                                                                              .googleMapsController2,
                                                                      onCameraIdle:
                                                                          (latLng) =>
                                                                              _model.googleMapsCenter2 = latLng,
                                                                      initialLocation: _model
                                                                              .googleMapsCenter2 ??=
                                                                          columnEstablishmentsRecord
                                                                              .location!,
                                                                      markers: [
                                                                        if (googleMapMarker !=
                                                                            null)
                                                                          FlutterFlowMarker(
                                                                            googleMapMarker.serialize(),
                                                                            googleMapMarker,
                                                                          ),
                                                                      ],
                                                                      markerColor:
                                                                          GoogleMarkerColor
                                                                              .red,
                                                                      mapType:
                                                                          MapType
                                                                              .normal,
                                                                      style: GoogleMapStyle
                                                                          .standard,
                                                                      initialZoom:
                                                                          14.0,
                                                                      allowInteraction:
                                                                          true,
                                                                      allowZoom:
                                                                          true,
                                                                      showZoomControls:
                                                                          true,
                                                                      showLocation:
                                                                          true,
                                                                      showCompass:
                                                                          false,
                                                                      showMapToolbar:
                                                                          false,
                                                                      showTraffic:
                                                                          false,
                                                                      centerMapOnMarkerTap:
                                                                          true,
                                                                    );
                                                                  }),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              if (showOfEventsEventsRecord
                                                      .dateEvent! >=
                                                  getCurrentTimestamp)
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Autre Evenement ce soir ou à venir',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                        ),
                                                        StreamBuilder<
                                                            List<EventsRecord>>(
                                                          stream:
                                                              queryEventsRecord(
                                                            queryBuilder:
                                                                (eventsRecord) =>
                                                                    eventsRecord
                                                                        .where(
                                                              'dateEvent',
                                                              isGreaterThanOrEqualTo:
                                                                  getCurrentTimestamp,
                                                            ),
                                                            limit: 5,
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
                                                            List<EventsRecord>
                                                                otherEventsListEventsRecordList =
                                                                snapshot.data!;
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: List.generate(
                                                                    otherEventsListEventsRecordList
                                                                        .length,
                                                                    (otherEventsListIndex) {
                                                                  final otherEventsListEventsRecord =
                                                                      otherEventsListEventsRecordList[
                                                                          otherEventsListIndex];
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child: StreamBuilder<
                                                                        EstablishmentsRecord>(
                                                                      stream: EstablishmentsRecord.getDocument(
                                                                          otherEventsListEventsRecord
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
                                                                        final cardEstablishmentEstablishmentsRecord =
                                                                            snapshot.data!;
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SHOW_OF_EVENTS_CardEstablishment_ON_TAP');
                                                                            logFirebaseEvent('CardEstablishment_navigate_to');

                                                                            context.pushNamed(
                                                                              'ShowOfEvents',
                                                                              queryParameters: {
                                                                                'showOfEvents': serializeParam(
                                                                                  otherEventsListEventsRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.18,
                                                                              height: 240.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  StreamBuilder<List<MediaRecord>>(
                                                                                    stream: queryMediaRecord(
                                                                                      parent: otherEventsListEventsRecord.reference,
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
                                                                                        height: 160.0,
                                                                                        decoration: const BoxDecoration(
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(8.0),
                                                                                            topRight: Radius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: const BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(8.0),
                                                                                            topRight: Radius.circular(8.0),
                                                                                          ),
                                                                                          child: Image.network(
                                                                                            valueOrDefault<String>(
                                                                                              containerMediaRecord?.image,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            ),
                                                                                            width: double.infinity,
                                                                                            height: 160.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          AutoSizeText(
                                                                                            otherEventsListEventsRecord.title,
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                          StreamBuilder<List<ScheduleEventRecord>>(
                                                                                            stream: queryScheduleEventRecord(
                                                                                              parent: otherEventsListEventsRecord.reference,
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
                                                                                              List<ScheduleEventRecord> dateScheduleEventRecordList = snapshot.data!;
                                                                                              final dateScheduleEventRecord = dateScheduleEventRecordList.isNotEmpty ? dateScheduleEventRecordList.first : null;
                                                                                              return Text(
                                                                                                valueOrDefault<String>(
                                                                                                  '${dateTimeFormat(
                                                                                                    'd/M/y',
                                                                                                    dateScheduleEventRecord?.date,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  )}  ${dateTimeFormat(
                                                                                                    'Hm',
                                                                                                    dateScheduleEventRecord?.scheduleStart,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  )}-${dateTimeFormat(
                                                                                                    'Hm',
                                                                                                    dateScheduleEventRecord?.scheduleEnd,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  )}',
                                                                                                  'Aucune horaire !',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Text(
                                                                                                  cardEstablishmentEstablishmentsRecord.name,
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: 'Open Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ].divide(const SizedBox(height: 15.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
