import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'list_of_establishments_model.dart';
export 'list_of_establishments_model.dart';

class ListOfEstablishmentsWidget extends StatefulWidget {
  const ListOfEstablishmentsWidget({Key? key}) : super(key: key);

  @override
  _ListOfEstablishmentsWidgetState createState() =>
      _ListOfEstablishmentsWidgetState();
}

class _ListOfEstablishmentsWidgetState
    extends State<ListOfEstablishmentsWidget> {
  late ListOfEstablishmentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfEstablishmentsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListOfEstablishments'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIST_OF_ESTABLISHMENTS_ListOfEstablishme');
      logFirebaseEvent('ListOfEstablishments_update_widget_state');
      setState(() {
        _model.filterOnEstMobile = true;
        _model.filterOffEstMobile = false;
      });
    });

    _model.estblishmentSearchController1 ??= TextEditingController();
    _model.estblishmentSearchController2 ??= TextEditingController();
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

    return StreamBuilder<List<EstablishmentsRecord>>(
      stream: queryEstablishmentsRecord(
        queryBuilder: (establishmentsRecord) =>
            establishmentsRecord.orderBy('created_time'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<EstablishmentsRecord>
            listOfEstablishmentsEstablishmentsRecordList = snapshot.data!;
        return Title(
            title: 'ListOfEstablishments',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  drawer: Drawer(
                    elevation: 16.0,
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 80.0, 0.0, 80.0),
                                        child: Container(
                                          width: 140.0,
                                          height: 140.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Logo_-_bleu_clair.png',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      if (!loggedIn)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                'Hango t\'aide à trouver les meilleurs soirées, events et établissements du monde de la nuit en suisse Romande',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                'Créer toi  un compte et reçois des PROMO% exclusives dans les meilleurs établissements de ta ville',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (loggedIn)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'L\'équipe HANGO te souhaite la bienvenu !',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 22.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  currentUserDisplayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'LIST_OF_ESTABLISHMENTS_LinkToUserLogin_O');
                                          logFirebaseEvent(
                                              'LinkToUserLogin_navigate_to');

                                          context.pushNamed('UserLogin');
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if (!loggedIn)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'LIST_OF_ESTABLISHMENTS_Button-create-acc');
                                                    logFirebaseEvent(
                                                        'Button-create-account_navigate_to');

                                                    context.pushNamed(
                                                        'UserSignUp');
                                                  },
                                                  text: 'Créer un compte',
                                                  options: FFButtonOptions(
                                                    width: 200.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                ),
                                              ),
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.administratorRole,
                                                    false) ==
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'LIST_OF_ESTABLISHMENTS_Button-NT-Dashboa');
                                                      logFirebaseEvent(
                                                          'Button-NT-Dashboard_navigate_to');

                                                      context.pushNamed(
                                                          'Dashboard');
                                                    },
                                                    text: 'Admin. Dashboard',
                                                    options: FFButtonOptions(
                                                      width: 200.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (!loggedIn)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'LIST_OF_ESTABLISHMENTS_Button-Login_ON_T');
                                                    logFirebaseEvent(
                                                        'Button-Login_navigate_to');

                                                    context
                                                        .pushNamed('UserLogin');
                                                  },
                                                  text: 'Se connecter',
                                                  options: FFButtonOptions(
                                                    width: 200.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                ),
                                              ),
                                            if (loggedIn)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'LIST_OF_ESTABLISHMENTS_Button-Logiout_ON');
                                                    logFirebaseEvent(
                                                        'Button-Logiout_auth');
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signOut();
                                                    GoRouter.of(context)
                                                        .clearRedirectLocation();

                                                    context.goNamedAuth(
                                                        'UserLogin',
                                                        context.mounted);
                                                  },
                                                  text: 'Se  déconnecter',
                                                  options: FFButtonOptions(
                                                    width: 200.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Retrouve nous sur les réseaux ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5.0,
                                                    color: Color(0x3314181B),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: FaIcon(
                                                FontAwesomeIcons.instagram,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 24.0,
                                              ),
                                            ),
                                            Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5.0,
                                                    color: Color(0x3314181B),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: FaIcon(
                                                FontAwesomeIcons.tiktok,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 20.0,
                                              ),
                                            ),
                                            Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5.0,
                                                    color: Color(0x3314181B),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: FaIcon(
                                                FontAwesomeIcons.facebookF,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ),
                  appBar: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return true;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return true;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return false;
                    } else {
                      return false;
                    }
                  }()
                      ? AppBar(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          automaticallyImplyLeading: false,
                          leading: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.menu_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LIST_OF_ESTABLISHMENTS_menu_rounded_ICN_');
                              logFirebaseEvent('IconButton_drawer');
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                          title: Text(
                            'Établissements',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                          actions: [],
                          centerTitle: false,
                          elevation: 2.0,
                        )
                      : null,
                  body: SafeArea(
                    top: true,
                    child: Row(
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
                              nav1: true,
                              nav2: false,
                              nav3: false,
                            ),
                          ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .estblishmentSearchController1,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.estblishmentSearchController1',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => setState(() {}),
                                                        ),
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          logFirebaseEvent(
                                                              'LIST_OF_ESTABLISHMENTS_estblishmentSearc');
                                                          logFirebaseEvent(
                                                              'estblishmentSearch_update_widget_state');
                                                          setState(() {
                                                            _model.searchStateMobile =
                                                                true;
                                                            _model.typeFilterMobile =
                                                                false;
                                                            _model.musicFilterMobile =
                                                                false;
                                                            _model.filterOnEstMobile =
                                                                false;
                                                            _model.filterOffEstMobile =
                                                                false;
                                                          });
                                                          logFirebaseEvent(
                                                              'estblishmentSearch_simple_search');
                                                          safeSetState(() {
                                                            _model.simpleSearchResults1 =
                                                                TextSearch(
                                                              listOfEstablishmentsEstablishmentsRecordList
                                                                  .map(
                                                                    (record) =>
                                                                        TextSearchItem(
                                                                            record,
                                                                            [
                                                                          record
                                                                              .name!,
                                                                          record
                                                                              .description!,
                                                                          record
                                                                              .speciality!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(_model
                                                                        .estblishmentSearchController1
                                                                        .text)
                                                                    .map((r) =>
                                                                        r.object)
                                                                    .take(5)
                                                                    .toList();
                                                            ;
                                                          });
                                                        },
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          hintText:
                                                              'Trouver une établissement',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          prefixIcon: Icon(
                                                            Icons.search_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                          suffixIcon: _model
                                                                  .estblishmentSearchController1!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .estblishmentSearchController1
                                                                        ?.clear();
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayIcon,
                                                                    size: 25.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        validator: _model
                                                            .estblishmentSearchController1Validator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (valueOrDefault<bool>(
                                                        _model.filterOnEstMobile ==
                                                            false,
                                                        true,
                                                      )) {
                                                        return FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons
                                                                .filter_list_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'LIST_OF_ESTABLISHMENTS_filter_list_sharp');
                                                            logFirebaseEvent(
                                                                'IconButton_update_widget_state');
                                                            setState(() {
                                                              _model.filterOffEstMobile =
                                                                  false;
                                                              _model.filterOnEstMobile =
                                                                  true;
                                                              _model.searchStateMobile =
                                                                  false;
                                                            });
                                                            logFirebaseEvent(
                                                                'IconButton_bottom_sheet');
                                                          },
                                                        );
                                                      } else {
                                                        return FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons.clear,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'LIST_OF_ESTABLISHMENTS_clear_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_update_widget_state');
                                                            setState(() {
                                                              _model.filterOnEstMobile =
                                                                  false;
                                                              _model.filterOffEstMobile =
                                                                  true;
                                                              _model.searchStateMobile =
                                                                  false;
                                                            });
                                                            logFirebaseEvent(
                                                                'IconButton_bottom_sheet');
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                              if (_model.filterOnEstMobile ==
                                                      true
                                                  ? true
                                                  : false)
                                                Wrap(
                                                  spacing: 5.0,
                                                  runSpacing: 5.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    1.0,
                                                                    10.0,
                                                                    1.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: Colors.white,
                                                          child:
                                                              ExpandableNotifier(
                                                            initialExpanded:
                                                                false,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Text(
                                                                'Type ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall,
                                                              ),
                                                              collapsed:
                                                                  Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                              expanded: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: FFAppState()
                                                                      .TypeOfEstablishment
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    setState(() =>
                                                                        _model.typeEstablishmentChoicesValue1 =
                                                                            val?.first);
                                                                    logFirebaseEvent(
                                                                        'LIST_OF_ESTABLISHMENTS_typeEstablishment');
                                                                    logFirebaseEvent(
                                                                        'typeEstablishmentChoices_update_widget_s');
                                                                    setState(
                                                                        () {
                                                                      _model.searchStateMobile =
                                                                          false;
                                                                      _model.typeFilterMobile =
                                                                          true;
                                                                      _model.musicFilterMobile =
                                                                          false;
                                                                    });
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        18.0,
                                                                    labelPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                    elevation:
                                                                        2.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        18.0,
                                                                    labelPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      25.0,
                                                                  rowSpacing:
                                                                      15.0,
                                                                  multiselect:
                                                                      false,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .typeEstablishmentChoicesValueController1 ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [],
                                                                  ),
                                                                  wrapped: true,
                                                                ),
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    true,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                iconSize: 30.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    1.0,
                                                                    10.0,
                                                                    1.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color: Colors.white,
                                                          child:
                                                              ExpandableNotifier(
                                                            initialExpanded:
                                                                false,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Text(
                                                                'Musique Style ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall,
                                                              ),
                                                              collapsed:
                                                                  Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                              expanded: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: FFAppState()
                                                                      .MusicStyle
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    setState(() =>
                                                                        _model.musicStyleEstablishmentChoicesValue1 =
                                                                            val?.first);
                                                                    logFirebaseEvent(
                                                                        'LIST_OF_ESTABLISHMENTS_musicStyleEstabli');
                                                                    logFirebaseEvent(
                                                                        'musicStyleEstablishmentChoices_update_wi');
                                                                    setState(
                                                                        () {
                                                                      _model.searchStateMobile =
                                                                          false;
                                                                      _model.typeFilterMobile =
                                                                          false;
                                                                      _model.musicFilterMobile =
                                                                          true;
                                                                    });
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        18.0,
                                                                    labelPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                    elevation:
                                                                        2.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        18.0,
                                                                    labelPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      25.0,
                                                                  rowSpacing:
                                                                      15.0,
                                                                  multiselect:
                                                                      false,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .musicStyleEstablishmentChoicesValueController1 ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [],
                                                                  ),
                                                                  wrapped: true,
                                                                ),
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    true,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                iconSize: 30.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if ((_model.searchStateMobile ==
                                                          false) &&
                                                      (_model.musicFilterMobile ==
                                                          false)
                                                  ? true
                                                  : false)
                                                PagedListView<
                                                    DocumentSnapshot<Object?>?,
                                                    EstablishmentsRecord>(
                                                  pagingController: _model
                                                      .setListEstablishmentsQueryController1(
                                                    EstablishmentsRecord
                                                        .collection
                                                        .where('type',
                                                            arrayContains: _model
                                                                .typeEstablishmentChoicesValue1)
                                                        .orderBy(
                                                            'created_time'),
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  reverse: false,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  builderDelegate:
                                                      PagedChildBuilderDelegate<
                                                          EstablishmentsRecord>(
                                                    // Customize what your widget looks like when it's loading the first page.
                                                    firstPageProgressIndicatorBuilder:
                                                        (_) => Center(
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
                                                    ),
                                                    // Customize what your widget looks like when it's loading another page.
                                                    newPageProgressIndicatorBuilder:
                                                        (_) => Center(
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
                                                    ),
                                                    noItemsFoundIndicatorBuilder:
                                                        (_) => Center(
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.8,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.2,
                                                        child: EmptyListWidget(
                                                          icon: Icon(
                                                            Icons.business,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 30.0,
                                                          ),
                                                          title:
                                                              'Il n\'y a pas d\'établissements',
                                                          description: '',
                                                        ),
                                                      ),
                                                    ),
                                                    itemBuilder: (context, _,
                                                        listEstablishmentsQueryIndex) {
                                                      final listEstablishmentsQueryEstablishmentsRecord =
                                                          _model.listEstablishmentsQueryPagingController1!
                                                                  .itemList![
                                                              listEstablishmentsQueryIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ImagesRecord>>(
                                                            stream:
                                                                queryImagesRecord(
                                                              parent:
                                                                  listEstablishmentsQueryEstablishmentsRecord
                                                                      .reference,
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
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
                                                              List<ImagesRecord>
                                                                  cardEstablishmentImagesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final cardEstablishmentImagesRecord =
                                                                  cardEstablishmentImagesRecordList
                                                                          .isNotEmpty
                                                                      ? cardEstablishmentImagesRecordList
                                                                          .first
                                                                      : null;
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'LIST_OF_ESTABLISHMENTS_CardEstablishment');
                                                                  logFirebaseEvent(
                                                                      'CardEstablishment_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'ShowOfEstablishment',
                                                                    queryParameters:
                                                                        {
                                                                      'establishmentDetails':
                                                                          serializeParam(
                                                                        listEstablishmentsQueryEstablishmentsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                              (cardEstablishmentImagesRecord?.video == null || cardEstablishmentImagesRecord?.video == ''))
                                                                            FlutterFlowMediaDisplay(
                                                                              path: valueOrDefault<String>(
                                                                                valueOrDefault<String>(
                                                                                              cardEstablishmentImagesRecord?.image1,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            ) !=
                                                                                            null &&
                                                                                        valueOrDefault<String>(
                                                                                              cardEstablishmentImagesRecord?.image1,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            ) !=
                                                                                            ''
                                                                                    ? valueOrDefault<String>(
                                                                                        cardEstablishmentImagesRecord?.image1,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                      )
                                                                                    : null,
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                              ),
                                                                              imageBuilder: (path) => ClipRRect(
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                                child: Image.network(
                                                                                  path,
                                                                                  width: double.infinity,
                                                                                  height: 220.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                path: path,
                                                                                width: 300.0,
                                                                                autoPlay: false,
                                                                                looping: true,
                                                                                showControls: true,
                                                                                allowFullScreen: true,
                                                                                allowPlaybackSpeedMenu: false,
                                                                              ),
                                                                            ),
                                                                          if ((cardEstablishmentImagesRecord?.image1 == null || cardEstablishmentImagesRecord?.image1 == '') &&
                                                                              (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                            Stack(
                                                                              alignment: AlignmentDirectional(0.98, -0.95),
                                                                              children: [
                                                                                FlutterFlowMediaDisplay(
                                                                                  path: valueOrDefault<String>(
                                                                                    valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                null &&
                                                                                            valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                ''
                                                                                        ? valueOrDefault<String>(
                                                                                            cardEstablishmentImagesRecord?.video,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          )
                                                                                        : null,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                  ),
                                                                                  imageBuilder: (path) => ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      fit: BoxFit.fitWidth,
                                                                                    ),
                                                                                  ),
                                                                                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                    path: path,
                                                                                    width: double.infinity,
                                                                                    height: 220.0,
                                                                                    autoPlay: true,
                                                                                    looping: true,
                                                                                    showControls: false,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                    pauseOnNavigate: false,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Video',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                              (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                            Stack(
                                                                              alignment: AlignmentDirectional(0.98, -0.95),
                                                                              children: [
                                                                                FlutterFlowMediaDisplay(
                                                                                  path: valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.video,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              null &&
                                                                                          valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.video,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          cardEstablishmentImagesRecord?.video,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        )
                                                                                      : null!,
                                                                                  imageBuilder: (path) => ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      fit: BoxFit.fitWidth,
                                                                                    ),
                                                                                  ),
                                                                                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                    path: path,
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 220.0,
                                                                                    autoPlay: true,
                                                                                    looping: true,
                                                                                    showControls: true,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                    pauseOnNavigate: false,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Video',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listEstablishmentsQueryEstablishmentsRecord.name,
                                                                                                'Aucune',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                      child: SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Style musical',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                            if (listEstablishmentsQueryEstablishmentsRecord.musicStyle.first != null && listEstablishmentsQueryEstablishmentsRecord.musicStyle.first != '')
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 6.0,
                                                                                                ),
                                                                                              ),
                                                                                            Text(
                                                                                              listEstablishmentsQueryEstablishmentsRecord.musicStyle.first,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Type',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                            if (listEstablishmentsQueryEstablishmentsRecord.type.first != null && listEstablishmentsQueryEstablishmentsRecord.type.first != '')
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 6.0,
                                                                                                ),
                                                                                              ),
                                                                                            Text(
                                                                                              listEstablishmentsQueryEstablishmentsRecord.type.first,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Text(
                                                                                          listEstablishmentsQueryEstablishmentsRecord.adresse.city,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if ((_model.searchStateMobile ==
                                                          false) &&
                                                      (_model.musicFilterMobile ==
                                                          true)
                                                  ? true
                                                  : false)
                                                PagedListView<
                                                    DocumentSnapshot<Object?>?,
                                                    EstablishmentsRecord>(
                                                  pagingController: _model
                                                      .setListEstablishmentsQueryMusicFilterController1(
                                                    EstablishmentsRecord
                                                        .collection
                                                        .where('music_style',
                                                            arrayContains: _model
                                                                .musicStyleEstablishmentChoicesValue1)
                                                        .orderBy(
                                                            'created_time'),
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  reverse: false,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  builderDelegate:
                                                      PagedChildBuilderDelegate<
                                                          EstablishmentsRecord>(
                                                    // Customize what your widget looks like when it's loading the first page.
                                                    firstPageProgressIndicatorBuilder:
                                                        (_) => Center(
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
                                                    ),
                                                    // Customize what your widget looks like when it's loading another page.
                                                    newPageProgressIndicatorBuilder:
                                                        (_) => Center(
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
                                                    ),

                                                    itemBuilder: (context, _,
                                                        listEstablishmentsQueryMusicFilterIndex) {
                                                      final listEstablishmentsQueryMusicFilterEstablishmentsRecord =
                                                          _model.listEstablishmentsQueryMusicFilterPagingController1!
                                                                  .itemList![
                                                              listEstablishmentsQueryMusicFilterIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ImagesRecord>>(
                                                            stream:
                                                                queryImagesRecord(
                                                              parent:
                                                                  listEstablishmentsQueryMusicFilterEstablishmentsRecord
                                                                      .reference,
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
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
                                                              List<ImagesRecord>
                                                                  cardEstablishmentImagesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final cardEstablishmentImagesRecord =
                                                                  cardEstablishmentImagesRecordList
                                                                          .isNotEmpty
                                                                      ? cardEstablishmentImagesRecordList
                                                                          .first
                                                                      : null;
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'LIST_OF_ESTABLISHMENTS_CardEstablishment');
                                                                  logFirebaseEvent(
                                                                      'CardEstablishment_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'ShowOfEstablishment',
                                                                    queryParameters:
                                                                        {
                                                                      'establishmentDetails':
                                                                          serializeParam(
                                                                        listEstablishmentsQueryMusicFilterEstablishmentsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                              (cardEstablishmentImagesRecord?.video == null || cardEstablishmentImagesRecord?.video == ''))
                                                                            FlutterFlowMediaDisplay(
                                                                              path: valueOrDefault<String>(
                                                                                valueOrDefault<String>(
                                                                                              cardEstablishmentImagesRecord?.image1,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            ) !=
                                                                                            null &&
                                                                                        valueOrDefault<String>(
                                                                                              cardEstablishmentImagesRecord?.image1,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            ) !=
                                                                                            ''
                                                                                    ? valueOrDefault<String>(
                                                                                        cardEstablishmentImagesRecord?.image1,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                      )
                                                                                    : null,
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                              ),
                                                                              imageBuilder: (path) => ClipRRect(
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                                child: Image.network(
                                                                                  path,
                                                                                  width: double.infinity,
                                                                                  height: 220.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                path: path,
                                                                                width: 300.0,
                                                                                autoPlay: false,
                                                                                looping: true,
                                                                                showControls: true,
                                                                                allowFullScreen: true,
                                                                                allowPlaybackSpeedMenu: false,
                                                                              ),
                                                                            ),
                                                                          if ((cardEstablishmentImagesRecord?.image1 == null || cardEstablishmentImagesRecord?.image1 == '') &&
                                                                              (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                            Stack(
                                                                              alignment: AlignmentDirectional(0.98, -0.95),
                                                                              children: [
                                                                                FlutterFlowMediaDisplay(
                                                                                  path: valueOrDefault<String>(
                                                                                    valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                null &&
                                                                                            valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                ''
                                                                                        ? valueOrDefault<String>(
                                                                                            cardEstablishmentImagesRecord?.video,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          )
                                                                                        : null,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                  ),
                                                                                  imageBuilder: (path) => ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      fit: BoxFit.fill,
                                                                                    ),
                                                                                  ),
                                                                                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                    path: path,
                                                                                    width: double.infinity,
                                                                                    height: 220.0,
                                                                                    autoPlay: true,
                                                                                    looping: true,
                                                                                    showControls: false,
                                                                                    allowFullScreen: false,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Video',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                              (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                            Stack(
                                                                              alignment: AlignmentDirectional(0.98, -0.95),
                                                                              children: [
                                                                                FlutterFlowMediaDisplay(
                                                                                  path: valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.video,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              null &&
                                                                                          valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.video,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          cardEstablishmentImagesRecord?.video,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        )
                                                                                      : null!,
                                                                                  imageBuilder: (path) => ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      fit: BoxFit.fill,
                                                                                    ),
                                                                                  ),
                                                                                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                    path: path,
                                                                                    width: double.infinity,
                                                                                    height: 220.0,
                                                                                    autoPlay: true,
                                                                                    looping: true,
                                                                                    showControls: false,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Video',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listEstablishmentsQueryMusicFilterEstablishmentsRecord.name,
                                                                                                'Aucune',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                      child: SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Style musical',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                            if (listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first != null && listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first != '')
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 6.0,
                                                                                                ),
                                                                                              ),
                                                                                            Text(
                                                                                              listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Type',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                            if (listEstablishmentsQueryMusicFilterEstablishmentsRecord.type.first != null && listEstablishmentsQueryMusicFilterEstablishmentsRecord.type.first != '')
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.circle_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 6.0,
                                                                                                ),
                                                                                              ),
                                                                                            Text(
                                                                                              listEstablishmentsQueryMusicFilterEstablishmentsRecord.type.first,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Text(
                                                                                          listEstablishmentsQueryMusicFilterEstablishmentsRecord.adresse.city,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if ((_model.searchStateMobile ==
                                                          true) &&
                                                      (_model.musicFilterMobile ==
                                                          false)
                                                  ? true
                                                  : false)
                                                Builder(
                                                  builder: (context) {
                                                    final searchResults = _model
                                                        .simpleSearchResults1
                                                        .map((e) => e)
                                                        .toList();
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
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
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'LIST_OF_ESTABLISHMENTS_CardEstablishment');
                                                                logFirebaseEvent(
                                                                    'CardEstablishment_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'ShowOfEstablishment',
                                                                  queryParameters:
                                                                      {
                                                                    'establishmentDetails':
                                                                        serializeParam(
                                                                      searchResultsItem
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 1.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            ImagesRecord>>(
                                                                      stream:
                                                                          queryImagesRecord(
                                                                        parent:
                                                                            searchResultsItem.reference,
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<ImagesRecord>
                                                                            stackImagesRecordList =
                                                                            snapshot.data!;
                                                                        final stackImagesRecord = stackImagesRecordList.isNotEmpty
                                                                            ? stackImagesRecordList.first
                                                                            : null;
                                                                        return Stack(
                                                                          children: [
                                                                            if ((stackImagesRecord?.image1 != null && stackImagesRecord?.image1 != '') &&
                                                                                (stackImagesRecord?.video == null || stackImagesRecord?.video == ''))
                                                                              FlutterFlowMediaDisplay(
                                                                                path: stackImagesRecord!.image1,
                                                                                imageBuilder: (path) => ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    path,
                                                                                    width: double.infinity,
                                                                                    height: 220.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                  path: path,
                                                                                  width: 300.0,
                                                                                  autoPlay: false,
                                                                                  looping: true,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                ),
                                                                              ),
                                                                            if ((stackImagesRecord?.image1 == null || stackImagesRecord?.image1 == '') &&
                                                                                (stackImagesRecord?.video != null && stackImagesRecord?.video != ''))
                                                                              FlutterFlowMediaDisplay(
                                                                                path: stackImagesRecord!.video,
                                                                                imageBuilder: (path) => ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    path,
                                                                                    width: double.infinity,
                                                                                    height: 220.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                  path: path,
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 220.0,
                                                                                  autoPlay: true,
                                                                                  looping: true,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          80.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                        child: Text(
                                                                                          searchResultsItem.name,
                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Style musical',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.circle_rounded,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 6.0,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            searchResultsItem.musicStyle.first,
                                                                                            '*',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Type',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.circle_rounded,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 6.0,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              searchResultsItem.type.first,
                                                                                              '*',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Text(
                                                                                        searchResultsItem.adresse.city,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ],
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
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                            ]
                                                .divide(SizedBox(height: 8.0))
                                                .addToStart(
                                                    SizedBox(height: 8.0))
                                                .addToEnd(
                                                    SizedBox(height: 50.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 15.0, 15.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .estblishmentSearchController2,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.estblishmentSearchController2',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () =>
                                                                setState(() {}),
                                                          ),
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            logFirebaseEvent(
                                                                'LIST_OF_ESTABLISHMENTS_estblishmentSearc');
                                                            logFirebaseEvent(
                                                                'estblishmentSearch_update_widget_state');
                                                            setState(() {
                                                              _model.musicFilterWeb =
                                                                  false;
                                                              _model.typeFilterWeb =
                                                                  false;
                                                              _model.searchStateWeb =
                                                                  true;
                                                              _model.filterOffEstWeb =
                                                                  false;
                                                              _model.filterOnEstWeb =
                                                                  false;
                                                            });
                                                            logFirebaseEvent(
                                                                'estblishmentSearch_simple_search');
                                                            safeSetState(() {
                                                              _model.simpleSearchResults2 =
                                                                  TextSearch(
                                                                listOfEstablishmentsEstablishmentsRecordList
                                                                    .map(
                                                                      (record) =>
                                                                          TextSearchItem(
                                                                              record,
                                                                              [
                                                                            record.name!,
                                                                            record.description!,
                                                                            record.speciality!
                                                                          ]),
                                                                    )
                                                                    .toList(),
                                                              )
                                                                      .search(_model
                                                                          .estblishmentSearchController2
                                                                          .text)
                                                                      .map((r) =>
                                                                          r.object)
                                                                      .take(5)
                                                                      .toList();
                                                              ;
                                                            });
                                                          },
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                            hintText:
                                                                'Trouver une établissement',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .search_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            suffixIcon: _model
                                                                    .estblishmentSearchController2!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model
                                                                          .estblishmentSearchController2
                                                                          ?.clear();
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                  )
                                                                : null,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          validator: _model
                                                              .estblishmentSearchController2Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (valueOrDefault<
                                                            bool>(
                                                          _model.filterOnEstWeb ==
                                                              false,
                                                          true,
                                                        )) {
                                                          return FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons
                                                                  .filter_list_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'LIST_OF_ESTABLISHMENTS_filter_list_sharp');
                                                              logFirebaseEvent(
                                                                  'IconButton_update_widget_state');
                                                              setState(() {
                                                                _model.filterOnEstWeb =
                                                                    true;
                                                                _model.filterOffEstWeb =
                                                                    false;
                                                                _model.searchStateWeb =
                                                                    false;
                                                              });
                                                            },
                                                          );
                                                        } else {
                                                          return FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons.clear,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'LIST_OF_ESTABLISHMENTS_clear_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_update_widget_state');
                                                              setState(() {
                                                                _model.filterOnEstWeb =
                                                                    false;
                                                                _model.filterOffEstWeb =
                                                                    true;
                                                                _model.searchStateWeb =
                                                                    false;
                                                                _model.typeFilterWeb =
                                                                    false;
                                                                _model.musicFilterWeb =
                                                                    false;
                                                              });
                                                              logFirebaseEvent(
                                                                  'IconButton_bottom_sheet');
                                                            },
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  _model.filterOnEstWeb == true
                                                      ? true
                                                      : false,
                                                  false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15.0,
                                                                15.0,
                                                                15.0,
                                                                0.0),
                                                    child: Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 10.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  ExpandableNotifier(
                                                                initialExpanded:
                                                                    false,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header: Text(
                                                                    'Type ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                  ),
                                                                  collapsed:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                  expanded:
                                                                      Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: FFAppState()
                                                                          .TypeOfEstablishment
                                                                          .map((label) =>
                                                                              ChipData(label))
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) async {
                                                                        setState(() =>
                                                                            _model.typeEstablishmentChoicesValue2 =
                                                                                val?.first);
                                                                        logFirebaseEvent(
                                                                            'LIST_OF_ESTABLISHMENTS_typeEstablishment');
                                                                        logFirebaseEvent(
                                                                            'typeEstablishmentChoices_update_widget_s');
                                                                        setState(
                                                                            () {
                                                                          _model.searchStateWeb =
                                                                              false;
                                                                          _model.typeFilterWeb =
                                                                              true;
                                                                          _model.musicFilterWeb =
                                                                              false;
                                                                        });
                                                                      },
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            18.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                        elevation:
                                                                            2.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            Color(0x00000000),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            18.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      chipSpacing:
                                                                          25.0,
                                                                      rowSpacing:
                                                                          15.0,
                                                                      multiselect:
                                                                          false,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .typeEstablishmentChoicesValueController2 ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [],
                                                                      ),
                                                                      wrapped:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        true,
                                                                    tapBodyToCollapse:
                                                                        true,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
                                                                    iconSize:
                                                                        30.0,
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  ExpandableNotifier(
                                                                initialExpanded:
                                                                    false,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header: Text(
                                                                    'Musique Style ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                  ),
                                                                  collapsed:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                  expanded:
                                                                      Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: FFAppState()
                                                                          .MusicStyle
                                                                          .map((label) =>
                                                                              ChipData(label))
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) async {
                                                                        setState(() =>
                                                                            _model.musicStyleEstablishmentChoicesValue2 =
                                                                                val?.first);
                                                                        logFirebaseEvent(
                                                                            'LIST_OF_ESTABLISHMENTS_musicStyleEstabli');
                                                                        logFirebaseEvent(
                                                                            'musicStyleEstablishmentChoices_update_wi');
                                                                        setState(
                                                                            () {
                                                                          _model.musicFilterWeb =
                                                                              false;
                                                                          _model.typeFilterWeb =
                                                                              false;
                                                                          _model.searchStateWeb =
                                                                              false;
                                                                        });
                                                                      },
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            18.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                        elevation:
                                                                            2.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            Color(0x00000000),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                        iconColor:
                                                                            Color(0x00000000),
                                                                        iconSize:
                                                                            18.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            7.0,
                                                                            20.0,
                                                                            7.0),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      chipSpacing:
                                                                          25.0,
                                                                      rowSpacing:
                                                                          15.0,
                                                                      multiselect:
                                                                          false,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .musicStyleEstablishmentChoicesValueController2 ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [],
                                                                      ),
                                                                      wrapped:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        true,
                                                                    tapBodyToCollapse:
                                                                        true,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
                                                                    iconSize:
                                                                        30.0,
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  valueOrDefault<bool>(
                                                            _model.searchStateWeb ==
                                                                false,
                                                            false,
                                                          ) &&
                                                          valueOrDefault<bool>(
                                                            _model.musicFilterWeb ==
                                                                false,
                                                            false,
                                                          )
                                                      ? true
                                                      : false,
                                                  true,
                                                ))
                                                  PagedListView<
                                                      DocumentSnapshot<
                                                          Object?>?,
                                                      EstablishmentsRecord>(
                                                    pagingController: _model
                                                        .setListEstablishmentsQueryController2(
                                                      EstablishmentsRecord
                                                          .collection
                                                          .where('type',
                                                              arrayContains: _model
                                                                  .typeEstablishmentChoicesValue2)
                                                          .orderBy(
                                                              'created_time'),
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    reverse: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    builderDelegate:
                                                        PagedChildBuilderDelegate<
                                                            EstablishmentsRecord>(
                                                      // Customize what your widget looks like when it's loading the first page.
                                                      firstPageProgressIndicatorBuilder:
                                                          (_) => Center(
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
                                                      ),
                                                      // Customize what your widget looks like when it's loading another page.
                                                      newPageProgressIndicatorBuilder:
                                                          (_) => Center(
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
                                                      ),
                                                      noItemsFoundIndicatorBuilder:
                                                          (_) => Center(
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.2,
                                                          child:
                                                              EmptyListWidget(
                                                            icon: Icon(
                                                              Icons.business,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            title:
                                                                'Il n\'y a pas d\'établissements',
                                                            description: '',
                                                          ),
                                                        ),
                                                      ),
                                                      itemBuilder: (context, _,
                                                          listEstablishmentsQueryIndex) {
                                                        final listEstablishmentsQueryEstablishmentsRecord =
                                                            _model.listEstablishmentsQueryPagingController2!
                                                                    .itemList![
                                                                listEstablishmentsQueryIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ImagesRecord>>(
                                                              stream:
                                                                  queryImagesRecord(
                                                                parent:
                                                                    listEstablishmentsQueryEstablishmentsRecord
                                                                        .reference,
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ImagesRecord>
                                                                    cardEstablishmentImagesRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final cardEstablishmentImagesRecord =
                                                                    cardEstablishmentImagesRecordList
                                                                            .isNotEmpty
                                                                        ? cardEstablishmentImagesRecordList
                                                                            .first
                                                                        : null;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'LIST_OF_ESTABLISHMENTS_CardEstablishment');
                                                                    logFirebaseEvent(
                                                                        'CardEstablishment_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'ShowOfEstablishment',
                                                                      queryParameters:
                                                                          {
                                                                        'establishmentDetails':
                                                                            serializeParam(
                                                                          listEstablishmentsQueryEstablishmentsRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        1.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                                (cardEstablishmentImagesRecord?.video == null || cardEstablishmentImagesRecord?.video == ''))
                                                                              FlutterFlowMediaDisplay(
                                                                                path: valueOrDefault<String>(
                                                                                  valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.image1,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              null &&
                                                                                          valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.image1,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          cardEstablishmentImagesRecord?.image1,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        )
                                                                                      : null,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                ),
                                                                                imageBuilder: (path) => ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    path,
                                                                                    width: double.infinity,
                                                                                    height: 220.0,
                                                                                    fit: BoxFit.fitWidth,
                                                                                  ),
                                                                                ),
                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                  path: path,
                                                                                  width: double.infinity,
                                                                                  height: 220.0,
                                                                                  autoPlay: false,
                                                                                  looping: true,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                ),
                                                                              ),
                                                                            if ((cardEstablishmentImagesRecord?.image1 == null || cardEstablishmentImagesRecord?.image1 == '') &&
                                                                                (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                              Stack(
                                                                                alignment: AlignmentDirectional(0.98, -0.95),
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                      valueOrDefault<String>(
                                                                                                    cardEstablishmentImagesRecord?.video,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                  ) !=
                                                                                                  null &&
                                                                                              valueOrDefault<String>(
                                                                                                    cardEstablishmentImagesRecord?.video,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                  ) !=
                                                                                                  ''
                                                                                          ? valueOrDefault<String>(
                                                                                              cardEstablishmentImagesRecord?.video,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            )
                                                                                          : null,
                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                    ),
                                                                                    imageBuilder: (path) => ClipRRect(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        path,
                                                                                        width: double.infinity,
                                                                                        height: 220.0,
                                                                                        fit: BoxFit.fitWidth,
                                                                                      ),
                                                                                    ),
                                                                                    videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                      path: path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      autoPlay: true,
                                                                                      looping: true,
                                                                                      showControls: false,
                                                                                      allowFullScreen: true,
                                                                                      allowPlaybackSpeedMenu: false,
                                                                                      pauseOnNavigate: false,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Video',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                                (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                              Stack(
                                                                                alignment: AlignmentDirectional(0.98, -0.95),
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                null &&
                                                                                            valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                ''
                                                                                        ? valueOrDefault<String>(
                                                                                            cardEstablishmentImagesRecord?.video,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          )
                                                                                        : null!,
                                                                                    imageBuilder: (path) => ClipRRect(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        path,
                                                                                        width: double.infinity,
                                                                                        height: 220.0,
                                                                                        fit: BoxFit.fitWidth,
                                                                                      ),
                                                                                    ),
                                                                                    videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                      path: path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      autoPlay: true,
                                                                                      looping: true,
                                                                                      showControls: true,
                                                                                      allowFullScreen: true,
                                                                                      allowPlaybackSpeedMenu: false,
                                                                                      pauseOnNavigate: false,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Video',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listEstablishmentsQueryEstablishmentsRecord.name,
                                                                                                  'Aucune',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                        child: SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Style musical',
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                              if (listEstablishmentsQueryEstablishmentsRecord.musicStyle.first != null && listEstablishmentsQueryEstablishmentsRecord.musicStyle.first != '')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.circle_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 6.0,
                                                                                                  ),
                                                                                                ),
                                                                                              Text(
                                                                                                listEstablishmentsQueryEstablishmentsRecord.musicStyle.first,
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Type',
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                              if (listEstablishmentsQueryEstablishmentsRecord.type.first != null && listEstablishmentsQueryEstablishmentsRecord.type.first != '')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.circle_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 6.0,
                                                                                                  ),
                                                                                                ),
                                                                                              Text(
                                                                                                listEstablishmentsQueryEstablishmentsRecord.type.first,
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Text(
                                                                                            listEstablishmentsQueryEstablishmentsRecord.adresse.city,
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (_model.musicFilterWeb ==
                                                        true
                                                    ? true
                                                    : false)
                                                  PagedListView<
                                                      DocumentSnapshot<
                                                          Object?>?,
                                                      EstablishmentsRecord>(
                                                    pagingController: _model
                                                        .setListEstablishmentsQueryMusicFilterController2(
                                                      EstablishmentsRecord
                                                          .collection
                                                          .where('music_style',
                                                              arrayContains: _model
                                                                  .musicStyleEstablishmentChoicesValue2)
                                                          .orderBy(
                                                              'created_time'),
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    reverse: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    builderDelegate:
                                                        PagedChildBuilderDelegate<
                                                            EstablishmentsRecord>(
                                                      // Customize what your widget looks like when it's loading the first page.
                                                      firstPageProgressIndicatorBuilder:
                                                          (_) => Center(
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
                                                      ),
                                                      // Customize what your widget looks like when it's loading another page.
                                                      newPageProgressIndicatorBuilder:
                                                          (_) => Center(
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
                                                      ),
                                                      noItemsFoundIndicatorBuilder:
                                                          (_) => Center(
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.2,
                                                          child:
                                                              EmptyListWidget(
                                                            icon: Icon(
                                                              Icons.business,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            title:
                                                                'Il n\'y a pas d\'établissements',
                                                            description: '',
                                                          ),
                                                        ),
                                                      ),
                                                      itemBuilder: (context, _,
                                                          listEstablishmentsQueryMusicFilterIndex) {
                                                        final listEstablishmentsQueryMusicFilterEstablishmentsRecord =
                                                            _model.listEstablishmentsQueryMusicFilterPagingController2!
                                                                    .itemList![
                                                                listEstablishmentsQueryMusicFilterIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ImagesRecord>>(
                                                              stream:
                                                                  queryImagesRecord(
                                                                parent:
                                                                    listEstablishmentsQueryMusicFilterEstablishmentsRecord
                                                                        .reference,
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ImagesRecord>
                                                                    cardEstablishmentImagesRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final cardEstablishmentImagesRecord =
                                                                    cardEstablishmentImagesRecordList
                                                                            .isNotEmpty
                                                                        ? cardEstablishmentImagesRecordList
                                                                            .first
                                                                        : null;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'LIST_OF_ESTABLISHMENTS_CardEstablishment');
                                                                    logFirebaseEvent(
                                                                        'CardEstablishment_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'ShowOfEstablishment',
                                                                      queryParameters:
                                                                          {
                                                                        'establishmentDetails':
                                                                            serializeParam(
                                                                          listEstablishmentsQueryMusicFilterEstablishmentsRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        1.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                                (cardEstablishmentImagesRecord?.video == null || cardEstablishmentImagesRecord?.video == ''))
                                                                              FlutterFlowMediaDisplay(
                                                                                path: valueOrDefault<String>(
                                                                                  valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.image1,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              null &&
                                                                                          valueOrDefault<String>(
                                                                                                cardEstablishmentImagesRecord?.image1,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          cardEstablishmentImagesRecord?.image1,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        )
                                                                                      : null,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                ),
                                                                                imageBuilder: (path) => ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    path,
                                                                                    width: double.infinity,
                                                                                    height: 220.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                  path: path,
                                                                                  width: 300.0,
                                                                                  autoPlay: false,
                                                                                  looping: true,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                ),
                                                                              ),
                                                                            if ((cardEstablishmentImagesRecord?.image1 == null || cardEstablishmentImagesRecord?.image1 == '') &&
                                                                                (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                              Stack(
                                                                                alignment: AlignmentDirectional(0.98, -0.95),
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                      valueOrDefault<String>(
                                                                                                    cardEstablishmentImagesRecord?.video,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                  ) !=
                                                                                                  null &&
                                                                                              valueOrDefault<String>(
                                                                                                    cardEstablishmentImagesRecord?.video,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                  ) !=
                                                                                                  ''
                                                                                          ? valueOrDefault<String>(
                                                                                              cardEstablishmentImagesRecord?.video,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            )
                                                                                          : null,
                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                    ),
                                                                                    imageBuilder: (path) => ClipRRect(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        path,
                                                                                        width: double.infinity,
                                                                                        height: 220.0,
                                                                                        fit: BoxFit.fitWidth,
                                                                                      ),
                                                                                    ),
                                                                                    videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                      path: path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      autoPlay: true,
                                                                                      looping: true,
                                                                                      showControls: false,
                                                                                      allowFullScreen: true,
                                                                                      allowPlaybackSpeedMenu: false,
                                                                                      pauseOnNavigate: false,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Video',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if ((cardEstablishmentImagesRecord?.image1 != null && cardEstablishmentImagesRecord?.image1 != '') &&
                                                                                (cardEstablishmentImagesRecord?.video != null && cardEstablishmentImagesRecord?.video != ''))
                                                                              Stack(
                                                                                alignment: AlignmentDirectional(0.98, -0.95),
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                null &&
                                                                                            valueOrDefault<String>(
                                                                                                  cardEstablishmentImagesRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ) !=
                                                                                                ''
                                                                                        ? valueOrDefault<String>(
                                                                                            cardEstablishmentImagesRecord?.video,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          )
                                                                                        : null!,
                                                                                    imageBuilder: (path) => ClipRRect(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        path,
                                                                                        width: double.infinity,
                                                                                        height: 220.0,
                                                                                        fit: BoxFit.fitWidth,
                                                                                      ),
                                                                                    ),
                                                                                    videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                      path: path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      autoPlay: true,
                                                                                      looping: true,
                                                                                      showControls: true,
                                                                                      allowFullScreen: true,
                                                                                      allowPlaybackSpeedMenu: false,
                                                                                      pauseOnNavigate: false,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Video',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listEstablishmentsQueryMusicFilterEstablishmentsRecord.name,
                                                                                                  'Aucune',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                        child: SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Style musical',
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                              if (listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first != null && listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first != '')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.circle_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 6.0,
                                                                                                  ),
                                                                                                ),
                                                                                              Text(
                                                                                                listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first,
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                              if ((listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first != null && listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.first != '') && (listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.last != null && listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.last != ''))
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.circle_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 6.0,
                                                                                                  ),
                                                                                                ),
                                                                                              Text(
                                                                                                listEstablishmentsQueryMusicFilterEstablishmentsRecord.musicStyle.last,
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Type',
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                              if (listEstablishmentsQueryMusicFilterEstablishmentsRecord.type.first != null && listEstablishmentsQueryMusicFilterEstablishmentsRecord.type.first != '')
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.circle_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 6.0,
                                                                                                  ),
                                                                                                ),
                                                                                              Text(
                                                                                                listEstablishmentsQueryMusicFilterEstablishmentsRecord.type.first,
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Text(
                                                                                            listEstablishmentsQueryMusicFilterEstablishmentsRecord.adresse.city,
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (_model.searchStateWeb ==
                                                    true)
                                                  Builder(
                                                    builder: (context) {
                                                      final searchResults = _model
                                                          .simpleSearchResults2
                                                          .map((e) => e)
                                                          .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: searchResults
                                                            .length,
                                                        itemBuilder: (context,
                                                            searchResultsIndex) {
                                                          final searchResultsItem =
                                                              searchResults[
                                                                  searchResultsIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'LIST_OF_ESTABLISHMENTS_CardEstablishment');
                                                                  logFirebaseEvent(
                                                                      'CardEstablishment_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'ShowOfEstablishment',
                                                                    queryParameters:
                                                                        {
                                                                      'establishmentDetails':
                                                                          serializeParam(
                                                                        searchResultsItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      StreamBuilder<
                                                                          List<
                                                                              ImagesRecord>>(
                                                                        stream:
                                                                            queryImagesRecord(
                                                                          parent:
                                                                              searchResultsItem.reference,
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<ImagesRecord>
                                                                              stackImagesRecordList =
                                                                              snapshot.data!;
                                                                          final stackImagesRecord = stackImagesRecordList.isNotEmpty
                                                                              ? stackImagesRecordList.first
                                                                              : null;
                                                                          return Stack(
                                                                            children: [
                                                                              if ((stackImagesRecord?.image1 != null && stackImagesRecord?.image1 != '') && (stackImagesRecord?.video == null || stackImagesRecord?.video == ''))
                                                                                FlutterFlowMediaDisplay(
                                                                                  path: stackImagesRecord!.image1,
                                                                                  imageBuilder: (path) => ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                    path: path,
                                                                                    width: 300.0,
                                                                                    autoPlay: false,
                                                                                    looping: true,
                                                                                    showControls: true,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                  ),
                                                                                ),
                                                                              if ((stackImagesRecord?.image1 == null || stackImagesRecord?.image1 == '') && (stackImagesRecord?.video != null && stackImagesRecord?.video != ''))
                                                                                FlutterFlowMediaDisplay(
                                                                                  path: stackImagesRecord!.video,
                                                                                  imageBuilder: (path) => ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      path,
                                                                                      width: double.infinity,
                                                                                      height: 220.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                    path: path,
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 220.0,
                                                                                    autoPlay: true,
                                                                                    looping: true,
                                                                                    showControls: true,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                          child: Text(
                                                                                            searchResultsItem.name,
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Style musical',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.circle_rounded,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 6.0,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              searchResultsItem.musicStyle.first,
                                                                                              '*',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Type',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                              child: Icon(
                                                                                                Icons.circle_rounded,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 6.0,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                searchResultsItem.type.first,
                                                                                                '*',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Text(
                                                                                          searchResultsItem.adresse.city,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
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
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .addToStart(
                                                      SizedBox(height: 15.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
