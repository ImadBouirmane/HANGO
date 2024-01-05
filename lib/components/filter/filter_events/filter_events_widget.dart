import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_events_model.dart';
export 'filter_events_model.dart';

class FilterEventsWidget extends StatefulWidget {
  const FilterEventsWidget({super.key});

  @override
  _FilterEventsWidgetState createState() => _FilterEventsWidgetState();
}

class _FilterEventsWidgetState extends State<FilterEventsWidget> {
  late FilterEventsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterEventsModel());

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
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
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Material(
        color: Colors.transparent,
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: StreamBuilder<List<EventsRecord>>(
                    stream: queryEventsRecord(
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
                      List<EventsRecord> columnEventsRecordList =
                          snapshot.data!;
                      final columnEventsRecord =
                          columnEventsRecordList.isNotEmpty
                              ? columnEventsRecordList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Filtrer les événements',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
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
                                      'FILTER_EVENTS_COMP_close_ICN_ON_TAP');
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
                                controller: _model.expandableController1,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Thème d\'événement',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  collapsed: Container(
                                    decoration: const BoxDecoration(),
                                  ),
                                  expanded: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: FFAppState()
                                          .TypeOfEvent
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.typeValue = val?.first),
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
                                        iconColor: const Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 7.0, 20.0, 7.0),
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: const Color(0x00000000),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        iconColor: const Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 7.0, 20.0, 7.0),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      chipSpacing: 25.0,
                                      rowSpacing: 15.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller: _model.typeValueController ??=
                                          FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
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
                                controller: _model.expandableController2,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Genre musical',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  collapsed: Container(
                                    decoration: const BoxDecoration(),
                                  ),
                                  expanded: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: FFAppState()
                                          .MusicStyle
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.musicValue = val?.first),
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
                                        iconColor: const Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 7.0, 20.0, 7.0),
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: const Color(0x00000000),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        iconColor: const Color(0x00000000),
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
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
                                          _model.musicValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SwitchListTile(
                                value: _model.switchListTileValue1 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue1 = newValue);
                                },
                                title: Text(
                                  'Weekend',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: const Color(0xFFF5F5F5),
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
                                      _model.switchListTileValue2 = newValue);
                                },
                                title: Text(
                                  'Jeudi',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: const Color(0xFFF5F5F5),
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
                                      _model.switchListTileValue3 = newValue);
                                },
                                title: Text(
                                  'Entrée gratuite',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: const Color(0xFFF5F5F5),
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
                                      _model.switchListTileValue4 = newValue);
                                },
                                title: Text(
                                  'Réservation',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                tileColor: const Color(0xFFF5F5F5),
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
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Supprimer les filtres',
                                    options: FFButtonOptions(
                                      padding: const EdgeInsets.all(20.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                      borderSide: const BorderSide(
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
                                          'FILTER_EVENTS_VOIR_LES_RÉSULTATS_BTN_ON_');
                                      logFirebaseEvent('Button_navigate_to');
                                    },
                                    text: 'Voir les résultats ',
                                    options: FFButtonOptions(
                                      padding: const EdgeInsets.all(20.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF10212E),
                                            fontSize: 16.0,
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 5.0)),
                          ),
                        ]
                            .divide(const SizedBox(height: 30.0))
                            .around(const SizedBox(height: 30.0)),
                      );
                    },
                  ),
                ),
              ].addToEnd(const SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
