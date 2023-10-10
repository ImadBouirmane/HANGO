import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_side_bar/admin_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_est_step2_model.dart';
export 'update_est_step2_model.dart';

class UpdateEstStep2Widget extends StatefulWidget {
  const UpdateEstStep2Widget({
    Key? key,
    required this.establishmentDetails,
  }) : super(key: key);

  final DocumentReference? establishmentDetails;

  @override
  _UpdateEstStep2WidgetState createState() => _UpdateEstStep2WidgetState();
}

class _UpdateEstStep2WidgetState extends State<UpdateEstStep2Widget> {
  late UpdateEstStep2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateEstStep2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UpdateEstStep2'});
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
        title: 'UpdateEstStep2',
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
                        model: _model.adminSideBarModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: AdminSideBarWidget(
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
                                          'UPDATE_EST_STEP2_chevron_left_ICN_ON_TAP');
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
                                        'Modification du l\'établissement',
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
                                          'UPDATE_EST_STEP2_PAGE_home_ICN_ON_TAP');
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.00, -1.00),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: StreamBuilder<
                                                    List<ScheduleRecord>>(
                                                  stream: queryScheduleRecord(
                                                    parent: widget
                                                        .establishmentDetails,
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
                                                    List<ScheduleRecord>
                                                        wrapScheduleRecordList =
                                                        snapshot.data!;
                                                    final wrapScheduleRecord =
                                                        wrapScheduleRecordList
                                                                .isNotEmpty
                                                            ? wrapScheduleRecordList
                                                                .first
                                                            : null;
                                                    return Wrap(
                                                      spacing: 50.0,
                                                      runSpacing: 15.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              if (wrapScheduleRecord
                                                                      ?.mondayIsClose ==
                                                                  false)
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.mondayOpeningController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.mondayOpening != null && wrapScheduleRecord?.mondayOpening != '' ? wrapScheduleRecord?.mondayOpening : '',
                                                                                  'Lundi ouverture',
                                                                                ),
                                                                              ),
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.mondayClosingController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.mondayClosing != null && wrapScheduleRecord?.mondayClosing != '' ? wrapScheduleRecord?.mondayClosing : '',
                                                                                  'Lundi fermeture',
                                                                                ),
                                                                              ),
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Fermé',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                          .mondayValue ??= wrapScheduleRecord?.mondayIsClose ==
                                                                              true
                                                                          ? true
                                                                          : false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.mondayValue =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_monday_ON_TOGGLE_ON');
                                                                          logFirebaseEvent(
                                                                              'monday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            mondayIsClose:
                                                                                true,
                                                                          ));
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_monday_ON_TOGGLE_OFF');
                                                                          logFirebaseEvent(
                                                                              'monday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            mondayIsClose:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 30.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              if (wrapScheduleRecord
                                                                      ?.tuesdayIsClose ==
                                                                  false)
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.tuesdayOpeningController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.tuesdayOpening != null && wrapScheduleRecord?.tuesdayOpening != '' ? wrapScheduleRecord?.tuesdayOpening : '',
                                                                                  'Mardi ouverture',
                                                                                ),
                                                                              ),
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.tuesdayClosingController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.tuesdayClosing != null && wrapScheduleRecord?.tuesdayClosing != '' ? wrapScheduleRecord?.tuesdayClosing : '',
                                                                                  'Mardi fermeture',
                                                                                ),
                                                                              ),
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Fermé',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                          .tuesdayValue ??= wrapScheduleRecord?.tuesdayIsClose ==
                                                                              true
                                                                          ? true
                                                                          : false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.tuesdayValue =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_tuesday_ON_TOGGLE_ON');
                                                                          logFirebaseEvent(
                                                                              'tuesday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            tuesdayIsClose:
                                                                                false,
                                                                          ));
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_tuesday_ON_TOGGLE_OFF');
                                                                          logFirebaseEvent(
                                                                              'tuesday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            tuesdayIsClose:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              if (wrapScheduleRecord
                                                                      ?.wednesdayIsClose ==
                                                                  false)
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.wednesdayOpeningController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.wednesdayOpening != null && wrapScheduleRecord?.wednesdayOpening != '' ? wrapScheduleRecord?.wednesdayOpening : '',
                                                                                  'Mercredi ouverture',
                                                                                ),
                                                                              ),
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.wednesdayClosingController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.wednesdayClosing != null && wrapScheduleRecord?.wednesdayClosing != '' ? wrapScheduleRecord?.wednesdayClosing : '',
                                                                                  'Mercredi fermeture',
                                                                                ),
                                                                              ),
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Fermé',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                          .wednesdayValue ??= wrapScheduleRecord?.wednesdayIsClose ==
                                                                              true
                                                                          ? true
                                                                          : false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.wednesdayValue =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_wednesday_ON_TOGGLE_ON');
                                                                          logFirebaseEvent(
                                                                              'wednesday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            wednesdayIsClose:
                                                                                true,
                                                                          ));
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_wednesday_ON_TOGGLE_OFF');
                                                                          logFirebaseEvent(
                                                                              'wednesday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            wednesdayIsClose:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              if (wrapScheduleRecord
                                                                      ?.thursdayIsClose ==
                                                                  false)
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.thursdayOpeningController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.thursdayOpening != null && wrapScheduleRecord?.thursdayOpening != '' ? wrapScheduleRecord?.thursdayOpening : '',
                                                                                  'Jeudi ouverture',
                                                                                ),
                                                                              ),
                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                '_model.thursdayOpeningController',
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.thursdayClosingController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.thursdayClosing != null && wrapScheduleRecord?.thursdayClosing != '' ? wrapScheduleRecord?.thursdayClosing : '',
                                                                                  'Jeudi fermeture',
                                                                                ),
                                                                              ),
                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                '_model.thursdayClosingController',
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Fermé',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                          .thursdayValue ??= wrapScheduleRecord?.thursdayIsClose ==
                                                                              true
                                                                          ? true
                                                                          : false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.thursdayValue =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_thursday_ON_TOGGLE_ON');
                                                                          logFirebaseEvent(
                                                                              'thursday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            thursdayIsClose:
                                                                                true,
                                                                          ));
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_thursday_ON_TOGGLE_OFF');
                                                                          logFirebaseEvent(
                                                                              'thursday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            thursdayIsClose:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              if (wrapScheduleRecord
                                                                      ?.fridayIsClose ==
                                                                  false)
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.fridayOpeningController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.fridayOpening != null && wrapScheduleRecord?.fridayOpening != '' ? wrapScheduleRecord?.fridayOpening : '',
                                                                                  'Vendredi ouverture',
                                                                                ),
                                                                              ),
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.fridayClosingController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.fridayClosing != null && wrapScheduleRecord?.fridayClosing != '' ? wrapScheduleRecord?.fridayClosing : '',
                                                                                  'Vendredi fermeture',
                                                                                ),
                                                                              ),
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Fermé',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                          .fridayValue ??= wrapScheduleRecord?.fridayIsClose ==
                                                                              true
                                                                          ? true
                                                                          : false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.fridayValue =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_friday_ON_TOGGLE_ON');
                                                                          logFirebaseEvent(
                                                                              'friday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            fridayIsClose:
                                                                                true,
                                                                          ));
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_friday_ON_TOGGLE_OFF');
                                                                          logFirebaseEvent(
                                                                              'friday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            fridayIsClose:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              if ((wrapScheduleRecord
                                                                          ?.saturdayIsClose ==
                                                                      false) &&
                                                                  responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    tablet:
                                                                        false,
                                                                  ))
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.saturdayOpeningController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.saturdayOpening != null && wrapScheduleRecord?.saturdayOpening != '' ? wrapScheduleRecord?.saturdayOpening : '',
                                                                                  'Samedi ouverture',
                                                                                ),
                                                                              ),
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.saturdayClosingController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.saturdayClosing != null && wrapScheduleRecord?.saturdayClosing != '' ? wrapScheduleRecord?.saturdayClosing : '',
                                                                                  'Samedi fermeture',
                                                                                ),
                                                                              ),
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Fermé',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                          .saturdayValue ??= wrapScheduleRecord?.saturdayIsClose ==
                                                                              true
                                                                          ? true
                                                                          : false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.saturdayValue =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_saturday_ON_TOGGLE_ON');
                                                                          logFirebaseEvent(
                                                                              'saturday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            saturdayIsClose:
                                                                                true,
                                                                          ));
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_saturday_ON_TOGGLE_OFF');
                                                                          logFirebaseEvent(
                                                                              'saturday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            saturdayIsClose:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              if (wrapScheduleRecord
                                                                      ?.sundayIsClose ==
                                                                  false)
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.sundayOpeningController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.sundayOpening != null && wrapScheduleRecord?.sundayOpening != '' ? wrapScheduleRecord?.sundayOpening : '',
                                                                                  'Dimanche ouverture',
                                                                                ),
                                                                              ),
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.08,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.sundayClosingController ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  wrapScheduleRecord?.sundayClosing != null && wrapScheduleRecord?.sundayClosing != '' ? wrapScheduleRecord?.sundayClosing : '',
                                                                                  'Dimanche fermeture',
                                                                                ),
                                                                              ),
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
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Fermé',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child:
                                                                        Checkbox(
                                                                      value: _model
                                                                          .sundayValue ??= wrapScheduleRecord?.sundayIsClose ==
                                                                              true
                                                                          ? true
                                                                          : false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.sundayValue =
                                                                                newValue!);
                                                                        if (newValue!) {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_sunday_ON_TOGGLE_ON');
                                                                          logFirebaseEvent(
                                                                              'sunday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            sundayIsClose:
                                                                                true,
                                                                          ));
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'UPDATE_EST_STEP2_sunday_ON_TOGGLE_OFF');
                                                                          logFirebaseEvent(
                                                                              'sunday_backend_call');

                                                                          await wrapScheduleRecord!
                                                                              .reference
                                                                              .update(createScheduleRecordData(
                                                                            sundayIsClose:
                                                                                false,
                                                                          ));
                                                                        }
                                                                      },
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // still some calls for schedule I will complete next two hours
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 15.0, 15.0),
                                        child:
                                            StreamBuilder<List<ScheduleRecord>>(
                                          stream: queryScheduleRecord(
                                            parent: widget.establishmentDetails,
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
                                            List<ScheduleRecord>
                                                bTNValidateFromScheduleRecordList =
                                                snapshot.data!;
                                            final bTNValidateFromScheduleRecord =
                                                bTNValidateFromScheduleRecordList
                                                        .isNotEmpty
                                                    ? bTNValidateFromScheduleRecordList
                                                        .first
                                                    : null;
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'UPDATE_EST_STEP2_BTNValidateFrom_ON_TAP');
                                                logFirebaseEvent(
                                                    'BTNValidateFrom_backend_call');

                                                await bTNValidateFromScheduleRecord!
                                                    .reference
                                                    .update(
                                                        createScheduleRecordData(
                                                  mondayIsClose: _model
                                                              .mondayValue !=
                                                          null
                                                      ? _model.mondayValue
                                                      : bTNValidateFromScheduleRecord
                                                          ?.mondayIsClose,
                                                  tuesdayIsClose: _model
                                                              .tuesdayValue !=
                                                          null
                                                      ? _model.tuesdayValue
                                                      : bTNValidateFromScheduleRecord
                                                          ?.tuesdayIsClose,
                                                  wednesdayIsClose: _model
                                                              .wednesdayValue !=
                                                          null
                                                      ? _model.wednesdayValue
                                                      : bTNValidateFromScheduleRecord
                                                          ?.wednesdayIsClose,
                                                  thursdayIsClose: _model
                                                              .thursdayValue !=
                                                          null
                                                      ? _model.thursdayValue
                                                      : bTNValidateFromScheduleRecord
                                                          ?.thursdayIsClose,
                                                  fridayIsClose: _model
                                                              .fridayValue !=
                                                          null
                                                      ? _model.fridayValue
                                                      : bTNValidateFromScheduleRecord
                                                          ?.fridayIsClose,
                                                  saturdayIsClose: _model
                                                              .saturdayValue !=
                                                          null
                                                      ? _model.saturdayValue
                                                      : bTNValidateFromScheduleRecord
                                                          ?.saturdayIsClose,
                                                  sundayIsClose: _model
                                                              .sundayValue !=
                                                          null
                                                      ? _model.sundayValue
                                                      : bTNValidateFromScheduleRecord
                                                          ?.sundayIsClose,
                                                  mondayOpening: _model
                                                                  .mondayOpeningController
                                                                  .text !=
                                                              null &&
                                                          _model.mondayOpeningController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .mondayOpeningController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.mondayOpening,
                                                  mondayClosing: _model
                                                                  .mondayClosingController
                                                                  .text !=
                                                              null &&
                                                          _model.mondayClosingController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .mondayClosingController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.mondayClosing,
                                                  tuesdayOpening: _model
                                                                  .tuesdayOpeningController
                                                                  .text !=
                                                              null &&
                                                          _model.tuesdayOpeningController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .tuesdayOpeningController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.tuesdayOpening,
                                                  tuesdayClosing: _model
                                                                  .tuesdayClosingController
                                                                  .text !=
                                                              null &&
                                                          _model.tuesdayClosingController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .tuesdayClosingController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.tuesdayClosing,
                                                  wednesdayOpening: _model
                                                                  .wednesdayOpeningController
                                                                  .text !=
                                                              null &&
                                                          _model.wednesdayOpeningController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .wednesdayOpeningController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.wednesdayOpening,
                                                  wednesdayClosing: _model
                                                                  .wednesdayClosingController
                                                                  .text !=
                                                              null &&
                                                          _model.wednesdayClosingController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .wednesdayClosingController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.wednesdayClosing,
                                                  thursdayOpening: _model
                                                                  .thursdayOpeningController
                                                                  .text !=
                                                              null &&
                                                          _model.thursdayOpeningController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .thursdayOpeningController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.thursdayOpening,
                                                  thursdayClosing: _model
                                                                  .thursdayClosingController
                                                                  .text !=
                                                              null &&
                                                          _model.thursdayClosingController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .thursdayClosingController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.thursdayClosing,
                                                  fridayOpening: _model
                                                                  .fridayOpeningController
                                                                  .text !=
                                                              null &&
                                                          _model.fridayOpeningController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .fridayOpeningController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.fridayOpening,
                                                  fridayClosing: _model
                                                                  .fridayClosingController
                                                                  .text !=
                                                              null &&
                                                          _model.fridayClosingController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .fridayClosingController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.fridayClosing,
                                                  saturdayOpening: _model
                                                                  .saturdayOpeningController
                                                                  .text !=
                                                              null &&
                                                          _model.saturdayOpeningController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .saturdayOpeningController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.saturdayOpening,
                                                  saturdayClosing: _model
                                                                  .saturdayClosingController
                                                                  .text !=
                                                              null &&
                                                          _model.saturdayClosingController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .saturdayClosingController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.saturdayClosing,
                                                  sundayOpening: _model
                                                                  .sundayOpeningController
                                                                  .text !=
                                                              null &&
                                                          _model.sundayOpeningController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .sundayOpeningController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.sundayOpening,
                                                  sundayClosing: _model
                                                                  .sundayClosingController
                                                                  .text !=
                                                              null &&
                                                          _model.sundayClosingController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .sundayClosingController
                                                          .text
                                                      : bTNValidateFromScheduleRecord
                                                          ?.sundayClosing,
                                                  estblishmentRef: widget
                                                      .establishmentDetails,
                                                  updatedAt:
                                                      getCurrentTimestamp,
                                                ));
                                                logFirebaseEvent(
                                                    'BTNValidateFrom_navigate_to');

                                                context.pushNamed(
                                                  'UpdateEstStep3',
                                                  queryParameters: {
                                                    'establishmentDetails':
                                                        serializeParam(
                                                      widget
                                                          .establishmentDetails,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: 'Continuer',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            );
                                          },
                                        ),
                                      ),
                                    ],
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
