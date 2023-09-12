import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_event_step3_model.dart';
export 'update_event_step3_model.dart';

class UpdateEventStep3Widget extends StatefulWidget {
  const UpdateEventStep3Widget({
    Key? key,
    required this.eventstDetails,
  }) : super(key: key);

  final DocumentReference? eventstDetails;

  @override
  _UpdateEventStep3WidgetState createState() => _UpdateEventStep3WidgetState();
}

class _UpdateEventStep3WidgetState extends State<UpdateEventStep3Widget> {
  late UpdateEventStep3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateEventStep3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UpdateEventStep3'});
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

    return Title(
        title: 'UpdateEventStep3',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                          oneBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          oneIcon: Icon(
                            Icons.home_filled,
                          ),
                          twoBG: FlutterFlowTheme.of(context).tertiary400,
                          twoIcon: Icon(
                            Icons.event,
                          ),
                          threeColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'UPDATE_EVENT_STEP3_chevron_left_ICN_ON_T');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        'Modification du l\'événement',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.home,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 12.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'UPDATE_EVENT_STEP3_PAGE_home_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                        'Dashboard',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
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
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child:
                                      StreamBuilder<List<PromotionEventRecord>>(
                                    stream: queryPromotionEventRecord(
                                      parent: widget.eventstDetails,
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<PromotionEventRecord>
                                          columnPromotionEventRecordList =
                                          snapshot.data!;
                                      final columnPromotionEventRecord =
                                          columnPromotionEventRecordList
                                                  .isNotEmpty
                                              ? columnPromotionEventRecordList
                                                  .first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 15.0, 15.0),
                                              child: Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.always,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Programmez votre promotion:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .promorTitleController ??=
                                                                TextEditingController(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                columnPromotionEventRecord
                                                                    ?.title,
                                                                'Aucune',
                                                              ),
                                                            ),
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Titre',
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
                                                                            FontWeight.w500,
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
                                                                .promorTitleControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .promorSousTitleController ??=
                                                                TextEditingController(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                columnPromotionEventRecord
                                                                    ?.subTitle,
                                                                'Aucune',
                                                              ),
                                                            ),
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Sous titre',
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
                                                                            FontWeight.w500,
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
                                                                .promorSousTitleControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .descriptionController ??=
                                                                TextEditingController(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                columnPromotionEventRecord
                                                                    ?.message,
                                                                'Aucune',
                                                              ),
                                                            ),
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'PROMO Description',
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
                                                                            FontWeight.w500,
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
                                                                .descriptionControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .nbrEntranceController ??=
                                                                TextEditingController(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                columnPromotionEventRecord
                                                                    ?.entranceValue
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                            ),
                                                            autofocus: true,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Nombre de promotion',
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
                                                                            FontWeight.w500,
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
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .nbrEntranceControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
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
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        _model.datePicked1 !=
                                                                                null
                                                                            ? dateTimeFormat(
                                                                                'Hm',
                                                                                _model.datePicked1,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )
                                                                            : dateTimeFormat(
                                                                                'd/M H:mm',
                                                                                columnPromotionEventRecord?.startTrack,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                        '--:--',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'UPDATE_EVENT_STEP3_ouvertureHoraire_ON_T');
                                                                        // ouvertureHoraire
                                                                        logFirebaseEvent(
                                                                            'ouvertureHoraire_ouvertureHoraire');
                                                                        final _datePicked1Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              getCurrentTimestamp,
                                                                          firstDate:
                                                                              getCurrentTimestamp,
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                        );

                                                                        TimeOfDay?
                                                                            _datePicked1Time;
                                                                        if (_datePicked1Date !=
                                                                            null) {
                                                                          _datePicked1Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                          );
                                                                        }

                                                                        if (_datePicked1Date !=
                                                                                null &&
                                                                            _datePicked1Time !=
                                                                                null) {
                                                                          setState(
                                                                              () {
                                                                            _model.datePicked1 =
                                                                                DateTime(
                                                                              _datePicked1Date.year,
                                                                              _datePicked1Date.month,
                                                                              _datePicked1Date.day,
                                                                              _datePicked1Time!.hour,
                                                                              _datePicked1Time.minute,
                                                                            );
                                                                          });
                                                                        }
                                                                      },
                                                                      text:
                                                                          'Ouverture',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFF57CFAD),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
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
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        _model.datePicked2 !=
                                                                                null
                                                                            ? dateTimeFormat(
                                                                                'Hm',
                                                                                _model.datePicked2,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )
                                                                            : dateTimeFormat(
                                                                                'd/M H:mm',
                                                                                columnPromotionEventRecord?.endTrack,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                        '--:--',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'UPDATE_EVENT_STEP3_fermetureHoraire_ON_T');
                                                                        // fermetureHoraire
                                                                        logFirebaseEvent(
                                                                            'fermetureHoraire_fermetureHoraire');
                                                                        final _datePicked2Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              getCurrentTimestamp,
                                                                          firstDate:
                                                                              getCurrentTimestamp,
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                        );

                                                                        TimeOfDay?
                                                                            _datePicked2Time;
                                                                        if (_datePicked2Date !=
                                                                            null) {
                                                                          _datePicked2Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                          );
                                                                        }

                                                                        if (_datePicked2Date !=
                                                                                null &&
                                                                            _datePicked2Time !=
                                                                                null) {
                                                                          setState(
                                                                              () {
                                                                            _model.datePicked2 =
                                                                                DateTime(
                                                                              _datePicked2Date.year,
                                                                              _datePicked2Date.month,
                                                                              _datePicked2Date.day,
                                                                              _datePicked2Time!.hour,
                                                                              _datePicked2Time.minute,
                                                                            );
                                                                          });
                                                                        }
                                                                      },
                                                                      text:
                                                                          'Fermeture',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFF57CFAD),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 24.0)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 15.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 15.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'UPDATE_EVENT_STEP3_ignoreStep_ON_TAP');
                                                      logFirebaseEvent(
                                                          'ignoreStep_navigate_to');

                                                      context.pushNamed(
                                                        'UpdateEventStep4',
                                                        queryParameters: {
                                                          'eventstDetails':
                                                              serializeParam(
                                                            widget
                                                                .eventstDetails,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: 'Ignorez ',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
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
                                                          .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'UPDATE_EVENT_STEP3_BTNValidateFrom_ON_TA');
                                                      logFirebaseEvent(
                                                          'BTNValidateFrom_backend_call');

                                                      await columnPromotionEventRecord!
                                                          .reference
                                                          .update(
                                                              createPromotionEventRecordData(
                                                        message: valueOrDefault<
                                                            String>(
                                                          _model
                                                              .descriptionController
                                                              .text,
                                                          'Aucune',
                                                        ),
                                                        title: valueOrDefault<
                                                            String>(
                                                          _model
                                                              .promorTitleController
                                                              .text,
                                                          'Aucune',
                                                        ),
                                                        subTitle:
                                                            valueOrDefault<
                                                                String>(
                                                          _model
                                                              .promorSousTitleController
                                                              .text,
                                                          'Aucune',
                                                        ),
                                                        startTrack: _model
                                                                    .datePicked1 !=
                                                                null
                                                            ? _model.datePicked1
                                                            : columnPromotionEventRecord
                                                                ?.startTrack,
                                                        endTrack: _model
                                                                    .datePicked2 !=
                                                                null
                                                            ? _model.datePicked2
                                                            : columnPromotionEventRecord
                                                                ?.endTrack,
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        entranceValue:
                                                            valueOrDefault<
                                                                double>(
                                                          double.tryParse(_model
                                                              .nbrEntranceController
                                                              .text),
                                                          0.0,
                                                        ),
                                                        trackTime: functions
                                                            .getTimeDuration(
                                                                _model
                                                                    .datePicked1,
                                                                _model
                                                                    .datePicked2),
                                                      ));
                                                      logFirebaseEvent(
                                                          'BTNValidateFrom_navigate_to');

                                                      context.pushNamed(
                                                        'UpdateEventStep4',
                                                        queryParameters: {
                                                          'eventstDetails':
                                                              serializeParam(
                                                            widget
                                                                .eventstDetails,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text:
                                                        'Enregistrer et continuer',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 30.0)),
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
  }
}
