import '/backend/backend.dart';
import '/components/list_items/list_items_widget.dart';
import '/components/map_establishment_pop_up/map_establishment_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'maps_model.dart';
export 'maps_model.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late MapsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Maps'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return StreamBuilder<List<EstablishmentsRecord>>(
      stream: queryEstablishmentsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEFEFEF),
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
        List<EstablishmentsRecord> mapsEstablishmentsRecordList =
            snapshot.data!;
        return Title(
            title: 'Maps',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xFFEFEFEF),
              body: Stack(
                alignment: AlignmentDirectional(0.0, -0.96),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter = latLng,
                        initialLocation: _model.googleMapsCenter ??=
                            currentUserLocationValue!,
                        markers: mapsEstablishmentsRecordList
                            .map((e) => e.location)
                            .withoutNulls
                            .toList()
                            .map(
                              (marker) => FlutterFlowMarker(
                                marker.serialize(),
                                marker,
                                () async {
                                  logFirebaseEvent(
                                      'MAPS_GoogleMap_5wstsutd_ON_MARKER_TAP');
                                  logFirebaseEvent('GoogleMap_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: MapEstablishmentPopUpWidget(
                                          establishmentRef:
                                              mapsEstablishmentsRecordList
                                                  .first,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            )
                            .toList(),
                        markerColor: GoogleMarkerColor.green,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: true,
                        showMapToolbar: true,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: _model.textController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () async {
                              logFirebaseEvent(
                                  'MAPS_TextField_ctuf8mb6_ON_TEXTFIELD_CHA');
                              logFirebaseEvent('TextField_simple_search');
                              setState(() {
                                _model.simpleSearchResults = TextSearch(
                                  mapsEstablishmentsRecordList
                                      .map(
                                        (record) => TextSearchItem(
                                            record, [record.name!]),
                                      )
                                      .toList(),
                                )
                                    .search(_model.textController.text)
                                    .map((r) => r.object)
                                    .toList();
                                ;
                              });
                              logFirebaseEvent('TextField_update_app_state');
                              setState(() {
                                FFAppState().searchChange = true;
                              });
                              if (_model.textController.text == null ||
                                  _model.textController.text == '') {
                                logFirebaseEvent('TextField_update_app_state');
                                setState(() {
                                  FFAppState().searchChange = false;
                                });
                              } else {
                                logFirebaseEvent('TextField_update_app_state');
                                setState(() {
                                  FFAppState().searchChange = true;
                                });
                              }
                            },
                          ),
                          onFieldSubmitted: (_) async {
                            logFirebaseEvent(
                                'MAPS_TextField_ctuf8mb6_ON_TEXTFIELD_SUB');
                            logFirebaseEvent('TextField_update_app_state');
                            setState(() {
                              FFAppState().searchChange = true;
                            });
                            if (_model.textController.text == null ||
                                _model.textController.text == '') {
                              logFirebaseEvent('TextField_update_app_state');
                              setState(() {
                                FFAppState().searchChange = false;
                              });
                            } else {
                              logFirebaseEvent('TextField_update_app_state');
                              setState(() {
                                FFAppState().searchChange = true;
                              });
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Trouvez se que vous cherchez...',
                            hintStyle: FlutterFlowTheme.of(context).labelLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                        if (valueOrDefault<bool>(
                          FFAppState().searchChange,
                          false,
                        ))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).lineColor,
                              ),
                            ),
                            child: Builder(
                              builder: (context) {
                                final searchResults = _model.simpleSearchResults
                                    .map((e) => e)
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: searchResults.length,
                                  itemBuilder: (context, searchResultsIndex) {
                                    final searchResultsItem =
                                        searchResults[searchResultsIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MAPS_PAGE_Container_lu3efzcp_ON_TAP');
                                        logFirebaseEvent(
                                            'listItems_navigate_to');

                                        context.pushNamed(
                                          'ShowOfEstablishment',
                                          queryParameters: {
                                            'establishmentDetails':
                                                serializeParam(
                                              searchResultsItem.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.listItemsModels.getModel(
                                          searchResultsIndex.toString(),
                                          searchResultsIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: ListItemsWidget(
                                          key: Key(
                                            'Keylu3_${searchResultsIndex.toString()}',
                                          ),
                                          parameter1: valueOrDefault<String>(
                                            searchResultsItem.name,
                                            'MAD Club Rue de Genève, Lausanne, Switzerland',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 5.0))
                          .addToStart(SizedBox(height: 50.0)),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
