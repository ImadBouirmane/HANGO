import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feedback_model.dart';
export 'feedback_model.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({Key? key}) : super(key: key);

  @override
  _FeedbackWidgetState createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  late FeedbackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Feedback'});
    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
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
        title: 'Feedback',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.keyboard_return_rounded,
                  color: Color(0xFF57CFAD),
                  size: 20.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('FEEDBACK_keyboard_return_rounded_ICN_ON_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                'Feedback',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primary,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      desktop: false,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 15.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Suggestion',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall,
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: Form(
                                            key: _model.formKey3,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController1,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Décrire votre nouvelle proposition...',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryTransparent,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    maxLines: 8,
                                                    validator: _model
                                                        .textController1Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.00, 0.00),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'FEEDBACK_PAGE_ENVOYER_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      var feedbackRecordReference =
                                                          FeedbackRecord
                                                              .collection
                                                              .doc();
                                                      await feedbackRecordReference
                                                          .set(
                                                              createFeedbackRecordData(
                                                        userRef:
                                                            currentUserReference,
                                                        message: _model
                                                            .textController1
                                                            .text,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        isSuggestion: true,
                                                        isReport: false,
                                                      ));
                                                      _model.newSuggestionMobile =
                                                          FeedbackRecord
                                                              .getDocumentFromData(
                                                                  createFeedbackRecordData(
                                                                    userRef:
                                                                        currentUserReference,
                                                                    message: _model
                                                                        .textController1
                                                                        .text,
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    isSuggestion:
                                                                        true,
                                                                    isReport:
                                                                        false,
                                                                  ),
                                                                  feedbackRecordReference);
                                                      logFirebaseEvent(
                                                          'Button_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  1000));
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'votre feedback a été envoyé!',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_navigate_back');
                                                      context.safePop();

                                                      setState(() {});
                                                    },
                                                    text: 'Envoyer',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
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
                                                              15.0),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 30.0))
                                                  .addToEnd(
                                                      SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: true,
                                          tapBodyToCollapse: true,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          iconSize: 30.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Rapport',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall,
                                        ),
                                        collapsed: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        expanded: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: Form(
                                            key: _model.formKey4,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController2,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Décrire votre nouvelle proposition...',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryTransparent,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    maxLines: 8,
                                                    validator: _model
                                                        .textController2Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.00, 0.00),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'FEEDBACK_PAGE_ENVOYER_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      var feedbackRecordReference =
                                                          FeedbackRecord
                                                              .collection
                                                              .doc();
                                                      await feedbackRecordReference
                                                          .set(
                                                              createFeedbackRecordData(
                                                        message: _model
                                                            .textController2
                                                            .text,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        isSuggestion: false,
                                                        isReport: true,
                                                        userRef:
                                                            currentUserReference,
                                                      ));
                                                      _model.newReportMobile =
                                                          FeedbackRecord
                                                              .getDocumentFromData(
                                                                  createFeedbackRecordData(
                                                                    message: _model
                                                                        .textController2
                                                                        .text,
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    isSuggestion:
                                                                        false,
                                                                    isReport:
                                                                        true,
                                                                    userRef:
                                                                        currentUserReference,
                                                                  ),
                                                                  feedbackRecordReference);
                                                      logFirebaseEvent(
                                                          'Button_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  1000));
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'votre rapport a été envoyé!',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_navigate_back');
                                                      context.safePop();

                                                      setState(() {});
                                                    },
                                                    text: 'Envoyer',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
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
                                                              15.0),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 30.0))
                                                  .addToEnd(
                                                      SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: true,
                                          tapBodyToCollapse: true,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          iconSize: 30.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 15.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      width: double.infinity,
                                      color: Color(0x00000000),
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Text(
                                            'Suggestion',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                          collapsed: Container(
                                            decoration: BoxDecoration(),
                                          ),
                                          expanded: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: Form(
                                              key: _model.formKey2,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController3,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Décrire votre nouvelle proposition...',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryTransparent,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      maxLines: 8,
                                                      validator: _model
                                                          .textController3Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'FEEDBACK_PAGE_ENVOYER_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        var feedbackRecordReference =
                                                            FeedbackRecord
                                                                .collection
                                                                .doc();
                                                        await feedbackRecordReference
                                                            .set(
                                                                createFeedbackRecordData(
                                                          userRef:
                                                              currentUserReference,
                                                          message: _model
                                                              .textController3
                                                              .text,
                                                          createdTime:
                                                              getCurrentTimestamp,
                                                          isSuggestion: true,
                                                          isReport: false,
                                                        ));
                                                        _model.newSuggestionWeb =
                                                            FeedbackRecord
                                                                .getDocumentFromData(
                                                                    createFeedbackRecordData(
                                                                      userRef:
                                                                          currentUserReference,
                                                                      message: _model
                                                                          .textController3
                                                                          .text,
                                                                      createdTime:
                                                                          getCurrentTimestamp,
                                                                      isSuggestion:
                                                                          true,
                                                                      isReport:
                                                                          false,
                                                                    ),
                                                                    feedbackRecordReference);
                                                        logFirebaseEvent(
                                                            'Button_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1000));
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'votre feedback a été envoyé!',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_navigate_back');
                                                        context.safePop();

                                                        setState(() {});
                                                      },
                                                      text: 'Envoyer',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 30.0))
                                                    .addToEnd(
                                                        SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: true,
                                            tapBodyToCollapse: true,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            iconSize: 30.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      width: double.infinity,
                                      color: Color(0x00000000),
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Text(
                                            'Rapport',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                          collapsed: Container(
                                            decoration: BoxDecoration(),
                                          ),
                                          expanded: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: Form(
                                              key: _model.formKey1,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController4,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Décrire votre nouvelle proposition...',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryTransparent,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      maxLines: 8,
                                                      validator: _model
                                                          .textController4Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'FEEDBACK_PAGE_ENVOYER_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        var feedbackRecordReference =
                                                            FeedbackRecord
                                                                .collection
                                                                .doc();
                                                        await feedbackRecordReference
                                                            .set(
                                                                createFeedbackRecordData(
                                                          message: _model
                                                              .textController4
                                                              .text,
                                                          createdTime:
                                                              getCurrentTimestamp,
                                                          isSuggestion: false,
                                                          isReport: true,
                                                          userRef:
                                                              currentUserReference,
                                                        ));
                                                        _model.newReportWeb = FeedbackRecord
                                                            .getDocumentFromData(
                                                                createFeedbackRecordData(
                                                                  message: _model
                                                                      .textController4
                                                                      .text,
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  isSuggestion:
                                                                      false,
                                                                  isReport:
                                                                      true,
                                                                  userRef:
                                                                      currentUserReference,
                                                                ),
                                                                feedbackRecordReference);
                                                        logFirebaseEvent(
                                                            'Button_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1000));
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'votre rapport a été envoyé!',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_navigate_back');
                                                        context.safePop();

                                                        setState(() {});
                                                      },
                                                      text: 'Envoyer',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 30.0))
                                                    .addToEnd(
                                                        SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: true,
                                            tapBodyToCollapse: true,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            iconSize: 30.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
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
        ));
  }
}
