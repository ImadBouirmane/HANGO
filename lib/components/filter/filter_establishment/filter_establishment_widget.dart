import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_establishment_model.dart';
export 'filter_establishment_model.dart';

class FilterEstablishmentWidget extends StatefulWidget {
  const FilterEstablishmentWidget({Key? key}) : super(key: key);

  @override
  _FilterEstablishmentWidgetState createState() =>
      _FilterEstablishmentWidgetState();
}

class _FilterEstablishmentWidgetState extends State<FilterEstablishmentWidget> {
  late FilterEstablishmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterEstablishmentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Material(
        color: Colors.transparent,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.9,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 10.0,
                  thickness: 2.0,
                  indent: 150.0,
                  endIndent: 150.0,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: StreamBuilder<List<EstablishmentsRecord>>(
                    stream: queryEstablishmentsRecord(
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
                      List<EstablishmentsRecord>
                          columnEstablishmentsRecordList = snapshot.data!;
                      final columnEstablishmentsRecord =
                          columnEstablishmentsRecordList.isNotEmpty
                              ? columnEstablishmentsRecordList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    'Filtre un établissement',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryTransparent,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'FILTER_ESTABLISHMENT_close_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_bottom_sheet');
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Type d\'établissement',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  collapsed: Container(
                                    decoration: BoxDecoration(),
                                  ),
                                  expanded: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: FFAppState()
                                          .TypeOfEstablishment
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.typeEstablishmentValue =
                                                val?.first);
                                        logFirebaseEvent(
                                            'FILTER_ESTABLISHMENT_typeEstablishment_O');
                                        logFirebaseEvent(
                                            'typeEstablishment_update_app_state');
                                        setState(() {
                                          FFAppState().themeEvent =
                                              _model.typeEstablishmentValue!;
                                          FFAppState().updateClickCountAtIndex(
                                            1,
                                            (e) => e + 1,
                                          );
                                        });
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                        iconColor: Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 7.0, 20.0, 7.0),
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0x00000000),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        iconColor: Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 7.0, 20.0, 7.0),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      chipSpacing: 25.0,
                                      rowSpacing: 15.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .typeEstablishmentValueController ??=
                                          FormFieldController<List<String>>(
                                        [],
                                      ),
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: true,
                                    tapBodyToCollapse: true,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    iconSize: 30.0,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Genre musical',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  collapsed: Container(
                                    decoration: BoxDecoration(),
                                  ),
                                  expanded: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: FFAppState()
                                          .MusicStyle
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.musicTypeValue = val?.first);
                                        logFirebaseEvent(
                                            'FILTER_ESTABLISHMENT_musicType_ON_FORM_W');
                                        logFirebaseEvent(
                                            'musicType_update_app_state');
                                        setState(() {
                                          FFAppState().musicType =
                                              _model.musicTypeValue!;
                                          FFAppState().updateClickCountAtIndex(
                                            2,
                                            (e) => e + 1,
                                          );
                                        });
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                        iconColor: Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 7.0, 20.0, 7.0),
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Color(0x00000000),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        iconColor: Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 7.0, 20.0, 7.0),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      chipSpacing: 25.0,
                                      rowSpacing: 15.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.musicTypeValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: true,
                                    tapBodyToCollapse: true,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    iconSize: 30.0,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              SwitchListTile(
                                value: _model.switchListTileValue1 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue1 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_vkfj');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().weekend = true;
                                      FFAppState().updateClickCountAtIndex(
                                        3,
                                        (e) => e + 1,
                                      );
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_vkfj');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().weekend = false;
                                    });
                                  }
                                },
                                title: Text(
                                  'Terrasse',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              SwitchListTile(
                                value: _model.switchListTileValue2 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue2 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_nbnw');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().jeudredi = true;
                                      FFAppState().updateClickCountAtIndex(
                                        4,
                                        (e) => e + 1,
                                      );
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_nbnw');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().jeudredi = false;
                                      FFAppState().updateClickCountAtIndex(
                                        4,
                                        (e) => e + 1,
                                      );
                                    });
                                  }
                                },
                                title: Text(
                                  'Réservation',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              SwitchListTile(
                                value: _model.switchListTileValue3 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue3 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_ehc2');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().freeEnter = true;
                                      FFAppState().updateClickCountAtIndex(
                                        5,
                                        (e) => e + 1,
                                      );
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_ehc2');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().freeEnter = false;
                                    });
                                  }
                                },
                                title: Text(
                                  'Machine à cigarette',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              SwitchListTile(
                                value: _model.switchListTileValue4 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue4 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_h0wk');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().booked = true;
                                      FFAppState().updateClickCountAtIndex(
                                        6,
                                        (e) => e + 1,
                                      );
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_h0wk');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().booked = false;
                                    });
                                  }
                                },
                                title: Text(
                                  'Nourriture',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              SwitchListTile(
                                value: _model.switchListTileValue5 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue5 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_w6zz');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().booked = true;
                                      FFAppState().updateClickCountAtIndex(
                                        6,
                                        (e) => e + 1,
                                      );
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_w6zz');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().booked = false;
                                    });
                                  }
                                },
                                title: Text(
                                  'Jeux',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                subtitle: Text(
                                  'Billard, fléchettes, bord, cartes,...',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              SwitchListTile(
                                value: _model.switchListTileValue6 ??=
                                    FFAppState().isOpen,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue6 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_mk5a');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().booked = true;
                                      FFAppState().updateClickCountAtIndex(
                                        6,
                                        (e) => e + 1,
                                      );
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'FILTER_ESTABLISHMENT_SwitchListTile_mk5a');
                                    logFirebaseEvent(
                                        'SwitchListTile_update_app_state');
                                    setState(() {
                                      FFAppState().booked = false;
                                    });
                                  }
                                },
                                title: Text(
                                  'Ouvert',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'FILTER_ESTABLISHMENT_SUPPRIMER_LES_FILTR');
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      setState(() {
                                        FFAppState().themeEvent = '';
                                        FFAppState().musicType = '';
                                        FFAppState().weekend = false;
                                        FFAppState().jeudredi = false;
                                        FFAppState().freeEnter = false;
                                        FFAppState().booked = false;
                                        FFAppState().clickCount = [];
                                      });
                                    },
                                    text: 'Supprimer les filtres',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .tertiary400,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16.0,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'FILTER_ESTABLISHMENT_COMP__BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        'establishmentFilterResults',
                                        queryParameters: {
                                          'type': serializeParam(
                                            _model.typeEstablishmentValue,
                                            ParamType.String,
                                          ),
                                          'artist': serializeParam(
                                            _model.musicTypeValue,
                                            ParamType.String,
                                          ),
                                          'terrasse': serializeParam(
                                            _model.switchListTileValue1,
                                            ParamType.bool,
                                          ),
                                          'reservation': serializeParam(
                                            _model.switchListTileValue2,
                                            ParamType.bool,
                                          ),
                                          'machineacigarette': serializeParam(
                                            _model.switchListTileValue3,
                                            ParamType.bool,
                                          ),
                                          'nourriture': serializeParam(
                                            _model.switchListTileValue4,
                                            ParamType.bool,
                                          ),
                                          'jeux': serializeParam(
                                            _model.switchListTileValue5,
                                            ParamType.bool,
                                          ),
                                          'ouvert': serializeParam(
                                            _model.switchListTileValue6,
                                            ParamType.bool,
                                          ),
                                          'estbRef': serializeParam(
                                            columnEstablishmentsRecord
                                                ?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: valueOrDefault<String>(
                                      'Voir les résultats ${(FFAppState().clickCount.contains(FFAppState().clickCount.length) != null).toString()}${FFAppState().clickCount.contains(FFAppState().clickCount.length) != null ? FFAppState().clickCount.length.toString() : null}${(FFAppState().clickCount.contains(FFAppState().clickCount.length) != null).toString()}',
                                      'Voir les résultats ',
                                    ),
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF10212E),
                                            fontSize: 16.0,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ].divide(SizedBox(height: 30.0)),
                      );
                    },
                  ),
                ),
              ].addToEnd(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
