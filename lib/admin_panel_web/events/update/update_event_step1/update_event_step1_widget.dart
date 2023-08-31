import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_event_step1_model.dart';
export 'update_event_step1_model.dart';

class UpdateEventStep1Widget extends StatefulWidget {
  const UpdateEventStep1Widget({
    Key? key,
    required this.eventstDetails,
  }) : super(key: key);

  final DocumentReference? eventstDetails;

  @override
  _UpdateEventStep1WidgetState createState() => _UpdateEventStep1WidgetState();
}

class _UpdateEventStep1WidgetState extends State<UpdateEventStep1Widget> {
  late UpdateEventStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateEventStep1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UpdateEventStep1'});
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
      stream: EventsRecord.getDocument(widget.eventstDetails!),
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
        final updateEventStep1EventsRecord = snapshot.data!;
        return Title(
            title: 'UpdateEventStep1',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Visibility(
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.sideBarModel,
                            updateCallback: () => setState(() {}),
                            child: SideBarWidget(
                              oneBG: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              oneIcon: Icon(
                                Icons.home_filled,
                              ),
                              twoBG: FlutterFlowTheme.of(context).tertiary400,
                              twoIcon: Icon(
                                Icons.event,
                              ),
                              threeColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              threeIcon: Icon(
                                Icons.house_outlined,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'UPDATE_EVENT_STEP1_chevron_left_ICN_ON_T');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Modification du l\'événement',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
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
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ),
                                      child: StreamBuilder<
                                          List<ScheduleEventRecord>>(
                                        stream: queryScheduleEventRecord(
                                          parent: updateEventStep1EventsRecord
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ScheduleEventRecord>
                                              formuCreatNewEstablishmentScheduleEventRecordList =
                                              snapshot.data!;
                                          final formuCreatNewEstablishmentScheduleEventRecord =
                                              formuCreatNewEstablishmentScheduleEventRecordList
                                                      .isNotEmpty
                                                  ? formuCreatNewEstablishmentScheduleEventRecordList
                                                      .first
                                                  : null;
                                          return Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 15.0, 0.0),
                                              child: StreamBuilder<
                                                  List<PromotionEventRecord>>(
                                                stream:
                                                    queryPromotionEventRecord(
                                                  parent:
                                                      updateEventStep1EventsRecord
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
                                                  List<PromotionEventRecord>
                                                      columnPaddingPromotionEventRecordList =
                                                      snapshot.data!;
                                                  final columnPaddingPromotionEventRecord =
                                                      columnPaddingPromotionEventRecordList
                                                              .isNotEmpty
                                                          ? columnPaddingPromotionEventRecordList
                                                              .first
                                                          : null;
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                                  .tFTitleController ??=
                                                              TextEditingController(
                                                            text:
                                                                updateEventStep1EventsRecord
                                                                    .title,
                                                          ),
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Titre de l\'événement',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                          validator: _model
                                                              .tFTitleControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                                  .tFDescriionController ??=
                                                              TextEditingController(
                                                            text:
                                                                updateEventStep1EventsRecord
                                                                    .description,
                                                          ),
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Description de l\'événement',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                          maxLines: 3,
                                                          validator: _model
                                                              .tFDescriionControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                ScheduleEventRecord>>(
                                                          stream:
                                                              queryScheduleEventRecord(
                                                            parent:
                                                                updateEventStep1EventsRecord
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
                                                            List<ScheduleEventRecord>
                                                                containerScheduleEventRecordList =
                                                                snapshot.data!;
                                                            final containerScheduleEventRecord =
                                                                containerScheduleEventRecordList
                                                                        .isNotEmpty
                                                                    ? containerScheduleEventRecordList
                                                                        .first
                                                                    : null;
                                                            return Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
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
                                                                            child:
                                                                                Text(
                                                                              'Modifiez la date',
                                                                              style: FlutterFlowTheme.of(context).titleSmall,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              _model.datePicked1 != null
                                                                                  ? dateTimeFormat(
                                                                                      'd/M/y',
                                                                                      _model.datePicked1,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )
                                                                                  : dateTimeFormat(
                                                                                      'd/M/y',
                                                                                      containerScheduleEventRecord?.date,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                              'Il n\'y a pas une date!',
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.event_repeat,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('UPDATE_EVENT_STEP1_PAGE_eventDate_ON_TAP');
                                                                              // eventDate
                                                                              logFirebaseEvent('eventDate_eventDate');
                                                                              final _datePicked1Date = await showDatePicker(
                                                                                context: context,
                                                                                initialDate: getCurrentTimestamp,
                                                                                firstDate: DateTime(1900),
                                                                                lastDate: DateTime(2050),
                                                                              );

                                                                              if (_datePicked1Date != null) {
                                                                                setState(() {
                                                                                  _model.datePicked1 = DateTime(
                                                                                    _datePicked1Date.year,
                                                                                    _datePicked1Date.month,
                                                                                    _datePicked1Date.day,
                                                                                  );
                                                                                });
                                                                              }
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(width: 25.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
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
                                                                            child:
                                                                                Text(
                                                                              'Inserez un horaire d\'ouverture et de fermeture',
                                                                              style: FlutterFlowTheme.of(context).titleSmall,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                          ),
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
                                                                                MainAxisAlignment.spaceAround,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  _model.datePicked2 != null
                                                                                      ? dateTimeFormat(
                                                                                          'Hm',
                                                                                          _model.datePicked2,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )
                                                                                      : '--:--',
                                                                                  '--:--',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('UPDATE_EVENT_STEP1_ouvertureHoraire_ON_T');
                                                                                  // ouvertureHoraire
                                                                                  logFirebaseEvent('ouvertureHoraire_ouvertureHoraire');

                                                                                  final _datePicked2Time = await showTimePicker(
                                                                                    context: context,
                                                                                    initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                  );
                                                                                  if (_datePicked2Time != null) {
                                                                                    setState(() {
                                                                                      _model.datePicked2 = DateTime(
                                                                                        getCurrentTimestamp.year,
                                                                                        getCurrentTimestamp.month,
                                                                                        getCurrentTimestamp.day,
                                                                                        _datePicked2Time.hour,
                                                                                        _datePicked2Time.minute,
                                                                                      );
                                                                                    });
                                                                                  }
                                                                                },
                                                                                text: 'Ouverture',
                                                                                options: FFButtonOptions(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFF57CFAD),
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        fontWeight: FontWeight.w300,
                                                                                      ),
                                                                                  elevation: 3.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                          ),
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
                                                                                MainAxisAlignment.spaceAround,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  _model.datePicked3 != null
                                                                                      ? dateTimeFormat(
                                                                                          'Hm',
                                                                                          _model.datePicked3,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )
                                                                                      : '--:--',
                                                                                  '--:--',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('UPDATE_EVENT_STEP1_fermetureHoraire_ON_T');
                                                                                  // fermetureHoraire
                                                                                  logFirebaseEvent('fermetureHoraire_fermetureHoraire');

                                                                                  final _datePicked3Time = await showTimePicker(
                                                                                    context: context,
                                                                                    initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                  );
                                                                                  if (_datePicked3Time != null) {
                                                                                    setState(() {
                                                                                      _model.datePicked3 = DateTime(
                                                                                        getCurrentTimestamp.year,
                                                                                        getCurrentTimestamp.month,
                                                                                        getCurrentTimestamp.day,
                                                                                        _datePicked3Time.hour,
                                                                                        _datePicked3Time.minute,
                                                                                      );
                                                                                    });
                                                                                  }
                                                                                },
                                                                                text: 'Fermeture',
                                                                                options: FFButtonOptions(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFF57CFAD),
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        fontWeight: FontWeight.w300,
                                                                                      ),
                                                                                  elevation: 3.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            24.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        15.0)),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                                  .tFURLWebSiteController ??=
                                                              TextEditingController(
                                                            text:
                                                                updateEventStep1EventsRecord
                                                                    .siteWeb,
                                                          ),
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'URL Site Web',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                          validator: _model
                                                              .tFURLWebSiteControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        Container(
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
                                                                        16.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        4.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  ExpandableNotifier(
                                                                initialExpanded:
                                                                    false,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Style musicale',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  collapsed:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '* Sélectionne 2 styles musicales maximum',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  expanded:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            FlutterFlowCheckboxGroup(
                                                                          options: FFAppState()
                                                                              .MusicStyle
                                                                              .toList(),
                                                                          onChanged: (val) =>
                                                                              setState(() => _model.checkBoxMusicStyleValues = val),
                                                                          controller: _model.checkBoxMusicStyleValueController ??=
                                                                              FormFieldController<List<String>>(
                                                                            updateEventStep1EventsRecord.musicSytle,
                                                                          ),
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          checkColor:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                          checkboxBorderColor:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          textStyle:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                          checkboxBorderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                          initialized:
                                                                              _model.checkBoxMusicStyleValues != null,
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
                                                                    hasIcon:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Precisez votre localization',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  FlutterFlowPlacePicker(
                                                                    iOSGoogleMapsApiKey:
                                                                        'AIzaSyAu1xRj92baC1e6doE7Dh_7Drh0Wn7KO90',
                                                                    androidGoogleMapsApiKey:
                                                                        'AIzaSyCgAGHHm7w6LdGQegp1WY5ctmX-IsLeMek',
                                                                    webGoogleMapsApiKey:
                                                                        'AIzaSyDmP6aJTRYjSd5-3zsciJw0I45FuYiRim4',
                                                                    onSelect:
                                                                        (place) async {
                                                                      setState(() =>
                                                                          _model.placePickerValue =
                                                                              place);
                                                                    },
                                                                    defaultText:
                                                                        'Sélectionnez l\'emplacement',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .place,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    buttonOptions:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          400.0,
                                                                      height:
                                                                          40.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 10.0)),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'UPDATE_EVENT_STEP1_BTNValidateFrom_ON_TA');
                                                            final firestoreBatch =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .batch();
                                                            try {
                                                              logFirebaseEvent(
                                                                  'BTNValidateFrom_backend_call');

                                                              firestoreBatch.update(
                                                                  updateEventStep1EventsRecord
                                                                      .reference,
                                                                  {
                                                                    ...createEventsRecordData(
                                                                      title: _model.tFTitleController.text != null &&
                                                                              _model.tFTitleController.text !=
                                                                                  ''
                                                                          ? _model
                                                                              .tFTitleController
                                                                              .text
                                                                          : updateEventStep1EventsRecord
                                                                              .title,
                                                                      description: _model.tFDescriionController.text != null &&
                                                                              _model.tFDescriionController.text !=
                                                                                  ''
                                                                          ? _model
                                                                              .tFDescriionController
                                                                              .text
                                                                          : updateEventStep1EventsRecord
                                                                              .description,
                                                                      siteWeb: _model.tFURLWebSiteController.text != null &&
                                                                              _model.tFURLWebSiteController.text !=
                                                                                  ''
                                                                          ? _model
                                                                              .tFURLWebSiteController
                                                                              .text
                                                                          : updateEventStep1EventsRecord
                                                                              .siteWeb,
                                                                      location: _model.placePickerValue.latLng !=
                                                                              null
                                                                          ? _model
                                                                              .placePickerValue
                                                                              .latLng
                                                                          : updateEventStep1EventsRecord
                                                                              .location,
                                                                      updatedAt:
                                                                          getCurrentTimestamp,
                                                                    ),
                                                                    'music_sytle':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      _model.checkBoxMusicStyleValues?.first != null &&
                                                                              _model.checkBoxMusicStyleValues?.first !=
                                                                                  ''
                                                                          ? _model
                                                                              .checkBoxMusicStyleValues
                                                                              ?.first
                                                                          : updateEventStep1EventsRecord
                                                                              .musicSytle
                                                                              .first
                                                                    ]),
                                                                  });
                                                              logFirebaseEvent(
                                                                  'BTNValidateFrom_backend_call');

                                                              firestoreBatch
                                                                  .update(
                                                                      formuCreatNewEstablishmentScheduleEventRecord!
                                                                          .reference,
                                                                      createScheduleEventRecordData(
                                                                        date: _model.datePicked1 !=
                                                                                null
                                                                            ? _model.datePicked1
                                                                            : formuCreatNewEstablishmentScheduleEventRecord?.date,
                                                                        scheduleStart: _model.datePicked2 !=
                                                                                null
                                                                            ? _model.datePicked2
                                                                            : formuCreatNewEstablishmentScheduleEventRecord?.scheduleStart,
                                                                        scheduleEnd: _model.datePicked3 !=
                                                                                null
                                                                            ? _model.datePicked3
                                                                            : formuCreatNewEstablishmentScheduleEventRecord?.scheduleEnd,
                                                                        updatedTime:
                                                                            getCurrentTimestamp,
                                                                      ));
                                                              logFirebaseEvent(
                                                                  'BTNValidateFrom_navigate_to');

                                                              context.pushNamed(
                                                                'UpdateEventStep2',
                                                                queryParameters:
                                                                    {
                                                                  'eventstDetails':
                                                                      serializeParam(
                                                                    widget
                                                                        .eventstDetails,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } finally {
                                                              await firestoreBatch
                                                                  .commit();
                                                            }
                                                          },
                                                          text:
                                                              'Enregistrer et continuer',
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 15.0))
                                                          .around(SizedBox(
                                                              height: 15.0)),
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
                                ]
                                    .divide(SizedBox(height: 20.0))
                                    .around(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
