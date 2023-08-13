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
import 'filter_events_model.dart';
export 'filter_events_model.dart';

class FilterEventsWidget extends StatefulWidget {
  const FilterEventsWidget({
    Key? key,
    required this.eventRef,
  }) : super(key: key);

  final EventsRecord? eventRef;

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
                    List<EventsRecord> columnEventsRecordList = snapshot.data!;
                    final columnEventsRecord = columnEventsRecordList.isNotEmpty
                        ? columnEventsRecordList.first
                        : null;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Filtres',
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
                                    'Thème d\'événement',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  collapsed: Container(
                                    decoration: BoxDecoration(),
                                  ),
                                  expanded: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('Football'),
                                        ChipData('DJ'),
                                        ChipData('Showcase'),
                                        ChipData('Karaoke'),
                                        ChipData('Music Live'),
                                        ChipData('Sport')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .choiceChipsValue1 = val?.first),
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
                                          _model.choiceChipsValueController1 ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
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
                                      options: [
                                        ChipData('Football'),
                                        ChipData('DJ'),
                                        ChipData('Showcase'),
                                        ChipData('Karaoke'),
                                        ChipData('Music Live'),
                                        ChipData('Sport')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .choiceChipsValue2 = val?.first),
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
                                          _model.choiceChipsValueController2 ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
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
                                },
                                title: Text(
                                  'Weekend',
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
                                },
                                title: Text(
                                  'Jeudredi',
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
                                },
                                title: Text(
                                  'Entrée gratuite',
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
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
                                      context.pushNamed('eventFilterResult');
                                    },
                                    text: 'Voir les résultats (8)',
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
