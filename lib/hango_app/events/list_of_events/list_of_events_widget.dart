import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_lists/empty_list/empty_list_widget.dart';
import '/components/web_side_bar/side_nav_web/side_nav_web_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'list_of_events_model.dart';
export 'list_of_events_model.dart';

class ListOfEventsWidget extends StatefulWidget {
  const ListOfEventsWidget({
    Key? key,
    this.eventDetails,
  }) : super(key: key);

  final DocumentReference? eventDetails;

  @override
  _ListOfEventsWidgetState createState() => _ListOfEventsWidgetState();
}

class _ListOfEventsWidgetState extends State<ListOfEventsWidget> {
  late ListOfEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfEventsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListOfEvents'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIST_OF_EVENTS_ListOfEvents_ON_INIT_STAT');
      logFirebaseEvent('ListOfEvents_update_app_state');
      setState(() {
        FFAppState().selectedDate = _model.calendarSelectedDay1?.start;
      });
    });

    _model.eventSearchController1 ??= TextEditingController();
    _model.eventSearchController2 ??= TextEditingController();
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

    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(
        queryBuilder: (eventsRecord) => eventsRecord.where(
          'dateEvent',
          isGreaterThanOrEqualTo: getCurrentTimestamp,
        ),
        limit: 15,
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
        List<EventsRecord> listOfEventsEventsRecordList = snapshot.data!;
        return Title(
            title: 'ListOfEvents',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
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
                                      Container(
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Logo_-_bleu_clair.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.0,
                                          fit: BoxFit.contain,
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
                                    ]
                                        .addToStart(SizedBox(height: 30.0))
                                        .addToEnd(SizedBox(height: 30.0)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: SingleChildScrollView(
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
                                              'LIST_OF_EVENTS_LinkToUserLogin_ON_TAP');
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
                                                        'LIST_OF_EVENTS_Button-create-account_ON_');
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
                                                          'LIST_OF_EVENTS_Button-NT-Dashboard_ON_TA');
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
                                                        'LIST_OF_EVENTS_PAGE_Button-Login_ON_TAP');
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
                                                        'LIST_OF_EVENTS_Button-Logiout_ON_TAP');
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  appBar: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return true;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return false;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return false;
                    } else {
                      return false;
                    }
                  }()
                      ? AppBar(
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                          automaticallyImplyLeading: false,
                          leading: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.menu_rounded,
                              color: Color(0xFF10212E),
                              size: 30.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LIST_OF_EVENTS_menu_rounded_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_drawer');
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                          title: Text(
                            dateTimeFormat(
                              'MMMMEEEEd',
                              FFAppState().selectedDate,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                          actions: [],
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(130.0),
                            child: FlutterFlowCalendar(
                              color: FlutterFlowTheme.of(context).primary,
                              weekFormat: true,
                              weekStartsMonday: true,
                              initialDate: getCurrentTimestamp,
                              onChange: (DateTimeRange? newSelectedDate) async {
                                _model.calendarSelectedDay1 = newSelectedDate;
                                logFirebaseEvent(
                                    'LIST_OF_EVENTS_Calendar_468d6wmn_ON_DATE');
                                logFirebaseEvent('Calendar_update_app_state');
                                setState(() {
                                  FFAppState().selectedDate =
                                      _model.calendarSelectedDay1?.start;
                                });
                                setState(() {});
                              },
                              titleStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              dayOfWeekStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                              dateStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              selectedDateStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                              inactiveDateStyle: TextStyle(),
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                          ),
                          centerTitle: false,
                          elevation: 2.0,
                        )
                      : null,
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
                            nav2: true,
                            nav3: false,
                          ),
                        ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                desktop: false,
                              ))
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .eventSearchController1,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.eventSearchController1',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'LIST_OF_EVENTS_eventSearch_ON_TEXTFIELD_');
                                                        // MobileEventSearch
                                                        logFirebaseEvent(
                                                            'eventSearch_MobileEventSearch');
                                                        safeSetState(() {
                                                          _model.simpleSearchResults1 =
                                                              TextSearch(
                                                            listOfEventsEventsRecordList
                                                                .map(
                                                                  (record) =>
                                                                      TextSearchItem(
                                                                          record,
                                                                          [
                                                                        record
                                                                            .siteWeb!,
                                                                        record
                                                                            .description!,
                                                                        record
                                                                            .title!,
                                                                        record
                                                                            .eventId!
                                                                      ]),
                                                                )
                                                                .toList(),
                                                          )
                                                                  .search(_model
                                                                      .eventSearchController1
                                                                      .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .take(5)
                                                                  .toList();
                                                          ;
                                                        });
                                                        logFirebaseEvent(
                                                            'eventSearch_update_page_state');
                                                        setState(() {
                                                          _model.filterOnEventMobile =
                                                              false;
                                                          _model.filterOffEventMobile =
                                                              false;
                                                          _model.typeFilterMobile =
                                                              false;
                                                          _model.musicFilterMobile =
                                                              false;
                                                          _model.searchEventStateMobile =
                                                              true;
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
                                                            'Trouvez votre événement',
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                          Icons.search_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        suffixIcon: _model
                                                                .eventSearchController1!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .eventSearchController1
                                                                      ?.clear();
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  size: 20.0,
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
                                                          .eventSearchController1Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (valueOrDefault<bool>(
                                                      _model.filterOnEventMobile ==
                                                          false,
                                                      true,
                                                    )) {
                                                      return FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
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
                                                              'LIST_OF_EVENTS_filter_list_sharp_ICN_ON_');
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          logFirebaseEvent(
                                                              'IconButton_update_page_state');
                                                          setState(() {
                                                            _model.filterOnEventMobile =
                                                                true;
                                                            _model.filterOffEventMobile =
                                                                false;
                                                            _model.typeFilterMobile =
                                                                false;
                                                            _model.musicFilterMobile =
                                                                false;
                                                            _model.searchEventStateMobile =
                                                                false;
                                                          });
                                                        },
                                                      );
                                                    } else {
                                                      return FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
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
                                                              'LIST_OF_EVENTS_PAGE_clear_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_update_page_state');
                                                          setState(() {
                                                            _model.filterOnEventMobile =
                                                                false;
                                                            _model.filterOffEventMobile =
                                                                true;
                                                            _model.typeFilterMobile =
                                                                false;
                                                            _model.musicFilterMobile =
                                                                false;
                                                            _model.searchEventStateMobile =
                                                                false;
                                                          });
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: Wrap(
                                              spacing: 10.0,
                                              runSpacing: 10.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                  _model.filterOnEventMobile ==
                                                          true
                                                      ? true
                                                      : false,
                                                  false,
                                                ))
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
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        width: double.infinity,
                                                        color: Colors.white,
                                                        child:
                                                            ExpandableNotifier(
                                                          initialExpanded:
                                                              false,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Text(
                                                              'Type ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    .TypeOfEvent
                                                                    .map((label) =>
                                                                        ChipData(
                                                                            label))
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.typeEventChoicesValue1 =
                                                                          val?.first);
                                                                  logFirebaseEvent(
                                                                      'LIST_OF_EVENTS_typeEventChoices_ON_FORM_');
                                                                  logFirebaseEvent(
                                                                      'typeEventChoices_update_page_state');
                                                                  setState(() {
                                                                    _model.filterOnEventMobile =
                                                                        true;
                                                                    _model.filterOffEventMobile =
                                                                        false;
                                                                    _model.typeFilterMobile =
                                                                        true;
                                                                    _model.musicFilterMobile =
                                                                        false;
                                                                    _model.searchEventStateMobile =
                                                                        false;
                                                                  });
                                                                },
                                                                selectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                  iconColor: Color(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                  iconColor: Color(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                        .typeEventChoicesValueController1 ??=
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
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  _model.filterOnEventMobile ==
                                                          true
                                                      ? true
                                                      : false,
                                                  false,
                                                ))
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
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        width: double.infinity,
                                                        color: Colors.white,
                                                        child:
                                                            ExpandableNotifier(
                                                          initialExpanded:
                                                              false,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Text(
                                                              'Musique Style ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                      _model.musicStyleEventChoicesValue1 =
                                                                          val?.first);
                                                                  logFirebaseEvent(
                                                                      'LIST_OF_EVENTS_musicStyleEventChoices_ON');
                                                                  logFirebaseEvent(
                                                                      'musicStyleEventChoices_update_page_state');
                                                                  setState(() {
                                                                    _model.filterOnEventMobile =
                                                                        true;
                                                                    _model.filterOffEventMobile =
                                                                        false;
                                                                    _model.typeFilterMobile =
                                                                        false;
                                                                    _model.musicFilterMobile =
                                                                        true;
                                                                    _model.searchEventStateMobile =
                                                                        false;
                                                                  });
                                                                },
                                                                selectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                  iconColor: Color(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                  iconColor: Color(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                        .musicStyleEventChoicesValueController1 ??=
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
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
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
                                            (_model.filterOnEventMobile ==
                                                        false) &&
                                                    (_model.typeFilterMobile ==
                                                        false) &&
                                                    (_model.musicFilterMobile ==
                                                        false) &&
                                                    (_model.searchEventStateMobile ==
                                                        false)
                                                ? true
                                                : false,
                                            true,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final listEvents =
                                                      listOfEventsEventsRecordList
                                                          .map((e) => e)
                                                          .toList();
                                                  if (listEvents.isEmpty) {
                                                    return EmptyListWidget(
                                                      icon: Icon(
                                                        Icons.event,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 30.0,
                                                      ),
                                                      title:
                                                          'Il n\'y a pas des événements',
                                                      description: '',
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listEvents.length,
                                                    itemBuilder: (context,
                                                        listEventsIndex) {
                                                      final listEventsItem =
                                                          listEvents[
                                                              listEventsIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: StreamBuilder<
                                                            EstablishmentsRecord>(
                                                          stream: EstablishmentsRecord
                                                              .getDocument(
                                                                  listEventsItem
                                                                      .establishmentId!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final cardEventsEstablishmentsRecord =
                                                                snapshot.data!;
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'CardEvents_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'ShowOfEvents',
                                                                  queryParameters:
                                                                      {
                                                                    'showOfEvents':
                                                                        serializeParam(
                                                                      listEventsItem
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
                                                                              16.0),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            MediaRecord>>(
                                                                      stream:
                                                                          queryMediaRecord(
                                                                        parent:
                                                                            listEventsItem.reference,
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
                                                                        List<MediaRecord>
                                                                            containerMediaRecordList =
                                                                            snapshot.data!;
                                                                        final containerMediaRecord = containerMediaRecordList.isNotEmpty
                                                                            ? containerMediaRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              180.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(16.0),
                                                                              topRight: Radius.circular(16.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (valueOrDefault<bool>(
                                                                                containerMediaRecord?.image != null && containerMediaRecord?.image != '',
                                                                                true,
                                                                              )) {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(16.0),
                                                                                    topRight: Radius.circular(16.0),
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      containerMediaRecord?.image,
                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                    ),
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 180.0,
                                                                                    fit: BoxFit.cover,
                                                                                    errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                      'assets/images/error_image.png',
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 180.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return FlutterFlowMediaDisplay(
                                                                                  path: valueOrDefault<String>(
                                                                                    containerMediaRecord?.video,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                  ),
                                                                                  imageBuilder: (path) => ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(16.0),
                                                                                      topRight: Radius.circular(16.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      path,
                                                                                      width: 300.0,
                                                                                      height: 300.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                    path: path,
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 180.0,
                                                                                    autoPlay: true,
                                                                                    looping: true,
                                                                                    showControls: true,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      listEventsItem.title,
                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                  stream: queryScheduleEventRecord(
                                                                                    parent: listEventsItem.reference,
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
                                                                                    List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                    final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            '${dateTimeFormat(
                                                                                              'd/M/y',
                                                                                              rowScheduleEventRecord?.date,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            )} de ${dateTimeFormat(
                                                                                              'Hm',
                                                                                              rowScheduleEventRecord?.scheduleStart,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            )} - ${dateTimeFormat(
                                                                                              'Hm',
                                                                                              rowScheduleEventRecord?.scheduleEnd,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            )}',
                                                                                            ' Aucun horaire pour le moment',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge,
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                      child: Text(
                                                                                        cardEventsEstablishmentsRecord.name,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      cardEventsEstablishmentsRecord.adresse.city,
                                                                                      '*',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            valueOrDefault<bool>(
                                              _model.typeFilterMobile == true,
                                              false,
                                            )
                                                ? true
                                                : false,
                                            false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: PagedListView<
                                                  DocumentSnapshot<Object?>?,
                                                  EventsRecord>(
                                                pagingController: _model
                                                    .setListEventsTypeFilterController1(
                                                  EventsRecord.collection.where(
                                                    'typeEvent',
                                                    arrayContains: _model
                                                        .typeEventChoicesValue1,
                                                  ),
                                                ),
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                reverse: false,
                                                scrollDirection: Axis.vertical,
                                                builderDelegate:
                                                    PagedChildBuilderDelegate<
                                                        EventsRecord>(
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
                                                      listEventsTypeFilterIndex) {
                                                    final listEventsTypeFilterEventsRecord =
                                                        _model.listEventsTypeFilterPagingController1!
                                                                .itemList![
                                                            listEventsTypeFilterIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: StreamBuilder<
                                                          EstablishmentsRecord>(
                                                        stream: EstablishmentsRecord
                                                            .getDocument(
                                                                listEventsTypeFilterEventsRecord
                                                                    .establishmentId!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          final cardEventsEstablishmentsRecord =
                                                              snapshot.data!;
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'CardEvents_navigate_to');
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 1.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      MediaRecord>>(
                                                                stream:
                                                                    queryMediaRecord(
                                                                  parent: listEventsTypeFilterEventsRecord
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
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<MediaRecord>
                                                                      mainCardColumnMediaRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final mainCardColumnMediaRecord = mainCardColumnMediaRecordList
                                                                          .isNotEmpty
                                                                      ? mainCardColumnMediaRecordList
                                                                          .first
                                                                      : null;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            mainCardColumnMediaRecord?.image,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                          ),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              180.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        listEventsTypeFilterEventsRecord.title,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                    stream: queryScheduleEventRecord(
                                                                                      parent: listEventsTypeFilterEventsRecord.reference,
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
                                                                                      List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                      // Return an empty Container when the item does not exist.
                                                                                      if (snapshot.data!.isEmpty) {
                                                                                        return Container();
                                                                                      }
                                                                                      final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              '${dateTimeFormat(
                                                                                                'd/M/y',
                                                                                                rowScheduleEventRecord?.date,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )} de ${dateTimeFormat(
                                                                                                'Hm',
                                                                                                rowScheduleEventRecord?.scheduleStart,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )} - ${dateTimeFormat(
                                                                                                'Hm',
                                                                                                rowScheduleEventRecord?.scheduleEnd,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )}',
                                                                                              ' Aucun horaire pour le moment',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge,
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                        child: Text(
                                                                                          cardEventsEstablishmentsRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        cardEventsEstablishmentsRecord.adresse.city,
                                                                                        '*',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            valueOrDefault<bool>(
                                              _model.musicFilterMobile == true,
                                              false,
                                            )
                                                ? true
                                                : false,
                                            false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: PagedListView<
                                                  DocumentSnapshot<Object?>?,
                                                  EventsRecord>(
                                                pagingController: _model
                                                    .setListEventsMusicFilterController1(
                                                  EventsRecord.collection.where(
                                                    'music_sytle',
                                                    arrayContains: _model
                                                        .musicStyleEventChoicesValue1,
                                                  ),
                                                ),
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                reverse: false,
                                                scrollDirection: Axis.vertical,
                                                builderDelegate:
                                                    PagedChildBuilderDelegate<
                                                        EventsRecord>(
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
                                                      listEventsMusicFilterIndex) {
                                                    final listEventsMusicFilterEventsRecord =
                                                        _model.listEventsMusicFilterPagingController1!
                                                                .itemList![
                                                            listEventsMusicFilterIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: StreamBuilder<
                                                          EstablishmentsRecord>(
                                                        stream: EstablishmentsRecord
                                                            .getDocument(
                                                                listEventsMusicFilterEventsRecord
                                                                    .establishmentId!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          final cardEventsEstablishmentsRecord =
                                                              snapshot.data!;
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'CardEvents_navigate_to');
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 1.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      MediaRecord>>(
                                                                stream:
                                                                    queryMediaRecord(
                                                                  parent: listEventsMusicFilterEventsRecord
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
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<MediaRecord>
                                                                      mainCardColumnMediaRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final mainCardColumnMediaRecord = mainCardColumnMediaRecordList
                                                                          .isNotEmpty
                                                                      ? mainCardColumnMediaRecordList
                                                                          .first
                                                                      : null;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            mainCardColumnMediaRecord?.image,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                          ),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              180.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        listEventsMusicFilterEventsRecord.title,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                    stream: queryScheduleEventRecord(
                                                                                      parent: listEventsMusicFilterEventsRecord.reference,
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
                                                                                      List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                      // Return an empty Container when the item does not exist.
                                                                                      if (snapshot.data!.isEmpty) {
                                                                                        return Container();
                                                                                      }
                                                                                      final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              '${dateTimeFormat(
                                                                                                'd/M/y',
                                                                                                rowScheduleEventRecord?.date,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )} de ${dateTimeFormat(
                                                                                                'Hm',
                                                                                                rowScheduleEventRecord?.scheduleStart,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )} - ${dateTimeFormat(
                                                                                                'Hm',
                                                                                                rowScheduleEventRecord?.scheduleEnd,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )}',
                                                                                              ' Aucun horaire pour le moment',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge,
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                        child: Text(
                                                                                          cardEventsEstablishmentsRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        cardEventsEstablishmentsRecord.adresse.city,
                                                                                        '*',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            valueOrDefault<bool>(
                                              _model.searchEventStateMobile ==
                                                  true,
                                              false,
                                            )
                                                ? true
                                                : false,
                                            false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final listEvents =
                                                      listOfEventsEventsRecordList
                                                          .map((e) => e)
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listEvents.length,
                                                    itemBuilder: (context,
                                                        listEventsIndex) {
                                                      final listEventsItem =
                                                          listEvents[
                                                              listEventsIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: StreamBuilder<
                                                            EstablishmentsRecord>(
                                                          stream: EstablishmentsRecord
                                                              .getDocument(
                                                                  listEventsItem
                                                                      .establishmentId!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final cardEventsEstablishmentsRecord =
                                                                snapshot.data!;
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'CardEvents_navigate_to');
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
                                                                              16.0),
                                                                ),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        MediaRecord>>(
                                                                  stream:
                                                                      queryMediaRecord(
                                                                    parent: listEventsItem
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
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<MediaRecord>
                                                                        mainCardColumnMediaRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final mainCardColumnMediaRecord = mainCardColumnMediaRecordList
                                                                            .isNotEmpty
                                                                        ? mainCardColumnMediaRecordList
                                                                            .first
                                                                        : null;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              mainCardColumnMediaRecord?.image,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                            ),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                180.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          listEventsItem.title,
                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                      stream: queryScheduleEventRecord(
                                                                                        parent: listEventsItem.reference,
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
                                                                                        List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                        // Return an empty Container when the item does not exist.
                                                                                        if (snapshot.data!.isEmpty) {
                                                                                          return Container();
                                                                                        }
                                                                                        final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                '${dateTimeFormat(
                                                                                                  'd/M/y',
                                                                                                  rowScheduleEventRecord?.date,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} de ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowScheduleEventRecord?.scheduleStart,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} - ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowScheduleEventRecord?.scheduleEnd,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )}',
                                                                                                ' Aucun horaire pour le moment',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                          child: Text(
                                                                                            cardEventsEstablishmentsRecord.name,
                                                                                            style: FlutterFlowTheme.of(context).labelMedium,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          cardEventsEstablishmentsRecord.adresse.city,
                                                                                          '*',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
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
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                            ))
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.4,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child:
                                                              FlutterFlowCalendar(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            weekFormat: true,
                                                            weekStartsMonday:
                                                                false,
                                                            initialDate:
                                                                getCurrentTimestamp,
                                                            rowHeight: 40.0,
                                                            onChange:
                                                                (DateTimeRange?
                                                                    newSelectedDate) async {
                                                              _model.calendarSelectedDay2 =
                                                                  newSelectedDate;
                                                              logFirebaseEvent(
                                                                  'LIST_OF_EVENTS_Calendar_jfkj0yg8_ON_DATE');
                                                              logFirebaseEvent(
                                                                  'Calendar_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .selectedDate =
                                                                    _model
                                                                        .calendarSelectedDay2
                                                                        ?.start;
                                                              });
                                                              setState(() {});
                                                            },
                                                            titleStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                            dayOfWeekStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            dateStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                            selectedDateStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                            inactiveDateStyle:
                                                                TextStyle(),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
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
                                                            .eventSearchController2,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.eventSearchController2',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => setState(() {}),
                                                        ),
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          logFirebaseEvent(
                                                              'LIST_OF_EVENTS_eventSearch_ON_TEXTFIELD_');
                                                          logFirebaseEvent(
                                                              'eventSearch_simple_search');
                                                          safeSetState(() {
                                                            _model.simpleSearchResults2 =
                                                                TextSearch(
                                                              listOfEventsEventsRecordList
                                                                  .map(
                                                                    (record) =>
                                                                        TextSearchItem(
                                                                            record,
                                                                            [
                                                                          record
                                                                              .siteWeb!,
                                                                          record
                                                                              .description!,
                                                                          record
                                                                              .title!,
                                                                          record
                                                                              .eventId!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(_model
                                                                        .eventSearchController2
                                                                        .text)
                                                                    .map((r) =>
                                                                        r.object)
                                                                    .take(5)
                                                                    .toList();
                                                            ;
                                                          });
                                                          logFirebaseEvent(
                                                              'eventSearch_update_page_state');
                                                          setState(() {
                                                            _model.filterOnEventMobile =
                                                                false;
                                                            _model.filterOffEventMobile =
                                                                false;
                                                            _model.typeFilterMobile =
                                                                false;
                                                            _model.musicFilterMobile =
                                                                false;
                                                            _model.searchEventStateMobile =
                                                                true;
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
                                                              'Trouvez votre événement',
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                            Icons.search_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                          suffixIcon: _model
                                                                  .eventSearchController2!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .eventSearchController2
                                                                        ?.clear();
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent3,
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
                                                            .eventSearchController2Validator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (valueOrDefault<bool>(
                                                        _model.filterOnEventMobile ==
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
                                                                'LIST_OF_EVENTS_filter_list_sharp_ICN_ON_');
                                                            logFirebaseEvent(
                                                                'IconButton_bottom_sheet');
                                                            logFirebaseEvent(
                                                                'IconButton_update_page_state');
                                                            setState(() {
                                                              _model.filterOnEventMobile =
                                                                  true;
                                                              _model.filterOffEventMobile =
                                                                  false;
                                                              _model.typeFilterMobile =
                                                                  false;
                                                              _model.musicFilterMobile =
                                                                  false;
                                                              _model.searchEventStateMobile =
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
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'LIST_OF_EVENTS_PAGE_clear_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_update_page_state');
                                                            setState(() {
                                                              _model.filterOnEventMobile =
                                                                  false;
                                                              _model.filterOffEventMobile =
                                                                  true;
                                                              _model.typeFilterMobile =
                                                                  false;
                                                              _model.musicFilterMobile =
                                                                  false;
                                                              _model.searchEventStateMobile =
                                                                  false;
                                                            });
                                                            logFirebaseEvent(
                                                                'IconButton_bottom_sheet');
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                            if (valueOrDefault<bool>(
                                              _model.filterOnEventMobile == true
                                                  ? true
                                                  : false,
                                              false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 0.0),
                                                child: Wrap(
                                                  spacing: 10.0,
                                                  runSpacing: 10.0,
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
                                                                      .TypeOfEvent
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    setState(() =>
                                                                        _model.typeEventChoicesValue2 =
                                                                            val?.first);
                                                                    logFirebaseEvent(
                                                                        'LIST_OF_EVENTS_typeEventChoices_ON_FORM_');
                                                                    logFirebaseEvent(
                                                                        'typeEventChoices_update_page_state');
                                                                    setState(
                                                                        () {
                                                                      _model.filterOnEventMobile =
                                                                          true;
                                                                      _model.filterOffEventMobile =
                                                                          false;
                                                                      _model.typeFilterMobile =
                                                                          true;
                                                                      _model.musicFilterMobile =
                                                                          false;
                                                                      _model.searchEventStateMobile =
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
                                                                          .typeEventChoicesValueController2 ??=
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
                                                                        _model.musicStyleEventChoicesValue2 =
                                                                            val?.first);
                                                                    logFirebaseEvent(
                                                                        'LIST_OF_EVENTS_musicStyleEventChoices_ON');
                                                                    logFirebaseEvent(
                                                                        'musicStyleEventChoices_update_page_state');
                                                                    setState(
                                                                        () {
                                                                      _model.filterOnEventMobile =
                                                                          true;
                                                                      _model.filterOffEventMobile =
                                                                          false;
                                                                      _model.typeFilterMobile =
                                                                          false;
                                                                      _model.musicFilterMobile =
                                                                          true;
                                                                      _model.searchEventStateMobile =
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
                                                                          .musicStyleEventChoicesValueController2 ??=
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
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (valueOrDefault<bool>(
                                                        (_model
                                                                        .filterOnEventMobile ==
                                                                    false) &&
                                                                (_model.typeFilterMobile ==
                                                                    false) &&
                                                                (_model.musicFilterMobile ==
                                                                    false) &&
                                                                (_model.searchEventStateMobile ==
                                                                    false)
                                                            ? true
                                                            : false,
                                                        true,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listEvents =
                                                                  listOfEventsEventsRecordList
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList();
                                                              if (listEvents
                                                                  .isEmpty) {
                                                                return EmptyListWidget(
                                                                  icon: Icon(
                                                                    Icons.event,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                  title:
                                                                      'Il n\'y a pas des événements',
                                                                  description:
                                                                      '',
                                                                );
                                                              }
                                                              return ReorderableListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listEvents
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listEventsIndex) {
                                                                  final listEventsItem =
                                                                      listEvents[
                                                                          listEventsIndex];
                                                                  return Container(
                                                                    key: ValueKey("ListView_eaes475y" +
                                                                        '_' +
                                                                        listEventsIndex
                                                                            .toString()),
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                      child: StreamBuilder<
                                                                          EstablishmentsRecord>(
                                                                        stream:
                                                                            EstablishmentsRecord.getDocument(listEventsItem.establishmentId!),
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
                                                                          final cardEventsEstablishmentsRecord =
                                                                              snapshot.data!;
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                                              logFirebaseEvent('CardEvents_navigate_to');

                                                                              context.pushNamed(
                                                                                'ShowOfEvents',
                                                                                queryParameters: {
                                                                                  'showOfEvents': serializeParam(
                                                                                    listEventsItem.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Card(
                                                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 1.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  StreamBuilder<List<MediaRecord>>(
                                                                                    stream: queryMediaRecord(
                                                                                      parent: listEventsItem.reference,
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
                                                                                      List<MediaRecord> containerMediaRecordList = snapshot.data!;
                                                                                      final containerMediaRecord = containerMediaRecordList.isNotEmpty ? containerMediaRecordList.first : null;
                                                                                      return Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 180.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(16.0),
                                                                                            topRight: Radius.circular(16.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            if (valueOrDefault<bool>(
                                                                                              containerMediaRecord?.image != null && containerMediaRecord?.image != '',
                                                                                              true,
                                                                                            )) {
                                                                                              return ClipRRect(
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                  topLeft: Radius.circular(16.0),
                                                                                                  topRight: Radius.circular(16.0),
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerMediaRecord?.image,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                  ),
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  height: 180.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                    'assets/images/error_image.png',
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                    height: 180.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              return FlutterFlowMediaDisplay(
                                                                                                path: valueOrDefault<String>(
                                                                                                  containerMediaRecord?.video,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                                ),
                                                                                                imageBuilder: (path) => ClipRRect(
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(16.0),
                                                                                                    topRight: Radius.circular(16.0),
                                                                                                  ),
                                                                                                  child: Image.network(
                                                                                                    path,
                                                                                                    width: 300.0,
                                                                                                    height: 300.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                                  path: path,
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  height: 180.0,
                                                                                                  autoPlay: true,
                                                                                                  looping: true,
                                                                                                  showControls: true,
                                                                                                  allowFullScreen: true,
                                                                                                  allowPlaybackSpeedMenu: false,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listEventsItem.title,
                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                                stream: queryScheduleEventRecord(
                                                                                                  parent: listEventsItem.reference,
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
                                                                                                  List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                                  final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          '${dateTimeFormat(
                                                                                                            'd/M/y',
                                                                                                            rowScheduleEventRecord?.date,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )} de ${dateTimeFormat(
                                                                                                            'Hm',
                                                                                                            rowScheduleEventRecord?.scheduleStart,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )} - ${dateTimeFormat(
                                                                                                            'Hm',
                                                                                                            rowScheduleEventRecord?.scheduleEnd,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )}',
                                                                                                          ' Aucun horaire pour le moment',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                    child: Text(
                                                                                                      cardEventsEstablishmentsRecord.name,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    cardEventsEstablishmentsRecord.adresse.city,
                                                                                                    '*',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                        ),
                                                                                      ),
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
                                                                onReorder: (int
                                                                        reorderableOldIndex,
                                                                    int reorderableNewIndex) async {},
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      if (valueOrDefault<bool>(
                                                        _model.searchEventStateMobile ==
                                                            true,
                                                        false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listEvents =
                                                                  listOfEventsEventsRecordList
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList();
                                                              return ReorderableListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listEvents
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listEventsIndex) {
                                                                  final listEventsItem =
                                                                      listEvents[
                                                                          listEventsIndex];
                                                                  return Container(
                                                                    key: ValueKey("ListView_64s6gvd4" +
                                                                        '_' +
                                                                        listEventsIndex
                                                                            .toString()),
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                      child: StreamBuilder<
                                                                          EstablishmentsRecord>(
                                                                        stream:
                                                                            EstablishmentsRecord.getDocument(listEventsItem.establishmentId!),
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
                                                                          final cardEventsEstablishmentsRecord =
                                                                              snapshot.data!;
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                                              logFirebaseEvent('CardEvents_navigate_to');
                                                                            },
                                                                            child:
                                                                                Card(
                                                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 1.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: StreamBuilder<List<MediaRecord>>(
                                                                                stream: queryMediaRecord(
                                                                                  parent: listEventsItem.reference,
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
                                                                                  List<MediaRecord> mainCardColumnMediaRecordList = snapshot.data!;
                                                                                  final mainCardColumnMediaRecord = mainCardColumnMediaRecordList.isNotEmpty ? mainCardColumnMediaRecordList.first : null;
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            mainCardColumnMediaRecord?.image,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          ),
                                                                                          width: double.infinity,
                                                                                          height: 180.0,
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        listEventsItem.title,
                                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                                    stream: queryScheduleEventRecord(
                                                                                                      parent: listEventsItem.reference,
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
                                                                                                      List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                                      return Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              '${dateTimeFormat(
                                                                                                                'd/M/y',
                                                                                                                rowScheduleEventRecord?.date,
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              )} de ${dateTimeFormat(
                                                                                                                'Hm',
                                                                                                                rowScheduleEventRecord?.scheduleStart,
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              )} - ${dateTimeFormat(
                                                                                                                'Hm',
                                                                                                                rowScheduleEventRecord?.scheduleEnd,
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              )}',
                                                                                                              ' Aucun horaire pour le moment',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                          ),
                                                                                                        ],
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                        child: Text(
                                                                                                          cardEventsEstablishmentsRecord.name,
                                                                                                          style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        cardEventsEstablishmentsRecord.adresse.city,
                                                                                                        '*',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                onReorder: (int
                                                                        reorderableOldIndex,
                                                                    int reorderableNewIndex) async {},
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      if (valueOrDefault<bool>(
                                                        valueOrDefault<bool>(
                                                          _model.typeFilterMobile ==
                                                              true,
                                                          false,
                                                        )
                                                            ? true
                                                            : false,
                                                        false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: PagedListView<
                                                              DocumentSnapshot<
                                                                  Object?>?,
                                                              EventsRecord>(
                                                            pagingController: _model
                                                                .setListEventsTypeFilterController2(
                                                              EventsRecord
                                                                  .collection
                                                                  .where(
                                                                'typeEvent',
                                                                arrayContains:
                                                                    _model
                                                                        .typeEventChoicesValue2,
                                                              ),
                                                            ),
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            reverse: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            builderDelegate:
                                                                PagedChildBuilderDelegate<
                                                                    EventsRecord>(
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

                                                              itemBuilder: (context,
                                                                  _,
                                                                  listEventsTypeFilterIndex) {
                                                                final listEventsTypeFilterEventsRecord = _model
                                                                        .listEventsTypeFilterPagingController2!
                                                                        .itemList![
                                                                    listEventsTypeFilterIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: StreamBuilder<
                                                                      EstablishmentsRecord>(
                                                                    stream: EstablishmentsRecord.getDocument(
                                                                        listEventsTypeFilterEventsRecord
                                                                            .establishmentId!),
                                                                    builder:
                                                                        (context,
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
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final cardEventsEstablishmentsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'CardEvents_navigate_to');
                                                                        },
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              StreamBuilder<List<MediaRecord>>(
                                                                            stream:
                                                                                queryMediaRecord(
                                                                              parent: listEventsTypeFilterEventsRecord.reference,
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<MediaRecord> mainCardColumnMediaRecordList = snapshot.data!;
                                                                              final mainCardColumnMediaRecord = mainCardColumnMediaRecordList.isNotEmpty ? mainCardColumnMediaRecordList.first : null;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        mainCardColumnMediaRecord?.image,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                      ),
                                                                                      width: double.infinity,
                                                                                      height: 180.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 80.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listEventsTypeFilterEventsRecord.title,
                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                                stream: queryScheduleEventRecord(
                                                                                                  parent: listEventsTypeFilterEventsRecord.reference,
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
                                                                                                  List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                                  // Return an empty Container when the item does not exist.
                                                                                                  if (snapshot.data!.isEmpty) {
                                                                                                    return Container();
                                                                                                  }
                                                                                                  final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          '${dateTimeFormat(
                                                                                                            'd/M/y',
                                                                                                            rowScheduleEventRecord?.date,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )} de ${dateTimeFormat(
                                                                                                            'Hm',
                                                                                                            rowScheduleEventRecord?.scheduleStart,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )} - ${dateTimeFormat(
                                                                                                            'Hm',
                                                                                                            rowScheduleEventRecord?.scheduleEnd,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )}',
                                                                                                          ' Aucun horaire pour le moment',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                    child: Text(
                                                                                                      cardEventsEstablishmentsRecord.name,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    cardEventsEstablishmentsRecord.adresse.city,
                                                                                                    '*',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      if (valueOrDefault<bool>(
                                                        valueOrDefault<bool>(
                                                          _model.typeFilterMobile ==
                                                              true,
                                                          false,
                                                        )
                                                            ? true
                                                            : false,
                                                        false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: PagedListView<
                                                              DocumentSnapshot<
                                                                  Object?>?,
                                                              EventsRecord>(
                                                            pagingController: _model
                                                                .setListEventsMusicFilterController2(
                                                              EventsRecord
                                                                  .collection
                                                                  .where(
                                                                'music_sytle',
                                                                arrayContains:
                                                                    _model
                                                                        .musicStyleEventChoicesValue2,
                                                              ),
                                                            ),
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            reverse: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            builderDelegate:
                                                                PagedChildBuilderDelegate<
                                                                    EventsRecord>(
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

                                                              itemBuilder: (context,
                                                                  _,
                                                                  listEventsMusicFilterIndex) {
                                                                final listEventsMusicFilterEventsRecord = _model
                                                                        .listEventsMusicFilterPagingController2!
                                                                        .itemList![
                                                                    listEventsMusicFilterIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: StreamBuilder<
                                                                      EstablishmentsRecord>(
                                                                    stream: EstablishmentsRecord.getDocument(
                                                                        listEventsMusicFilterEventsRecord
                                                                            .establishmentId!),
                                                                    builder:
                                                                        (context,
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
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final cardEventsEstablishmentsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIST_OF_EVENTS_PAGE_CardEvents_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'CardEvents_navigate_to');
                                                                        },
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              StreamBuilder<List<MediaRecord>>(
                                                                            stream:
                                                                                queryMediaRecord(
                                                                              parent: listEventsMusicFilterEventsRecord.reference,
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<MediaRecord> mainCardColumnMediaRecordList = snapshot.data!;
                                                                              final mainCardColumnMediaRecord = mainCardColumnMediaRecordList.isNotEmpty ? mainCardColumnMediaRecordList.first : null;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        mainCardColumnMediaRecord?.image,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                      ),
                                                                                      width: double.infinity,
                                                                                      height: 180.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 80.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listEventsMusicFilterEventsRecord.title,
                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: StreamBuilder<List<ScheduleEventRecord>>(
                                                                                                stream: queryScheduleEventRecord(
                                                                                                  parent: listEventsMusicFilterEventsRecord.reference,
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
                                                                                                  List<ScheduleEventRecord> rowScheduleEventRecordList = snapshot.data!;
                                                                                                  // Return an empty Container when the item does not exist.
                                                                                                  if (snapshot.data!.isEmpty) {
                                                                                                    return Container();
                                                                                                  }
                                                                                                  final rowScheduleEventRecord = rowScheduleEventRecordList.isNotEmpty ? rowScheduleEventRecordList.first : null;
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          '${dateTimeFormat(
                                                                                                            'd/M/y',
                                                                                                            rowScheduleEventRecord?.date,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )} de ${dateTimeFormat(
                                                                                                            'Hm',
                                                                                                            rowScheduleEventRecord?.scheduleStart,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )} - ${dateTimeFormat(
                                                                                                            'Hm',
                                                                                                            rowScheduleEventRecord?.scheduleEnd,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          )}',
                                                                                                          ' Aucun horaire pour le moment',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                    child: Text(
                                                                                                      cardEventsEstablishmentsRecord.name,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    cardEventsEstablishmentsRecord.adresse.city,
                                                                                                    '*',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].addToStart(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
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
      },
    );
  }
}
