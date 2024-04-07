import '/backend/backend.dart';
import '/components/empty_lists/event_empty_list/event_empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'est_show_events_refs_model.dart';
export 'est_show_events_refs_model.dart';

class EstShowEventsRefsWidget extends StatefulWidget {
  const EstShowEventsRefsWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final DocumentReference? parameter1;
  final DateTime? parameter2;
  final bool? parameter3;

  @override
  State<EstShowEventsRefsWidget> createState() =>
      _EstShowEventsRefsWidgetState();
}

class _EstShowEventsRefsWidgetState extends State<EstShowEventsRefsWidget> {
  late EstShowEventsRefsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstShowEventsRefsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (widget.parameter2! >= getCurrentTimestamp) &&
          (widget.parameter3 == true),
      child: Container(
        width: double.infinity,
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
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Events',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<EventsRecord>>(
                    stream: queryEventsRecord(
                      queryBuilder: (eventsRecord) => eventsRecord
                          .where(
                            'establishment_id',
                            isEqualTo: widget.parameter1,
                          )
                          .orderBy('created_time'),
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
                      List<EventsRecord> eventsListEventsRecordList =
                          snapshot.data!;
                      if (eventsListEventsRecordList.isEmpty) {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: const EventEmptyListWidget(),
                        );
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:
                              List.generate(eventsListEventsRecordList.length,
                                  (eventsListIndex) {
                            final eventsListEventsRecord =
                                eventsListEventsRecordList[eventsListIndex];
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EST_SHOW_EVENTS_REFS_CardEvent_ON_TAP');
                                  logFirebaseEvent('CardEvent_navigate_to');

                                  context.pushNamed(
                                    'ShowOfEvents',
                                    queryParameters: {
                                      'showOfEvents': serializeParam(
                                        eventsListEventsRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: 250.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<List<MediaRecord>>(
                                          stream: queryMediaRecord(
                                            parent: eventsListEventsRecord
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
                                                imageMediaRecordList =
                                                snapshot.data!;
                                            final imageMediaRecord =
                                                imageMediaRecordList.isNotEmpty
                                                    ? imageMediaRecordList.first
                                                    : null;
                                            return ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  imageMediaRecord?.image,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                ),
                                                width: double.infinity,
                                                height: 160.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 4.0),
                                              child: StreamBuilder<
                                                  List<ScheduleEventRecord>>(
                                                stream:
                                                    queryScheduleEventRecord(
                                                  parent: eventsListEventsRecord
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
                                                      detailsScheduleEventRecordList =
                                                      snapshot.data!;
                                                  final detailsScheduleEventRecord =
                                                      detailsScheduleEventRecordList
                                                              .isNotEmpty
                                                          ? detailsScheduleEventRecordList
                                                              .first
                                                          : null;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        eventsListEventsRecord
                                                            .title,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            'd/M/y',
                                                            detailsScheduleEventRecord
                                                                ?.date,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          'Aucun date !',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                '${dateTimeFormat(
                                                                  'Hm',
                                                                  detailsScheduleEventRecord
                                                                      ?.scheduleStart,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )} - ${dateTimeFormat(
                                                                  'Hm',
                                                                  detailsScheduleEventRecord
                                                                      ?.scheduleEnd,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}',
                                                                'Aucun planing maintenant !',
                                                              ).maybeHandleOverflow(
                                                                  maxChars: 6),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
