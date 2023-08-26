import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'step2_schedule_est_model.dart';
export 'step2_schedule_est_model.dart';

class Step2ScheduleEstWidget extends StatefulWidget {
  const Step2ScheduleEstWidget({
    Key? key,
    required this.estRef,
  }) : super(key: key);

  final DocumentReference? estRef;

  @override
  _Step2ScheduleEstWidgetState createState() => _Step2ScheduleEstWidgetState();
}

class _Step2ScheduleEstWidgetState extends State<Step2ScheduleEstWidget> {
  late Step2ScheduleEstModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step2ScheduleEstModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'step2ScheduleEst'});
    _model.mondayOpeningController ??= TextEditingController();
    _model.mondayClosingController ??= TextEditingController();
    _model.thursdayOpeningController ??= TextEditingController();
    _model.thursdayClosingController ??= TextEditingController();
    _model.wednesdayOpeningController ??= TextEditingController();
    _model.wednesdayClosingController ??= TextEditingController();
    _model.tuesdayOpeningController ??= TextEditingController();
    _model.tuesdayClosingController ??= TextEditingController();
    _model.fridayOpeningController ??= TextEditingController();
    _model.fridayClosingController ??= TextEditingController();
    _model.saturdayOpeningController ??= TextEditingController();
    _model.saturdayClosingController ??= TextEditingController();
    _model.sundayOpeningController ??= TextEditingController();
    _model.sundayClosingController ??= TextEditingController();
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
        title: 'step2ScheduleEst',
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
                          twoBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          twoIcon: Icon(
                            Icons.event,
                          ),
                          threeColor: FlutterFlowTheme.of(context).tertiary400,
                          threeIcon: Icon(
                            Icons.house_outlined,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
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
                                          'STEP2_SCHEDULE_EST_chevron_left_ICN_ON_T');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Créer un nouvelle établissement',
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 20.0),
                                                child: SingleChildScrollView(
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
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Les horaires',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Wrap(
                                                            spacing: 50.0,
                                                            runSpacing: 15.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      'Lundi',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    if (FFAppState()
                                                                            .visibleStateScheduleMonday ==
                                                                        true)
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.mondayOpeningController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.mondayOpeningController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Lundi Ouverture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.mondayOpeningController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.mondayOpeningController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.mondayOpeningControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.mondayClosingController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.mondayClosingController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Lundi Fermeture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.mondayClosingController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.mondayClosingController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.mondayClosingControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Fermé',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.mondayValue ??= FFAppState().visibleStateScheduleMonday == false
                                                                                ? true
                                                                                : false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.mondayValue = newValue!);
                                                                              if (newValue!) {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_monday_ON_TOGGLE_ON');
                                                                                logFirebaseEvent('monday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleMonday = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_monday_ON_TOGGLE_OFF');
                                                                                logFirebaseEvent('monday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleMonday = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          30.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      'Mardi',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                              .visibleStateScheduleTuesday ==
                                                                          true,
                                                                      true,
                                                                    ))
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.thursdayOpeningController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.thursdayOpeningController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Jeudi Ouverture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.thursdayOpeningController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.thursdayOpeningController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.thursdayOpeningControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.thursdayClosingController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.thursdayClosingController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Jeudi Fermeture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.thursdayClosingController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.thursdayClosingController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.thursdayClosingControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Fermé',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.tuesdayValue ??= FFAppState().visibleStateScheduleTuesday == false
                                                                                ? true
                                                                                : false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.tuesdayValue = newValue!);
                                                                              if (newValue!) {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_tuesday_ON_TOGGLE_ON');
                                                                                logFirebaseEvent('tuesday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleTuesday = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_tuesday_ON_TOGGLE_OFF');
                                                                                logFirebaseEvent('tuesday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleTuesday = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      'Mercredi',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                              .visibleStateScheduleWednesday ==
                                                                          true,
                                                                      true,
                                                                    ))
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.wednesdayOpeningController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.wednesdayOpeningController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Mercredi Ouverture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.wednesdayOpeningController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.wednesdayOpeningController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.wednesdayOpeningControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.wednesdayClosingController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.wednesdayClosingController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Mercredi Fermeture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.wednesdayClosingController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.wednesdayClosingController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.wednesdayClosingControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Fermé',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.wednesdayValue ??= FFAppState().visibleStateScheduleWednesday == false
                                                                                ? true
                                                                                : false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.wednesdayValue = newValue!);
                                                                              if (newValue!) {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_wednesday_ON_TOGGLE_O');
                                                                                logFirebaseEvent('wednesday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleWednesday = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_wednesday_ON_TOGGLE_O');
                                                                                logFirebaseEvent('wednesday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleWednesday = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Jeudi',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                              .visibleStateScheduleThursday ==
                                                                          true,
                                                                      true,
                                                                    ))
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.tuesdayOpeningController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.tuesdayOpeningController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Mardi Ouverture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.tuesdayOpeningController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.tuesdayOpeningController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.tuesdayOpeningControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.tuesdayClosingController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.tuesdayClosingController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Mardi Fermeture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.tuesdayClosingController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.tuesdayClosingController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.tuesdayClosingControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Fermé',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.thursdayValue ??= FFAppState().visibleStateScheduleThursday == false
                                                                                ? true
                                                                                : false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.thursdayValue = newValue!);
                                                                              if (newValue!) {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_thursday_ON_TOGGLE_ON');
                                                                                logFirebaseEvent('thursday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleThursday = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_thursday_ON_TOGGLE_OF');
                                                                                logFirebaseEvent('thursday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleThursday = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      'Vendredi',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                              .visibleStateScheduleFriday ==
                                                                          true,
                                                                      true,
                                                                    ))
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.fridayOpeningController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.fridayOpeningController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Vendredi Ouverture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.fridayOpeningController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.fridayOpeningController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.fridayOpeningControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.fridayClosingController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.fridayClosingController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Vendredi Fermeture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.fridayClosingController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.fridayClosingController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.fridayClosingControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Fermé',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.fridayValue ??= FFAppState().visibleStateScheduleFriday == false
                                                                                ? true
                                                                                : false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.fridayValue = newValue!);
                                                                              if (newValue!) {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_friday_ON_TOGGLE_ON');
                                                                                logFirebaseEvent('friday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleFriday = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_friday_ON_TOGGLE_OFF');
                                                                                logFirebaseEvent('friday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleFriday = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      'Samedi',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    if (valueOrDefault<
                                                                            bool>(
                                                                          FFAppState().visibleStateScheduleSaturday ==
                                                                              true,
                                                                          true,
                                                                        ) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.saturdayOpeningController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.saturdayOpeningController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Samedi Ouverture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.saturdayOpeningController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.saturdayOpeningController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.saturdayOpeningControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.saturdayClosingController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.saturdayClosingController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Samedi Fermeture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.saturdayClosingController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.saturdayClosingController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.saturdayClosingControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Fermé',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.saturdayValue ??= FFAppState().visibleStateScheduleSaturday == false
                                                                                ? true
                                                                                : false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.saturdayValue = newValue!);
                                                                              if (newValue!) {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_saturday_ON_TOGGLE_ON');
                                                                                logFirebaseEvent('saturday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleSaturday = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_saturday_ON_TOGGLE_OF');
                                                                                logFirebaseEvent('saturday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleSaturday = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      'Dimanche',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                              .visibleStateScheduleSunday ==
                                                                          true,
                                                                      true,
                                                                    ))
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.sundayOpeningController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.sundayOpeningController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Dimanche Ouverture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.sundayOpeningController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.sundayOpeningController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.sundayOpeningControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                  child: TextFormField(
                                                                                    controller: _model.sundayClosingController,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.sundayClosingController',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    textInputAction: TextInputAction.done,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Dimanche Fermeture',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintText: '00:00 ',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                      suffixIcon: _model.sundayClosingController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.sundayClosingController?.clear();
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.datetime,
                                                                                    validator: _model.sundayClosingControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Fermé',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.sundayValue ??= FFAppState().visibleStateScheduleSunday == false
                                                                                ? true
                                                                                : false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.sundayValue = newValue!);
                                                                              if (newValue!) {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_sunday_ON_TOGGLE_ON');
                                                                                logFirebaseEvent('sunday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleSunday = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('STEP2_SCHEDULE_EST_sunday_ON_TOGGLE_OFF');
                                                                                logFirebaseEvent('sunday_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().visibleStateScheduleSunday = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 15.0))
                                                        .around(SizedBox(
                                                            height: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'STEP2_SCHEDULE_EST_BTNValidateFrom_ON_TA');
                                            logFirebaseEvent(
                                                'BTNValidateFrom_backend_call');

                                            var scheduleRecordReference =
                                                ScheduleRecord.createDoc(
                                                    widget.estRef!);
                                            await scheduleRecordReference
                                                .set(createScheduleRecordData(
                                              mondayOpening:
                                                  valueOrDefault<String>(
                                                _model.mondayOpeningController
                                                    .text,
                                                'Aucune',
                                              ),
                                              mondayIsClose: _model.mondayValue,
                                              tuesdayIsClose:
                                                  _model.tuesdayValue,
                                              wednesdayIsClose:
                                                  _model.wednesdayValue,
                                              thursdayIsClose:
                                                  _model.thursdayValue,
                                              fridayIsClose: _model.fridayValue,
                                              saturdayIsClose:
                                                  _model.saturdayValue,
                                              sundayIsClose: _model.sundayValue,
                                              mondayClosing:
                                                  valueOrDefault<String>(
                                                _model.mondayClosingController
                                                    .text,
                                                'Aucune',
                                              ),
                                              tuesdayOpening:
                                                  valueOrDefault<String>(
                                                _model.tuesdayOpeningController
                                                    .text,
                                                'Aucune',
                                              ),
                                              tuesdayClosing:
                                                  valueOrDefault<String>(
                                                _model.tuesdayClosingController
                                                    .text,
                                                'Aucune',
                                              ),
                                              wednesdayOpening:
                                                  valueOrDefault<String>(
                                                _model
                                                    .wednesdayOpeningController
                                                    .text,
                                                'Aucune',
                                              ),
                                              wednesdayClosing:
                                                  valueOrDefault<String>(
                                                _model
                                                    .wednesdayClosingController
                                                    .text,
                                                'Aucune',
                                              ),
                                              thursdayOpening:
                                                  valueOrDefault<String>(
                                                _model.thursdayOpeningController
                                                    .text,
                                                'Aucune',
                                              ),
                                              thursdayClosing:
                                                  valueOrDefault<String>(
                                                _model.thursdayClosingController
                                                    .text,
                                                'Aucune',
                                              ),
                                              fridayOpening:
                                                  valueOrDefault<String>(
                                                _model.fridayOpeningController
                                                    .text,
                                                'Aucune',
                                              ),
                                              fridayClosing:
                                                  valueOrDefault<String>(
                                                _model.fridayClosingController
                                                    .text,
                                                'Aucune',
                                              ),
                                              saturdayOpening:
                                                  valueOrDefault<String>(
                                                _model.saturdayOpeningController
                                                    .text,
                                                'Aucune',
                                              ),
                                              saturdayClosing:
                                                  valueOrDefault<String>(
                                                _model.saturdayClosingController
                                                    .text,
                                                'Aucune',
                                              ),
                                              sundayOpening:
                                                  valueOrDefault<String>(
                                                _model.sundayOpeningController
                                                    .text,
                                                'Aucune',
                                              ),
                                              sundayClosing:
                                                  valueOrDefault<String>(
                                                _model.sundayClosingController
                                                    .text,
                                                'Aucune',
                                              ),
                                            ));
                                            _model.estScheduleInput =
                                                ScheduleRecord
                                                    .getDocumentFromData(
                                                        createScheduleRecordData(
                                                          mondayOpening:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .mondayOpeningController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          mondayIsClose: _model
                                                              .mondayValue,
                                                          tuesdayIsClose: _model
                                                              .tuesdayValue,
                                                          wednesdayIsClose: _model
                                                              .wednesdayValue,
                                                          thursdayIsClose: _model
                                                              .thursdayValue,
                                                          fridayIsClose: _model
                                                              .fridayValue,
                                                          saturdayIsClose: _model
                                                              .saturdayValue,
                                                          sundayIsClose: _model
                                                              .sundayValue,
                                                          mondayClosing:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .mondayClosingController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          tuesdayOpening:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .tuesdayOpeningController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          tuesdayClosing:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .tuesdayClosingController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          wednesdayOpening:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .wednesdayOpeningController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          wednesdayClosing:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .wednesdayClosingController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          thursdayOpening:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .thursdayOpeningController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          thursdayClosing:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .thursdayClosingController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          fridayOpening:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .fridayOpeningController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          fridayClosing:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .fridayClosingController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          saturdayOpening:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .saturdayOpeningController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          saturdayClosing:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .saturdayClosingController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          sundayOpening:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .sundayOpeningController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                          sundayClosing:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .sundayClosingController
                                                                .text,
                                                            'Aucune',
                                                          ),
                                                        ),
                                                        scheduleRecordReference);
                                            logFirebaseEvent(
                                                'BTNValidateFrom_navigate_to');

                                            context.pushNamed(
                                              'step3MediaEst',
                                              queryParameters: {
                                                'estRef': serializeParam(
                                                  widget.estRef,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );

                                            setState(() {});
                                          },
                                          text: 'Suivant',
                                          options: FFButtonOptions(
                                            width: 300.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(height: 20.0)),
                                    ),
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
