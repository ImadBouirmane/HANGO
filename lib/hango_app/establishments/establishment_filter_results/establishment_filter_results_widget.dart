import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'establishment_filter_results_model.dart';
export 'establishment_filter_results_model.dart';

class EstablishmentFilterResultsWidget extends StatefulWidget {
  const EstablishmentFilterResultsWidget({
    Key? key,
    required this.type,
    required this.artist,
    required this.terrasse,
    required this.reservation,
    required this.machineacigarette,
    required this.nourriture,
    required this.jeux,
    required this.ouvert,
    required this.estRef,
  }) : super(key: key);

  final String? type;
  final String? artist;
  final bool? terrasse;
  final bool? reservation;
  final bool? machineacigarette;
  final bool? nourriture;
  final bool? jeux;
  final bool? ouvert;
  final DocumentReference? estRef;

  @override
  _EstablishmentFilterResultsWidgetState createState() =>
      _EstablishmentFilterResultsWidgetState();
}

class _EstablishmentFilterResultsWidgetState
    extends State<EstablishmentFilterResultsWidget> {
  late EstablishmentFilterResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstablishmentFilterResultsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'establishmentFilterResults'});
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

    return StreamBuilder<EstablishmentsRecord>(
      stream: EstablishmentsRecord.getDocument(widget.estRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final establishmentFilterResultsEstablishmentsRecord = snapshot.data!;
        return Title(
            title: 'establishmentFilterResults',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  appBar: AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.keyboard_return_rounded,
                        color: Color(0xFF57CFAD),
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ESTABLISHMENT_FILTER_RESULTS_keyboard_re');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  ),
                  body: PagedListView<DocumentSnapshot<Object?>?,
                      EstablishmentsRecord>(
                    pagingController: _model.setListEstablishmentsController(
                      EstablishmentsRecord.collection
                          .where(
                            'type',
                            arrayContains: widget.type,
                          )
                          .where(
                            'terrasse',
                            isEqualTo: widget.terrasse,
                          )
                          .where(
                            'reservation',
                            isEqualTo: widget.reservation,
                          )
                          .where(
                            'cigarette_machine',
                            isEqualTo: widget.machineacigarette,
                          ),
                    ),
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate:
                        PagedChildBuilderDelegate<EstablishmentsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
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
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
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
                      noItemsFoundIndicatorBuilder: (_) => Center(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: EmptyListWidget(
                            icon: Icon(
                              Icons.business,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            title: 'Aucun filtrage trouvé !',
                            description: '',
                          ),
                        ),
                      ),
                      itemBuilder: (context, _, listEstablishmentsIndex) {
                        final listEstablishmentsEstablishmentsRecord = _model
                            .listEstablishmentsPagingController!
                            .itemList![listEstablishmentsIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: StreamBuilder<List<ImagesRecord>>(
                              stream: queryImagesRecord(
                                parent: listEstablishmentsEstablishmentsRecord
                                    .reference,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ImagesRecord>
                                    cardEstablishmentImagesRecordList =
                                    snapshot.data!;
                                final cardEstablishmentImagesRecord =
                                    cardEstablishmentImagesRecordList.isNotEmpty
                                        ? cardEstablishmentImagesRecordList
                                            .first
                                        : null;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ESTABLISHMENT_FILTER_RESULTS_CardEstabli');
                                    logFirebaseEvent(
                                        'CardEstablishment_navigate_to');

                                    context.pushNamed(
                                      'ShowOfEstablishment',
                                      queryParameters: {
                                        'establishmentDetails': serializeParam(
                                          listEstablishmentsEstablishmentsRecord
                                              .reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          children: [
                                            if ((cardEstablishmentImagesRecord
                                                            ?.image1 !=
                                                        null &&
                                                    cardEstablishmentImagesRecord
                                                            ?.image1 !=
                                                        '') &&
                                                (cardEstablishmentImagesRecord
                                                            ?.video ==
                                                        null ||
                                                    cardEstablishmentImagesRecord
                                                            ?.video ==
                                                        ''))
                                              FlutterFlowMediaDisplay(
                                                path:
                                                    cardEstablishmentImagesRecord!
                                                        .image1,
                                                imageBuilder: (path) =>
                                                    ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                  child: Image.network(
                                                    path,
                                                    width: double.infinity,
                                                    height: 220.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                videoPlayerBuilder: (path) =>
                                                    FlutterFlowVideoPlayer(
                                                  path: path,
                                                  width: 300.0,
                                                  autoPlay: false,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                ),
                                              ),
                                            if ((cardEstablishmentImagesRecord
                                                            ?.image1 ==
                                                        null ||
                                                    cardEstablishmentImagesRecord
                                                            ?.image1 ==
                                                        '') &&
                                                (cardEstablishmentImagesRecord
                                                            ?.video !=
                                                        null &&
                                                    cardEstablishmentImagesRecord
                                                            ?.video !=
                                                        ''))
                                              FlutterFlowMediaDisplay(
                                                path:
                                                    cardEstablishmentImagesRecord!
                                                        .video,
                                                imageBuilder: (path) =>
                                                    ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                  child: Image.network(
                                                    path,
                                                    width: double.infinity,
                                                    height: 220.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                videoPlayerBuilder: (path) =>
                                                    FlutterFlowVideoPlayer(
                                                  path: path,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 220.0,
                                                  autoPlay: true,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                ),
                                              ),
                                            if ((cardEstablishmentImagesRecord
                                                            ?.image1 !=
                                                        null &&
                                                    cardEstablishmentImagesRecord
                                                            ?.image1 !=
                                                        '') &&
                                                (cardEstablishmentImagesRecord
                                                            ?.video !=
                                                        null &&
                                                    cardEstablishmentImagesRecord
                                                            ?.video !=
                                                        ''))
                                              FlutterFlowMediaDisplay(
                                                path:
                                                    cardEstablishmentImagesRecord!
                                                        .video,
                                                imageBuilder: (path) =>
                                                    ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                  child: Image.network(
                                                    path,
                                                    width: double.infinity,
                                                    height: 220.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                videoPlayerBuilder: (path) =>
                                                    FlutterFlowVideoPlayer(
                                                  path: path,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 220.0,
                                                  autoPlay: true,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                              child: Text(
                                                                listEstablishmentsEstablishmentsRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Style musical',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
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
                                                                listEstablishmentsEstablishmentsRecord.musicStyle.first !=
                                                                            null &&
                                                                        listEstablishmentsEstablishmentsRecord.musicStyle.first !=
                                                                            ''
                                                                    ? listEstablishmentsEstablishmentsRecord
                                                                        .musicStyle
                                                                        .first
                                                                    : '',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
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
                                                                listEstablishmentsEstablishmentsRecord.musicStyle.last !=
                                                                            null &&
                                                                        listEstablishmentsEstablishmentsRecord.musicStyle.last !=
                                                                            ''
                                                                    ? listEstablishmentsEstablishmentsRecord
                                                                        .musicStyle
                                                                        .last
                                                                    : '',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                'Type',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
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
                                                                listEstablishmentsEstablishmentsRecord
                                                                    .type.first,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            listEstablishmentsEstablishmentsRecord
                                                                .adresse.city,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
