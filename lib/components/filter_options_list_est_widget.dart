import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_options_list_est_model.dart';
export 'filter_options_list_est_model.dart';

class FilterOptionsListEstWidget extends StatefulWidget {
  const FilterOptionsListEstWidget({
    super.key,
    bool? parameter1,
  }) : parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<FilterOptionsListEstWidget> createState() =>
      _FilterOptionsListEstWidgetState();
}

class _FilterOptionsListEstWidgetState
    extends State<FilterOptionsListEstWidget> {
  late FilterOptionsListEstModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterOptionsListEstModel());

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

    return Visibility(
      visible: valueOrDefault<bool>(
        widget.parameter1 == true ? true : false,
        false,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
        child: Wrap(
          spacing: 0.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ExpandableNotifier(
                    controller: _model.expandableController1,
                    child: ExpandablePanel(
                      header: Text(
                        'Type ',
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                      collapsed: Container(
                        decoration: const BoxDecoration(),
                      ),
                      expanded: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: FFAppState()
                              .TypeOfEstablishment
                              .map((label) => ChipData(label))
                              .toList(),
                          onChanged: (val) async {
                            setState(() =>
                                _model.typeEstablishmentChoicesValue =
                                    val?.firstOrNull);
                            logFirebaseEvent(
                                'FILTER_OPTIONS_LIST_EST_typeEstablishmen');
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                            iconColor: const Color(0x00000000),
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 7.0, 20.0, 7.0),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: const Color(0x00000000),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            iconColor: const Color(0x00000000),
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 7.0, 20.0, 7.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          chipSpacing: 25.0,
                          rowSpacing: 15.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller:
                              _model.typeEstablishmentChoicesValueController ??=
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
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        iconSize: 30.0,
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ExpandableNotifier(
                    controller: _model.expandableController2,
                    child: ExpandablePanel(
                      header: Text(
                        'Musique Style ',
                        style: FlutterFlowTheme.of(context).titleSmall,
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
                          onChanged: (val) async {
                            setState(() =>
                                _model.musicStyleEstablishmentChoicesValue =
                                    val?.firstOrNull);
                            logFirebaseEvent(
                                'FILTER_OPTIONS_LIST_EST_musicStyleEstabl');
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                            iconColor: const Color(0x00000000),
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 7.0, 20.0, 7.0),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: const Color(0x00000000),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            iconColor: const Color(0x00000000),
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 7.0, 20.0, 7.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          chipSpacing: 25.0,
                          rowSpacing: 15.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model
                                  .musicStyleEstablishmentChoicesValueController ??=
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
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        iconSize: 30.0,
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
