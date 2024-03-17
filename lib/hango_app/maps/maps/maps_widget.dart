import '/backend/backend.dart';
import '/components/list_items/list_items_widget.dart';
import '/components/map_side/map_establishment_pop_up/map_establishment_pop_up_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'maps_model.dart';
export 'maps_model.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({super.key});

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
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
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
            backgroundColor: const Color(0xFFEFEFEF),
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
              backgroundColor: const Color(0xFFEFEFEF),
              body: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    wrapWithModel(
                      model: _model.sideNavWebModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: const SideNavWebWidget(
                        nav1: false,
                        nav2: false,
                        nav3: false,
                      ),
                    ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            desktop: false,
                          ))
                            Expanded(
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, -0.96),
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: StreamBuilder<
                                          List<EstablishmentsRecord>>(
                                        stream: queryEstablishmentsRecord(),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<EstablishmentsRecord>
                                              googleMapEstablishmentsRecordList =
                                              snapshot.data!;
                                          return FlutterFlowGoogleMap(
                                            controller:
                                                _model.googleMapsController1,
                                            onCameraIdle: (latLng) => _model
                                                .googleMapsCenter1 = latLng,
                                            initialLocation:
                                                _model.googleMapsCenter1 ??=
                                                    currentUserLocationValue!,
                                            markers:
                                                googleMapEstablishmentsRecordList
                                                    .map((e) => e.location)
                                                    .withoutNulls
                                                    .toList()
                                                    .map(
                                                      (marker) =>
                                                          FlutterFlowMarker(
                                                        marker.serialize(),
                                                        marker,
                                                        () async {
                                                          logFirebaseEvent(
                                                              'MAPS_GoogleMap_5wstsutd_ON_MARKER_TAP');
                                                          logFirebaseEvent(
                                                              'GoogleMap_bottom_sheet');
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      MapEstablishmentPopUpWidget(
                                                                    establishmentRef:
                                                                        mapsEstablishmentsRecordList
                                                                            .first,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    )
                                                    .toList(),
                                            markerColor:
                                                GoogleMarkerColor.green,
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
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 8.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController1',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              logFirebaseEvent(
                                                  'MAPS_TextField_ctuf8mb6_ON_TEXTFIELD_CHA');
                                              logFirebaseEvent(
                                                  'TextField_simple_search');
                                              safeSetState(() {
                                                _model.simpleSearchResults1 =
                                                    TextSearch(
                                                  mapsEstablishmentsRecordList
                                                      .map(
                                                        (record) =>
                                                            TextSearchItem
                                                                .fromTerms(
                                                                    record, [
                                                          record.name
                                                        ]),
                                                      )
                                                      .toList(),
                                                )
                                                        .search(_model
                                                            .textController1
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList();
                                              });
                                              logFirebaseEvent(
                                                  'TextField_update_app_state');
                                              setState(() {
                                                FFAppState().searchChange =
                                                    true;
                                              });
                                              if (_model.textController1.text ==
                                                      '') {
                                                logFirebaseEvent(
                                                    'TextField_update_app_state');
                                                setState(() {
                                                  FFAppState().searchChange =
                                                      false;
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'TextField_update_app_state');
                                                setState(() {
                                                  FFAppState().searchChange =
                                                      true;
                                                });
                                              }
                                            },
                                          ),
                                          onFieldSubmitted: (_) async {
                                            logFirebaseEvent(
                                                'MAPS_TextField_ctuf8mb6_ON_TEXTFIELD_SUB');
                                            logFirebaseEvent(
                                                'TextField_update_app_state');
                                            setState(() {
                                              FFAppState().searchChange = true;
                                            });
                                            if (_model.textController1.text ==
                                                    '') {
                                              logFirebaseEvent(
                                                  'TextField_update_app_state');
                                              setState(() {
                                                FFAppState().searchChange =
                                                    false;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'TextField_update_app_state');
                                              setState(() {
                                                FFAppState().searchChange =
                                                    true;
                                              });
                                            }
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintText:
                                                'Trouvez se que vous cherchez...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            prefixIcon: Icon(
                                              Icons.search_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                        if (valueOrDefault<bool>(
                                          FFAppState().searchChange,
                                          false,
                                        ))
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                              ),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final searchResults = _model
                                                    .simpleSearchResults1
                                                    .map((e) => e)
                                                    .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      searchResults.length,
                                                  itemBuilder: (context,
                                                      searchResultsIndex) {
                                                    final searchResultsItem =
                                                        searchResults[
                                                            searchResultsIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'MAPS_PAGE_Container_lu3efzcp_ON_TAP');
                                                        logFirebaseEvent(
                                                            'listItems_navigate_to');

                                                        context.pushNamed(
                                                          'ShowOfEstablishment',
                                                          queryParameters: {
                                                            'estRef':
                                                                serializeParam(
                                                              mapsEstablishmentsRecordList
                                                                  .first,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'estRef':
                                                                mapsEstablishmentsRecordList
                                                                    .first,
                                                          },
                                                        );
                                                      },
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .listItemsModels1
                                                            .getModel(
                                                          searchResultsIndex
                                                              .toString(),
                                                          searchResultsIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child: ListItemsWidget(
                                                          key: Key(
                                                            'Keylu3_${searchResultsIndex.toString()}',
                                                          ),
                                                          parameter1:
                                                              valueOrDefault<
                                                                  String>(
                                                            searchResultsItem
                                                                .name,
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
                                          .divide(const SizedBox(height: 5.0))
                                          .addToStart(const SizedBox(height: 50.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                          ))
                            Expanded(
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, -0.96),
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: StreamBuilder<
                                          List<EstablishmentsRecord>>(
                                        stream: queryEstablishmentsRecord(),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<EstablishmentsRecord>
                                              googleMapEstablishmentsRecordList =
                                              snapshot.data!;
                                          return FlutterFlowGoogleMap(
                                            controller:
                                                _model.googleMapsController2,
                                            onCameraIdle: (latLng) => _model
                                                .googleMapsCenter2 = latLng,
                                            initialLocation:
                                                _model.googleMapsCenter2 ??=
                                                    currentUserLocationValue!,
                                            markers:
                                                googleMapEstablishmentsRecordList
                                                    .map((e) => e.location)
                                                    .withoutNulls
                                                    .toList()
                                                    .map(
                                                      (marker) =>
                                                          FlutterFlowMarker(
                                                        marker.serialize(),
                                                        marker,
                                                        () async {
                                                          logFirebaseEvent(
                                                              'MAPS_GoogleMap_l1i8q87z_ON_MARKER_TAP');
                                                          logFirebaseEvent(
                                                              'GoogleMap_bottom_sheet');
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      MapEstablishmentPopUpWidget(
                                                                    establishmentRef:
                                                                        mapsEstablishmentsRecordList
                                                                            .first,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    )
                                                    .toList(),
                                            markerColor:
                                                GoogleMarkerColor.green,
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
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode2,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController2',
                                                const Duration(milliseconds: 2000),
                                                () async {
                                                  logFirebaseEvent(
                                                      'MAPS_TextField_m80xvrq2_ON_TEXTFIELD_CHA');
                                                  logFirebaseEvent(
                                                      'TextField_simple_search');
                                                  safeSetState(() {
                                                    _model.simpleSearchResults2 =
                                                        TextSearch(
                                                      mapsEstablishmentsRecordList
                                                          .map(
                                                            (record) =>
                                                                TextSearchItem
                                                                    .fromTerms(
                                                                        record,
                                                                        [
                                                                  record.name
                                                                ]),
                                                          )
                                                          .toList(),
                                                    )
                                                            .search(_model
                                                                .textController2
                                                                .text)
                                                            .map(
                                                                (r) => r.object)
                                                            .toList();
                                                  });
                                                  logFirebaseEvent(
                                                      'TextField_update_app_state');
                                                  setState(() {
                                                    FFAppState().searchChange =
                                                        true;
                                                  });
                                                  if (_model.textController2
                                                              .text ==
                                                          '') {
                                                    logFirebaseEvent(
                                                        'TextField_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .searchChange = false;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'TextField_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .searchChange = true;
                                                    });
                                                  }
                                                },
                                              ),
                                              onFieldSubmitted: (_) async {
                                                logFirebaseEvent(
                                                    'MAPS_TextField_m80xvrq2_ON_TEXTFIELD_SUB');
                                                logFirebaseEvent(
                                                    'TextField_update_app_state');
                                                setState(() {
                                                  FFAppState().searchChange =
                                                      true;
                                                });
                                                if (_model.textController2
                                                            .text ==
                                                        '') {
                                                  logFirebaseEvent(
                                                      'TextField_update_app_state');
                                                  setState(() {
                                                    FFAppState().searchChange =
                                                        false;
                                                  });
                                                } else {
                                                  logFirebaseEvent(
                                                      'TextField_update_app_state');
                                                  setState(() {
                                                    FFAppState().searchChange =
                                                        true;
                                                  });
                                                }
                                              },
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintText:
                                                    'Trouvez se que vous cherchez...',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                prefixIcon: Icon(
                                                  Icons.search_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        if (valueOrDefault<bool>(
                                          FFAppState().searchChange,
                                          false,
                                        ))
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                ),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final searchResults = _model
                                                      .simpleSearchResults2
                                                      .map((e) => e)
                                                      .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        searchResults.length,
                                                    itemBuilder: (context,
                                                        searchResultsIndex) {
                                                      final searchResultsItem =
                                                          searchResults[
                                                              searchResultsIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'MAPS_PAGE_Container_xd35qnp5_ON_TAP');
                                                          logFirebaseEvent(
                                                              'listItems_navigate_to');

                                                          context.pushNamed(
                                                            'ShowOfEstablishment',
                                                            queryParameters: {
                                                              'estRef':
                                                                  serializeParam(
                                                                mapsEstablishmentsRecordList
                                                                    .first,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'estRef':
                                                                  mapsEstablishmentsRecordList
                                                                      .first,
                                                            },
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .listItemsModels2
                                                              .getModel(
                                                            searchResultsIndex
                                                                .toString(),
                                                            searchResultsIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              ListItemsWidget(
                                                            key: Key(
                                                              'Keyxd3_${searchResultsIndex.toString()}',
                                                            ),
                                                            parameter1:
                                                                valueOrDefault<
                                                                    String>(
                                                              searchResultsItem
                                                                  .name,
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
                                          ),
                                      ]
                                          .divide(const SizedBox(height: 5.0))
                                          .addToStart(const SizedBox(height: 50.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
