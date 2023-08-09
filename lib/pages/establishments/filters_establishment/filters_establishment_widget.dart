import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'filters_establishment_model.dart';
export 'filters_establishment_model.dart';

class FiltersEstablishmentWidget extends StatefulWidget {
  const FiltersEstablishmentWidget({Key? key}) : super(key: key);

  @override
  _FiltersEstablishmentWidgetState createState() =>
      _FiltersEstablishmentWidgetState();
}

class _FiltersEstablishmentWidgetState
    extends State<FiltersEstablishmentWidget> {
  late FiltersEstablishmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersEstablishmentModel());

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
        title: 'FiltersEstablishment',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: 570.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 30.0, 16.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Flitres',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Type d\'établissement',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Lounge'),
                                ChipData('Pub'),
                                ChipData('Discothèque'),
                                ChipData('Bar'),
                                ChipData('Bar restaurant'),
                                ChipData('Buvette')
                              ],
                              onChanged: (val) => setState(
                                  () => _model.choiceChipsValue = val?.first),
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
                                iconColor: Color(0x00000000),
                                iconSize: 18.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 7.0, 20.0, 7.0),
                                elevation: 3.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                iconColor: Color(0x00000000),
                                iconSize: 18.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 7.0, 20.0, 7.0),
                                elevation: 1.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).accent4,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 25.0,
                              rowSpacing: 15.0,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Genre musical',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          SwitchListTile(
                            value: _model.switchListTileValue1 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue1 = newValue!);
                            },
                            title: Text(
                              'Terrasse',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile(
                            value: _model.switchListTileValue2 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue2 = newValue!);
                            },
                            title: Text(
                              'Réservation',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile(
                            value: _model.switchListTileValue3 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue3 = newValue!);
                            },
                            title: Text(
                              'Machnie à cigarette',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile(
                            value: _model.switchListTileValue4 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue4 = newValue!);
                            },
                            title: Text(
                              'Nourriture',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile(
                            value: _model.switchListTileValue5 ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue5 = newValue!);
                            },
                            title: Text(
                              'Jeux',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            subtitle: Text(
                              'Billard, fléchettes,  bord, cartes, ...',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile(
                            value: _model.switchListTileValue6 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue6 = newValue!);
                            },
                            title: Text(
                              'Ouvert',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 80.0, 16.0, 8.0),
                            child: Row(
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
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w300,
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
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await queryEventsRecordOnce()
                                  .then(
                                    (records) => _model.simpleSearchResults =
                                        TextSearch(
                                      records
                                          .map(
                                            (record) => TextSearchItem(record, [
                                              record.title!,
                                              record.name!,
                                              record.description!
                                            ]),
                                          )
                                          .toList(),
                                    )
                                            .search(_model.choiceChipsValue!)
                                            .map((r) => r.object)
                                            .toList(),
                                  )
                                  .onError((_, __) =>
                                      _model.simpleSearchResults = [])
                                  .whenComplete(() => setState(() {}));

                              setState(() {
                                FFAppState().filterEvenResults = _model
                                    .simpleSearchResults
                                    .map((e) => e.reference)
                                    .toList()
                                    .cast<DocumentReference>();
                              });

                              context.pushNamed('eventFilterResult');
                            },
                            text: 'Voir les résultats (8)',
                            options: FFButtonOptions(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF10212E),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent4,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
