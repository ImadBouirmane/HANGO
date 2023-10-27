import '/backend/backend.dart';
import '/components/back_navigation_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'maps_est_details_model.dart';
export 'maps_est_details_model.dart';

class MapsEstDetailsWidget extends StatefulWidget {
  const MapsEstDetailsWidget({
    Key? key,
    required this.estRef,
  }) : super(key: key);

  final EstablishmentsRecord? estRef;

  @override
  _MapsEstDetailsWidgetState createState() => _MapsEstDetailsWidgetState();
}

class _MapsEstDetailsWidgetState extends State<MapsEstDetailsWidget> {
  late MapsEstDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsEstDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MapsEstDetails'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
        List<EstablishmentsRecord> mapsEstDetailsEstablishmentsRecordList =
            snapshot.data!;
        return Title(
            title: 'MapsEstDetails',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xFFEFEFEF),
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
                      child: SideNavWebWidget(
                        nav1: false,
                        nav2: false,
                        nav3: false,
                      ),
                    ),
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            desktop: false,
                          ))
                            Expanded(
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, -0.96),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          StreamBuilder<
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<EstablishmentsRecord>
                                                  googleMapEstablishmentsRecordList =
                                                  snapshot.data!;
                                              return Builder(
                                                  builder: (context) {
                                                final _googleMapMarker =
                                                    widget.estRef?.location;
                                                return FlutterFlowGoogleMap(
                                                  controller: _model
                                                      .googleMapsController1,
                                                  onCameraIdle: (latLng) =>
                                                      _model.googleMapsCenter1 =
                                                          latLng,
                                                  initialLocation: _model
                                                          .googleMapsCenter1 ??=
                                                      currentUserLocationValue!,
                                                  markers: [
                                                    if (_googleMapMarker !=
                                                        null)
                                                      FlutterFlowMarker(
                                                        _googleMapMarker
                                                            .serialize(),
                                                        _googleMapMarker,
                                                      ),
                                                  ],
                                                  markerColor:
                                                      GoogleMarkerColor.green,
                                                  mapType: MapType.normal,
                                                  style:
                                                      GoogleMapStyle.standard,
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
                                              });
                                            },
                                          ),
                                          wrapWithModel(
                                            model: _model.backNavigationModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: BackNavigationWidget(),
                                          ),
                                        ],
                                      ),
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
                                alignment: AlignmentDirectional(0.0, -0.96),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          StreamBuilder<
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<EstablishmentsRecord>
                                                  googleMapEstablishmentsRecordList =
                                                  snapshot.data!;
                                              return Builder(
                                                  builder: (context) {
                                                final _googleMapMarker =
                                                    widget.estRef?.location;
                                                return FlutterFlowGoogleMap(
                                                  controller: _model
                                                      .googleMapsController2,
                                                  onCameraIdle: (latLng) =>
                                                      _model.googleMapsCenter2 =
                                                          latLng,
                                                  initialLocation: _model
                                                          .googleMapsCenter2 ??=
                                                      currentUserLocationValue!,
                                                  markers: [
                                                    if (_googleMapMarker !=
                                                        null)
                                                      FlutterFlowMarker(
                                                        _googleMapMarker
                                                            .serialize(),
                                                        _googleMapMarker,
                                                      ),
                                                  ],
                                                  markerColor:
                                                      GoogleMarkerColor.green,
                                                  mapType: MapType.normal,
                                                  style:
                                                      GoogleMapStyle.standard,
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
                                              });
                                            },
                                          ),
                                          wrapWithModel(
                                            model: _model.backNavigationModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: BackNavigationWidget(),
                                          ),
                                        ],
                                      ),
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
