import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'show_of_events_model.dart';
export 'show_of_events_model.dart';

class ShowOfEventsWidget extends StatefulWidget {
  const ShowOfEventsWidget({
    Key? key,
    required this.showOfEvents,
  }) : super(key: key);

  final DocumentReference? showOfEvents;

  @override
  _ShowOfEventsWidgetState createState() => _ShowOfEventsWidgetState();
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
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                resizeToAvoidBottomInset: false,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: Row(
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
                        child: SideNavWebWidget(
                          nav1: false,
                          nav2: true,
                          nav3: false,
                        ),
                      ),
                    Expanded(
                      child: SingleChildScrollView(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.98, -0.90),
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
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<
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
                                                    return Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 300.0,
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
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 300.0,
                                                            child: Stack(
                                                              children: [
                                                                PageView(
                                                                  controller: _model
                                                                          .pageViewController1 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  onPageChanged:
                                                                      (_) => setState(
                                                                          () {}),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          imagesEventMediaRecord
                                                                              ?.image,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                        ),
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            300.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
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
                                                                        path: valueOrDefault<
                                                                            String>(
                                                                          imagesEventMediaRecord
                                                                              ?.video,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                        ),
                                                                        videoType:
                                                                            VideoType.network,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
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
                                                                      AlignmentDirectional(
                                                                          -1.00,
                                                                          1.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: smooth_page_indicator
                                                                        .SmoothPageIndicator(
                                                                      controller: _model
                                                                              .pageViewController1 ??=
                                                                          PageController(
                                                                              initialPage: 0),
                                                                      count: 2,
                                                                      axisDirection:
                                                                          Axis.horizontal,
                                                                      onDotClicked:
                                                                          (i) async {
                                                                        await _model
                                                                            .pageViewController1!
                                                                            .animateToPage(
                                                                          i,
                                                                          duration:
                                                                              Duration(milliseconds: 500),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      },
                                                                      effect: smooth_page_indicator
                                                                          .ExpandingDotsEffect(
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
                                                                AlignmentDirectional(
                                                                    0.00, 1.00),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.05,
                                                              decoration:
                                                                  BoxDecoration(
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
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
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
                                                                AlignmentDirectional(
                                                                    -0.98,
                                                                    -0.90),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              icon: Icon(
                                                                Icons
                                                                    .arrow_back_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary400,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'SHOW_OF_EVENTS_arrow_back_rounded_ICN_ON');
                                                                logFirebaseEvent(
                                                                    'IconButton_navigate_back');
                                                                context
                                                                    .safePop();
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            showOfEventsEventsRecord
                                                                .title,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Style musical',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                showOfEventsEventsRecord
                                                                    .musicSytle
                                                                    .first,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                showOfEventsEventsRecord
                                                                    .musicSytle
                                                                    .last,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  showOfEventsEventsRecord.entrancePrice !=
                                                                              null &&
                                                                          showOfEventsEventsRecord.entrancePrice !=
                                                                              ''
                                                                      ? '${showOfEventsEventsRecord.entrancePrice}.-'
                                                                      : 'Gratuit',
                                                                  'Le prix de l\'événement est inconnu',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
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
                                                              .accent3,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.95,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                            child:
                                                                                Column(
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
                                                                            builder:
                                                                                (context) {
                                                                              if (valueOrDefault<bool>(
                                                                                promotionIsMobilePromotionEventRecord?.entranceCheck == false,
                                                                                true,
                                                                              )) {
                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('SHOW_OF_EVENTS_J\'EN_PROFITE_BTN_ON_TAP');
                                                                                    var _shouldSetState = false;
                                                                                    final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                    try {
                                                                                      if (loggedIn) {
                                                                                        logFirebaseEvent('Button_backend_call');

                                                                                        firestoreBatch.update(promotionIsMobilePromotionEventRecord!.reference, {
                                                                                          ...createPromotionEventRecordData(
                                                                                            userRef: currentUserReference,
                                                                                            entranceCheck: true,
                                                                                          ),
                                                                                          'usersJoined': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        });
                                                                                        logFirebaseEvent('Button_backend_call');

                                                                                        firestoreBatch.update(promotionIsMobilePromotionEventRecord!.reference, {
                                                                                          'entranceValue': FieldValue.increment(valueOrDefault<double>(
                                                                                            functions.sumEntrancePromotionValue(promotionIsMobilePromotionEventRecord!.entranceValue >= 0.01 ? 0.01 : null),
                                                                                            0.0,
                                                                                          )),
                                                                                        });
                                                                                        logFirebaseEvent('Button_backend_call');

                                                                                        firestoreBatch.update(currentUserReference!, {
                                                                                          'promotionEvents': FieldValue.arrayUnion([
                                                                                            promotionIsMobilePromotionEventRecord?.reference
                                                                                          ]),
                                                                                        });
                                                                                        logFirebaseEvent('Button_backend_call');
                                                                                        _model.sendingEmailPromotion = await SendGridAPIGroup.sendEmailCall.call(
                                                                                          receiverEmail: currentUserEmail,
                                                                                          subjectEmail: valueOrDefault<String>(
                                                                                            'Hango - ${promotionIsMobilePromotionEventRecord?.title} - ${valueOrDefault<String>(
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
                                                                                              promotionIsMobilePromotionEventRecord?.title,
                                                                                              promotionIsMobilePromotionEventRecord?.subTitle,
                                                                                              promotionIsMobilePromotionEventRecord?.message != null && promotionIsMobilePromotionEventRecord?.message != '' ? promotionIsMobilePromotionEventRecord?.message : '',
                                                                                              currentUserDocument?.birthday != null ? currentUserDocument?.birthday : null,
                                                                                              stackEstablishmentsRecord.name != null && stackEstablishmentsRecord.name != '' ? stackEstablishmentsRecord.name : '',
                                                                                              showOfEventsEventsRecord.title != null && showOfEventsEventsRecord.title != '' ? showOfEventsEventsRecord.title : '',
                                                                                              showOfEventsEventsRecord.dateEvent != null ? showOfEventsEventsRecord.dateEvent : null),
                                                                                        );
                                                                                        _shouldSetState = true;
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
                                                                                              duration: Duration(milliseconds: 1800),
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
                                                                                              duration: Duration(milliseconds: 1800),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          );
                                                                                          if (_shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }
                                                                                      } else {
                                                                                        logFirebaseEvent('Button_navigate_to');

                                                                                        context.pushNamed('UserSignUp');
                                                                                      }
                                                                                    } finally {
                                                                                      await firestoreBatch.commit();
                                                                                    }

                                                                                    if (_shouldSetState) setState(() {});
                                                                                  },
                                                                                  text: 'J\'en profite',
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).warning,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                    elevation: 3.0,
                                                                                    borderSide: BorderSide(
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                    child: Text(
                                                                                      'Offre utilisée',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(width: 15.0)),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            LinearPercentIndicator(
                                                                          percent:
                                                                              valueOrDefault<double>(
                                                                            promotionIsMobilePromotionEventRecord?.entranceValue != null
                                                                                ? promotionIsMobilePromotionEventRecord?.entranceValue
                                                                                : null,
                                                                            0.0,
                                                                          ),
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.9,
                                                                          lineHeight:
                                                                              14.0,
                                                                          animation:
                                                                              true,
                                                                          progressColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          barRadius:
                                                                              Radius.circular(300.0),
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                functions.getPourcentageValue(functions.getDecimalNumber(promotionIsMobilePromotionEventRecord?.entranceValue != null ? promotionIsMobilePromotionEventRecord?.entranceValue : null)?.toDouble())!,
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
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                        FlutterFlowTimer(
                                                                          initialTime:
                                                                              valueOrDefault<int>(
                                                                            (dateTimeFormat(
                                                                                              '00:00',
                                                                                              promotionIsMobilePromotionEventRecord?.trackTime,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ) !=
                                                                                            null &&
                                                                                        dateTimeFormat(
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
                                                                          getDisplayTime: (value) =>
                                                                              StopWatchTimer.getDisplayTime(
                                                                            value,
                                                                            hours:
                                                                                false,
                                                                            milliSecond:
                                                                                false,
                                                                          ),
                                                                          timer:
                                                                              _model.timerController1,
                                                                          updateStateInterval:
                                                                              Duration(milliseconds: 1000),
                                                                          onChanged: (value,
                                                                              displayTime,
                                                                              shouldUpdate) {
                                                                            _model.timerMilliseconds1 =
                                                                                value;
                                                                            _model.timerValue1 =
                                                                                displayTime;
                                                                            if (shouldUpdate)
                                                                              setState(() {});
                                                                          },
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 15.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                                                    return Container(
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
                                                              .accent3,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Programation',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
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
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child:
                                                                      Builder(
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
                                                                            Icons.music_note,
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
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: List.generate(
                                                                            listArtists.length,
                                                                            (listArtistsIndex) {
                                                                          final listArtistsItem =
                                                                              listArtists[listArtistsIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
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
                                                if (stackEstablishmentsRecord
                                                            .description !=
                                                        null &&
                                                    stackEstablishmentsRecord
                                                            .description !=
                                                        '')
                                                  Container(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
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
                                                              initialExpanded:
                                                                  false,
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
                                                                    padding: EdgeInsetsDirectional
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
                                                                  iconPadding: EdgeInsets
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
                                                        color:
                                                            Colors.transparent,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.05),
                                                                child: InkWell(
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
                                                                        'SHOW_OF_EVENTS_CardEstablishment_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'CardEstablishment_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'ShowOfEstablishment',
                                                                      queryParameters:
                                                                          {
                                                                        'establishmentDetails':
                                                                            serializeParam(
                                                                          containerEstablishmentEstablishmentsRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
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
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        StreamBuilder<
                                                                            List<ImagesRecord>>(
                                                                          stream:
                                                                              queryImagesRecord(
                                                                            parent:
                                                                                containerEstablishmentEstablishmentsRecord.reference,
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
                                                                            List<ImagesRecord>
                                                                                cardImageEstablishmentImagesRecordList =
                                                                                snapshot.data!;
                                                                            final cardImageEstablishmentImagesRecord = cardImageEstablishmentImagesRecordList.isNotEmpty
                                                                                ? cardImageEstablishmentImagesRecordList.first
                                                                                : null;
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                8.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                      child: Icon(
                                                                                                        Icons.circle_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 6.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      rowMusicStyleScheduleRecord!.sundayClosing,
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
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                                Container(
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
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
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
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
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
                                                        if (stackEstablishmentsRecord
                                                                    .email !=
                                                                null &&
                                                            stackEstablishmentsRecord
                                                                    .email !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                          .bodySmall,
                                                                    ),
                                                                    AutoSizeText(
                                                                      stackEstablishmentsRecord
                                                                          .email,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                  icon: Icon(
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
                                                                null &&
                                                            stackEstablishmentsRecord
                                                                    .phoneNumber !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                          .bodySmall,
                                                                    ),
                                                                    AutoSizeText(
                                                                      stackEstablishmentsRecord
                                                                          .phoneNumber,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                  icon: Icon(
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
                                                                null &&
                                                            stackEstablishmentsRecord
                                                                    .webSite !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                      'Site Web ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.7,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          AutoSizeText(
                                                                        stackEstablishmentsRecord
                                                                            .webSite,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
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
                                                                  icon: Icon(
                                                                    Icons
                                                                        .insert_link_sharp,
                                                                    color: Color(
                                                                        0xFF57CFAD),
                                                                    size: 30.0,
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
                                                                        'itemUrl':
                                                                            serializeParam(
                                                                          widget
                                                                              .showOfEvents,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
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
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                    ),
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
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
                                                                EdgeInsetsDirectional
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
                                                                SelectionArea(
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${columnEstablishmentsRecord.adresse.street}, ${columnEstablishmentsRecord.adresse.zipCode}, ${columnEstablishmentsRecord.adresse.city}',
                                                                    'Aucune adresse ',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                )),
                                                                Icon(
                                                                  Icons
                                                                      .content_copy,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (columnEstablishmentsRecord
                                                                  .location !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
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
                                                                    final _googleMapMarker =
                                                                        columnEstablishmentsRecord
                                                                            .location;
                                                                    return FlutterFlowGoogleMap(
                                                                      controller:
                                                                          _model
                                                                              .googleMapsController1,
                                                                      onCameraIdle:
                                                                          (latLng) =>
                                                                              _model.googleMapsCenter1 = latLng,
                                                                      initialLocation: _model
                                                                              .googleMapsCenter1 ??=
                                                                          columnEstablishmentsRecord
                                                                              .location!,
                                                                      markers: [
                                                                        if (_googleMapMarker !=
                                                                            null)
                                                                          FlutterFlowMarker(
                                                                            _googleMapMarker.serialize(),
                                                                            _googleMapMarker,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
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
                                                              EdgeInsetsDirectional
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
                                                            queryBuilder: (eventsRecord) =>
                                                                eventsRecord.where(
                                                                    'dateEvent',
                                                                    isGreaterThanOrEqualTo:
                                                                        getCurrentTimestamp),
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
                                                                    padding: EdgeInsetsDirectional
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
                                                                              width: 180.0,
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
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(8.0),
                                                                                            topRight: Radius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.only(
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Flexible(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 300.0,
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
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 300.0,
                                                            child: Stack(
                                                              children: [
                                                                PageView(
                                                                  controller: _model
                                                                          .pageViewController2 ??=
                                                                      PageController(
                                                                          initialPage:
                                                                              0),
                                                                  onPageChanged:
                                                                      (_) => setState(
                                                                          () {}),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          imagesEventMediaRecord
                                                                              ?.image,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                        ),
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
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
                                                                        path: valueOrDefault<
                                                                            String>(
                                                                          imagesEventMediaRecord
                                                                              ?.video,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                        ),
                                                                        videoType:
                                                                            VideoType.network,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
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
                                                                      AlignmentDirectional(
                                                                          -1.00,
                                                                          1.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: smooth_page_indicator
                                                                        .SmoothPageIndicator(
                                                                      controller: _model
                                                                              .pageViewController2 ??=
                                                                          PageController(
                                                                              initialPage: 0),
                                                                      count: 2,
                                                                      axisDirection:
                                                                          Axis.horizontal,
                                                                      onDotClicked:
                                                                          (i) async {
                                                                        await _model
                                                                            .pageViewController2!
                                                                            .animateToPage(
                                                                          i,
                                                                          duration:
                                                                              Duration(milliseconds: 500),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      },
                                                                      effect: smooth_page_indicator
                                                                          .ExpandingDotsEffect(
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
                                                                AlignmentDirectional(
                                                                    0.00, 1.00),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.05,
                                                              decoration:
                                                                  BoxDecoration(
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
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
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
                                                                AlignmentDirectional(
                                                                    0.98, 0.90),
                                                            child: Builder(
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
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      imagesEventMediaRecord
                                                                          ?.image,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                    ),
                                                                    isShortLink:
                                                                        false,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            showOfEventsEventsRecord
                                                                .title,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Style musical',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                showOfEventsEventsRecord
                                                                    .musicSytle
                                                                    .first,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                showOfEventsEventsRecord
                                                                    .musicSytle
                                                                    .last,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                                      var _shouldSetState = false;
                                                                                      final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                      try {
                                                                                        if (loggedIn) {
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          firestoreBatch.update(promotionIsWebPromotionEventRecord!.reference, {
                                                                                            ...createPromotionEventRecordData(
                                                                                              userRef: currentUserReference,
                                                                                              entranceCheck: true,
                                                                                            ),
                                                                                            'usersJoined': FieldValue.arrayUnion([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                          });
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          firestoreBatch.update(promotionIsWebPromotionEventRecord!.reference, {
                                                                                            'entranceValue': FieldValue.increment(valueOrDefault<double>(
                                                                                              functions.sumEntrancePromotionValue(promotionIsWebPromotionEventRecord!.entranceValue >= 0.01 ? 0.01 : null),
                                                                                              0.0,
                                                                                            )),
                                                                                          });
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          firestoreBatch.update(currentUserReference!, {
                                                                                            'promotionEvents': FieldValue.arrayUnion([
                                                                                              promotionIsWebPromotionEventRecord?.reference
                                                                                            ]),
                                                                                          });
                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                          _model.sendingEmailPromotionWeb = await SendGridAPIGroup.sendEmailCall.call(
                                                                                            receiverEmail: currentUserEmail,
                                                                                            subjectEmail: valueOrDefault<String>(
                                                                                              'Hango - ${promotionIsWebPromotionEventRecord?.title} - ${valueOrDefault<String>(
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
                                                                                                promotionIsWebPromotionEventRecord?.title,
                                                                                                promotionIsWebPromotionEventRecord?.subTitle,
                                                                                                dateTimeFormat(
                                                                                                              'd/M/y',
                                                                                                              currentUserDocument?.birthday,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            ) !=
                                                                                                            null &&
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
                                                                                                currentUserDocument?.birthday != null ? currentUserDocument?.birthday : null,
                                                                                                mainColumnEstablishmentsRecord.name != null && mainColumnEstablishmentsRecord.name != '' ? mainColumnEstablishmentsRecord.name : '',
                                                                                                showOfEventsEventsRecord.title != null && showOfEventsEventsRecord.title != '' ? showOfEventsEventsRecord.title : '',
                                                                                                showOfEventsEventsRecord.dateEvent != null ? showOfEventsEventsRecord.dateEvent : null),
                                                                                          );
                                                                                          _shouldSetState = true;
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
                                                                                                duration: Duration(milliseconds: 1800),
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
                                                                                                duration: Duration(milliseconds: 1800),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            );
                                                                                            if (_shouldSetState) setState(() {});
                                                                                            return;
                                                                                          }
                                                                                        } else {
                                                                                          logFirebaseEvent('Button_navigate_to');

                                                                                          context.pushNamed('UserSignUp');
                                                                                        }
                                                                                      } finally {
                                                                                        await firestoreBatch.commit();
                                                                                      }

                                                                                      if (_shouldSetState) setState(() {});
                                                                                    },
                                                                                    text: 'J\'en profite',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: BorderSide(
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                      child: Text(
                                                                                        'Offre utilisée',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ].divide(SizedBox(width: 15.0)),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.00,
                                                                            0.00),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.55,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              LinearPercentIndicator(
                                                                            percent:
                                                                                valueOrDefault<double>(
                                                                              promotionIsWebPromotionEventRecord?.entranceValue != null ? promotionIsWebPromotionEventRecord?.entranceValue : null,
                                                                              0.0,
                                                                            ),
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.55,
                                                                            lineHeight:
                                                                                14.0,
                                                                            animation:
                                                                                true,
                                                                            progressColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                            barRadius:
                                                                                Radius.circular(300.0),
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
                                                                                  functions.getPourcentageValue(functions.getDecimalNumber(promotionIsWebPromotionEventRecord?.entranceValue != null ? promotionIsWebPromotionEventRecord?.entranceValue : null)?.toDouble())!,
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
                                                                              ].divide(SizedBox(width: 8.0)),
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
                                                                                              null &&
                                                                                          dateTimeFormat(
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
                                                                            timer:
                                                                                _model.timerController2,
                                                                            updateStateInterval:
                                                                                Duration(milliseconds: 1000),
                                                                            onChanged: (value,
                                                                                displayTime,
                                                                                shouldUpdate) {
                                                                              _model.timerMilliseconds2 = value;
                                                                              _model.timerValue2 = displayTime;
                                                                              if (shouldUpdate)
                                                                                setState(() {});
                                                                            },
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 15.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
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
                                                                EdgeInsetsDirectional
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
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
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
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
                                                      null &&
                                                  mainColumnEstablishmentsRecord
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
                                                              EdgeInsetsDirectional
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
                                                              initialExpanded:
                                                                  false,
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
                                                                    padding: EdgeInsetsDirectional
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
                                                                  iconPadding: EdgeInsets
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                  EdgeInsetsDirectional
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
                                                                  AlignmentDirectional(
                                                                      0.00,
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
                                                                      'establishmentDetails':
                                                                          serializeParam(
                                                                        containerEstablishmentEstablishmentsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              8.0),
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
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
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                    child: Icon(
                                                                                                      Icons.circle_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 6.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    rowMusicStyleScheduleRecord!.sundayClosing,
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                                        EdgeInsetsDirectional
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
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
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
                                                                null &&
                                                            mainColumnEstablishmentsRecord
                                                                    .email !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                          .bodySmall,
                                                                    ),
                                                                    AutoSizeText(
                                                                      mainColumnEstablishmentsRecord
                                                                          .name,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                  icon: Icon(
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
                                                                null &&
                                                            mainColumnEstablishmentsRecord
                                                                    .phoneNumber !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                          .bodySmall,
                                                                    ),
                                                                    AutoSizeText(
                                                                      mainColumnEstablishmentsRecord
                                                                          .phoneNumber,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                  icon: Icon(
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
                                                              AlignmentDirectional(
                                                                  -1.00, 0.00),
                                                          child: ClipRRect(
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.6,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Visibility(
                                                                visible: mainColumnEstablishmentsRecord
                                                                            .webSite !=
                                                                        null &&
                                                                    mainColumnEstablishmentsRecord
                                                                            .webSite !=
                                                                        '',
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                              style: FlutterFlowTheme.of(context).bodySmall,
                                                                            ),
                                                                            AutoSizeText(
                                                                              mainColumnEstablishmentsRecord.webSite,
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                            Icon(
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
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
                                                                EdgeInsetsDirectional
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
                                                                SelectionArea(
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${columnEstablishmentsRecord.adresse.street}, ${columnEstablishmentsRecord.adresse.zipCode}, ${columnEstablishmentsRecord.adresse.city}',
                                                                    'Aucune adresse ',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                )),
                                                                Icon(
                                                                  Icons
                                                                      .content_copy,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (columnEstablishmentsRecord
                                                                  .location !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
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
                                                                    final _googleMapMarker =
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
                                                                        if (_googleMapMarker !=
                                                                            null)
                                                                          FlutterFlowMarker(
                                                                            _googleMapMarker.serialize(),
                                                                            _googleMapMarker,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
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
                                                            EdgeInsetsDirectional
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
                                                          queryBuilder: (eventsRecord) =>
                                                              eventsRecord.where(
                                                                  'dateEvent',
                                                                  isGreaterThanOrEqualTo:
                                                                      getCurrentTimestamp),
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                      final cardEstablishmentEstablishmentsRecord =
                                                                          snapshot
                                                                              .data!;
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
                                                                          logFirebaseEvent(
                                                                              'SHOW_OF_EVENTS_CardEstablishment_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'CardEstablishment_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'ShowOfEvents',
                                                                            queryParameters:
                                                                                {
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                180.0,
                                                                            height:
                                                                                240.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Column(
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
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                          bottomRight: Radius.circular(0.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.only(
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          ]
                              .addToStart(SizedBox(height: 15.0))
                              .addToEnd(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
