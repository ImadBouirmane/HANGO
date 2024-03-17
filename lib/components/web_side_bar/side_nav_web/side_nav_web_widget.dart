import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'side_nav_web_model.dart';
export 'side_nav_web_model.dart';

class SideNavWebWidget extends StatefulWidget {
  const SideNavWebWidget({
    super.key,
    required this.nav1,
    required this.nav2,
    required this.nav3,
  });

  final bool? nav1;
  final bool? nav2;
  final bool? nav3;

  @override
  State<SideNavWebWidget> createState() => _SideNavWebWidgetState();
}

class _SideNavWebWidgetState extends State<SideNavWebWidget> {
  late SideNavWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavWebModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
        tabletLandscape: false,
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.2,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).lineColor,
              offset: const Offset(1.0, 0.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        color: FlutterFlowTheme.of(context).lineColor,
                        offset: const Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Typo_-_bleu_clair.png',
                            width: MediaQuery.sizeOf(context).width * 0.1,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (loggedIn) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 20.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.05,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.05,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                        height:
                                            MediaQuery.sizeOf(context).width *
                                                0.05,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          currentUserPhoto,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            'assets/images/error_image.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              currentUserDisplayName,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                          ),
                                          if (currentUserEmail != '')
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                currentUserEmail,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SIDE_NAV_WEB_S\'IDENTIFIER_|_S\'INSCRIRE');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('UserLogin');
                              },
                              text: 'S\'identifier | S\'inscrire',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            );
                          }
                        },
                      ),
                    ]
                        .divide(const SizedBox(height: 30.0))
                        .addToStart(const SizedBox(height: 10.0))
                        .addToEnd(const SizedBox(height: 10.0)),
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: MouseRegion(
                      opaque: true,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegion1Hovered = true);
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegion1Hovered = false);
                      }),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SIDE_NAV_WEB_COMP_Establihments_ON_TAP');
                          logFirebaseEvent('Establihments_navigate_to');

                          context.pushNamed('ListOfEstablishments');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              () {
                                if ((_model.mouseRegion1Hovered == true) ==
                                    true) {
                                  return FlutterFlowTheme.of(context)
                                      .primaryTransparent;
                                } else if (widget.nav1 == true) {
                                  return FlutterFlowTheme.of(context).primary;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.business,
                                  color: valueOrDefault<Color>(
                                    () {
                                      if ((_model.mouseRegion1Hovered ==
                                              true) ==
                                          true) {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      } else if (widget.nav1 == true) {
                                        return FlutterFlowTheme.of(context)
                                            .primaryBackground;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  size: 28.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Établissements',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: valueOrDefault<Color>(
                                            () {
                                              if ((_model.mouseRegion1Hovered ==
                                                      true) ==
                                                  true) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              } else if (widget.nav1 == true) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryBackground;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              }
                                            }(),
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: MouseRegion(
                      opaque: true,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegion2Hovered = true);
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegion2Hovered = false);
                      }),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('SIDE_NAV_WEB_COMP_Events_ON_TAP');
                          logFirebaseEvent('Events_navigate_to');

                          context.pushNamed('ListOfEvents');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              () {
                                if ((_model.mouseRegion2Hovered == true) ==
                                    true) {
                                  return FlutterFlowTheme.of(context)
                                      .primaryTransparent;
                                } else if (widget.nav2 == true) {
                                  return FlutterFlowTheme.of(context).primary;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryBackground;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.event,
                                  color: valueOrDefault<Color>(
                                    () {
                                      if ((_model.mouseRegion2Hovered ==
                                              true) ==
                                          true) {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      } else if (widget.nav2 == true) {
                                        return FlutterFlowTheme.of(context)
                                            .primaryBackground;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  size: 28.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Événements',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: valueOrDefault<Color>(
                                            () {
                                              if ((_model.mouseRegion2Hovered ==
                                                      true) ==
                                                  true) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              } else if (widget.nav2 == true) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryBackground;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              }
                                            }(),
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (loggedIn)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: MouseRegion(
                        opaque: true,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegion3Hovered = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegion3Hovered = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent('SIDE_NAV_WEB_COMP_Profil_ON_TAP');
                            logFirebaseEvent('Profil_navigate_to');

                            context.pushNamed('Profile');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                () {
                                  if ((_model.mouseRegion3Hovered == true) ==
                                      true) {
                                    return FlutterFlowTheme.of(context)
                                        .primaryTransparent;
                                  } else if (widget.nav3 == true) {
                                    return FlutterFlowTheme.of(context).primary;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: valueOrDefault<Color>(
                                      () {
                                        if ((_model.mouseRegion3Hovered ==
                                                true) ==
                                            true) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryText;
                                        } else if (widget.nav3 == true) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primaryText;
                                        }
                                      }(),
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    size: 28.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Profil',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: valueOrDefault<Color>(
                                              () {
                                                if ((_model.mouseRegion3Hovered ==
                                                        true) ==
                                                    true) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText;
                                                } else if (widget.nav3 ==
                                                    true) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ].divide(const SizedBox(height: 10.0)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (valueOrDefault<bool>(
                      loggedIn &&
                          (valueOrDefault<bool>(
                                  currentUserDocument?.administratorRole,
                                  false) ==
                              true),
                      false,
                    ))
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SIDE_NAV_WEB_COMP_ACCÈS_ADMIN_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'Dashboard',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            text: 'Accès Admin',
                            icon: const Icon(
                              Icons.chevron_right,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                            currentUserDocument?.managerRole, false) ==
                        true)
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SIDE_NAV_WEB_ACCÈS_MANAGER_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'ManagerDashboard',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            text: 'Accès Manager',
                            icon: const Icon(
                              Icons.chevron_right,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
