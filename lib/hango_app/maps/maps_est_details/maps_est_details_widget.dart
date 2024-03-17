import '/backend/backend.dart';
import '/components/back_navigation_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'maps_est_details_model.dart';
export 'maps_est_details_model.dart';

class MapsEstDetailsWidget extends StatefulWidget {
  const MapsEstDetailsWidget({
    super.key,
    required this.estRef,
  });

  final EstablishmentsRecord? estRef;

  @override
  State<MapsEstDetailsWidget> createState() => _MapsEstDetailsWidgetState();
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
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
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
        List<EstablishmentsRecord> mapsEstDetailsEstablishmentsRecordList =
            snapshot.data!;
        return Title(
            title: 'MapsEstDetails',
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
                                                final googleMapMarker =
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
                                                    if (googleMapMarker !=
                                                        null)
                                                      FlutterFlowMarker(
                                                        googleMapMarker
                                                            .serialize(),
                                                        googleMapMarker,
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
                                          PointerInterceptor(
                                            intercepting: isWeb,
                                            child: wrapWithModel(
                                              model:
                                                  _model.backNavigationModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const BackNavigationWidget(),
                                            ),
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
                                                final googleMapMarker =
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
                                                    if (googleMapMarker !=
                                                        null)
                                                      FlutterFlowMarker(
                                                        googleMapMarker
                                                            .serialize(),
                                                        googleMapMarker,
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
                                          PointerInterceptor(
                                            intercepting: isWeb,
                                            child: wrapWithModel(
                                              model:
                                                  _model.backNavigationModel2,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const BackNavigationWidget(),
                                            ),
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
