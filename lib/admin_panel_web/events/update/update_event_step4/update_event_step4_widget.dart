import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_event_step4_model.dart';
export 'update_event_step4_model.dart';

class UpdateEventStep4Widget extends StatefulWidget {
  const UpdateEventStep4Widget({
    Key? key,
    required this.eventstDetails,
  }) : super(key: key);

  final DocumentReference? eventstDetails;

  @override
  _UpdateEventStep4WidgetState createState() => _UpdateEventStep4WidgetState();
}

class _UpdateEventStep4WidgetState extends State<UpdateEventStep4Widget> {
  late UpdateEventStep4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateEventStep4Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UpdateEventStep4'});
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

    return StreamBuilder<List<MediaRecord>>(
      stream: queryMediaRecord(
        parent: widget.eventstDetails,
        singleRecord: true,
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
        List<MediaRecord> updateEventStep4MediaRecordList = snapshot.data!;
        final updateEventStep4MediaRecord =
            updateEventStep4MediaRecordList.isNotEmpty
                ? updateEventStep4MediaRecordList.first
                : null;
        return Title(
            title: 'UpdateEventStep4',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Visibility(
                    visible: responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.sideBarModel,
                            updateCallback: () => setState(() {}),
                            child: SideBarWidget(
                              oneBG: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              oneIcon: Icon(
                                Icons.home_filled,
                              ),
                              twoBG: FlutterFlowTheme.of(context).tertiary400,
                              twoIcon: Icon(
                                Icons.event,
                              ),
                              threeColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              threeIcon: Icon(
                                Icons.house_outlined,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'UPDATE_EVENT_STEP4_chevron_left_ICN_ON_T');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Text(
                                            'Modification du l\'événement',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          Icons.home,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 12.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'UPDATE_EVENT_STEP4_PAGE_home_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_navigate_to');

                                          context.pushNamed(
                                            'Dashboard',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 300),
                                              ),
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  15.0,
                                                                  15.0,
                                                                  15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Images',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if ((_model.uploadedFileUrl1 !=
                                                                                null &&
                                                                            _model.uploadedFileUrl1 !=
                                                                                '') &&
                                                                        (updateEventStep4MediaRecord?.image ==
                                                                                null ||
                                                                            updateEventStep4MediaRecord?.image ==
                                                                                ''))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.00,
                                                                            0.00),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  _model.uploadedFileUrl1 != null && _model.uploadedFileUrl1 != '' ? _model.uploadedFileUrl1 : null,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                ),
                                                                                width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                fit: BoxFit.cover,
                                                                                errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                  'assets/images/error_image.png',
                                                                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.3,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryTransparent,
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 40.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 60.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                  icon: Icon(
                                                                                    Icons.delete,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 35.0,
                                                                                  ),
                                                                                  showLoadingIndicator: true,
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('UPDATE_EVENT_STEP4_delete_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_clear_uploaded_data');
                                                                                    setState(() {
                                                                                      _model.isDataUploading1 = false;
                                                                                      _model.uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                      _model.uploadedFileUrl1 = '';
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if ((updateEventStep4MediaRecord?.image ==
                                                                                null ||
                                                                            updateEventStep4MediaRecord?.image ==
                                                                                '') &&
                                                                        (_model.uploadedFileUrl1 ==
                                                                                null ||
                                                                            _model.uploadedFileUrl1 ==
                                                                                ''))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.00,
                                                                            0.00),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.3,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryTransparent,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 60.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).primary,
                                                                                  icon: Icon(
                                                                                    Icons.add_circle,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 40.0,
                                                                                  ),
                                                                                  showLoadingIndicator: true,
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('UPDATE_EVENT_STEP4_add_circle_ICN_ON_TAP');
                                                                                    // establishmentVideoUpload
                                                                                    logFirebaseEvent('IconButton_establishmentVideoUpload');
                                                                                    final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                      context: context,
                                                                                      imageQuality: 99,
                                                                                      allowPhoto: true,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      textColor: FlutterFlowTheme.of(context).primary,
                                                                                    );
                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                      setState(() => _model.isDataUploading1 = true);
                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                      var downloadUrls = <String>[];
                                                                                      try {
                                                                                        selectedUploadedFiles = selectedMedia
                                                                                            .map((m) => FFUploadedFile(
                                                                                                  name: m.storagePath.split('/').last,
                                                                                                  bytes: m.bytes,
                                                                                                  height: m.dimensions?.height,
                                                                                                  width: m.dimensions?.width,
                                                                                                  blurHash: m.blurHash,
                                                                                                ))
                                                                                            .toList();

                                                                                        downloadUrls = (await Future.wait(
                                                                                          selectedMedia.map(
                                                                                            (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                          ),
                                                                                        ))
                                                                                            .where((u) => u != null)
                                                                                            .map((u) => u!)
                                                                                            .toList();
                                                                                      } finally {
                                                                                        _model.isDataUploading1 = false;
                                                                                      }
                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                        setState(() {
                                                                                          _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                          _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                        });
                                                                                      } else {
                                                                                        setState(() {});
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Inserez votre image',
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 10.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if ((updateEventStep4MediaRecord?.image !=
                                                                                null &&
                                                                            updateEventStep4MediaRecord?.image !=
                                                                                '') &&
                                                                        (_model.uploadedFileUrl1 ==
                                                                                null ||
                                                                            _model.uploadedFileUrl1 ==
                                                                                ''))
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.3,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  valueOrDefault<String>(
                                                                                                updateEventStep4MediaRecord?.image,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              null &&
                                                                                          valueOrDefault<String>(
                                                                                                updateEventStep4MediaRecord?.image,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          updateEventStep4MediaRecord?.image,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        )
                                                                                      : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                ),
                                                                                width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                fit: BoxFit.cover,
                                                                                errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                  'assets/images/error_image.png',
                                                                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.3,
                                                                              height: MediaQuery.sizeOf(context).height * 0.3,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryTransparent,
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.00, 0.00),
                                                                                    child: FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 30.0,
                                                                                      borderWidth: 1.0,
                                                                                      buttonSize: 60.0,
                                                                                      fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                      icon: Icon(
                                                                                        Icons.delete,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        size: 35.0,
                                                                                      ),
                                                                                      showLoadingIndicator: true,
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('UPDATE_EVENT_STEP4_delete_ICN_ON_TAP');
                                                                                        // establishmentVideoUpload
                                                                                        logFirebaseEvent('IconButton_establishmentVideoUpload');
                                                                                        await FirebaseStorage.instance
                                                                                            .refFromURL(valueOrDefault<String>(
                                                                                              updateEventStep4MediaRecord?.image,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                            ))
                                                                                            .delete();
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      15.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  15.0,
                                                                  15.0,
                                                                  15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Vidéo',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.3,
                                                                  child: Stack(
                                                                    children: [
                                                                      if ((updateEventStep4MediaRecord?.video != null &&
                                                                              updateEventStep4MediaRecord?.video !=
                                                                                  '') &&
                                                                          (_model.uploadedFileUrl2 == null ||
                                                                              _model.uploadedFileUrl2 == ''))
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.3,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              FlutterFlowMediaDisplay(
                                                                                path: valueOrDefault<String>(
                                                                                  valueOrDefault<String>(
                                                                                                updateEventStep4MediaRecord?.video,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              null &&
                                                                                          valueOrDefault<String>(
                                                                                                updateEventStep4MediaRecord?.video,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                              ) !=
                                                                                              ''
                                                                                      ? valueOrDefault<String>(
                                                                                          updateEventStep4MediaRecord?.video,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        )
                                                                                      : valueOrDefault<String>(
                                                                                          null,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                        ),
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                ),
                                                                                imageBuilder: (path) => ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                  child: Image.network(
                                                                                    path,
                                                                                    width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                  path: path,
                                                                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                  autoPlay: false,
                                                                                  looping: true,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryTransparent,
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.00, 0.00),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 40.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 60.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                    icon: Icon(
                                                                                      Icons.delete,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                    showLoadingIndicator: true,
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('UPDATE_EVENT_STEP4_delete_ICN_ON_TAP');
                                                                                      logFirebaseEvent('IconButton_delete_data');
                                                                                      await FirebaseStorage.instance
                                                                                          .refFromURL(valueOrDefault<String>(
                                                                                            updateEventStep4MediaRecord?.video,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                          ))
                                                                                          .delete();
                                                                                      logFirebaseEvent('IconButton_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'La video a été supprimée',
                                                                                            style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 1950),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if ((updateEventStep4MediaRecord?.video == null ||
                                                                              updateEventStep4MediaRecord?.video ==
                                                                                  '') &&
                                                                          (_model.uploadedFileUrl2 == null ||
                                                                              _model.uploadedFileUrl2 == ''))
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.3,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryTransparent,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 60.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).primary,
                                                                                  icon: Icon(
                                                                                    Icons.add_circle,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 40.0,
                                                                                  ),
                                                                                  showLoadingIndicator: true,
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('UPDATE_EVENT_STEP4_add_circle_ICN_ON_TAP');
                                                                                    // establishmentVideoUpload
                                                                                    logFirebaseEvent('IconButton_establishmentVideoUpload');
                                                                                    final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                      context: context,
                                                                                      allowPhoto: false,
                                                                                      allowVideo: true,
                                                                                    );
                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                      setState(() => _model.isDataUploading2 = true);
                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                      var downloadUrls = <String>[];
                                                                                      try {
                                                                                        selectedUploadedFiles = selectedMedia
                                                                                            .map((m) => FFUploadedFile(
                                                                                                  name: m.storagePath.split('/').last,
                                                                                                  bytes: m.bytes,
                                                                                                  height: m.dimensions?.height,
                                                                                                  width: m.dimensions?.width,
                                                                                                  blurHash: m.blurHash,
                                                                                                ))
                                                                                            .toList();

                                                                                        downloadUrls = (await Future.wait(
                                                                                          selectedMedia.map(
                                                                                            (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                          ),
                                                                                        ))
                                                                                            .where((u) => u != null)
                                                                                            .map((u) => u!)
                                                                                            .toList();
                                                                                      } finally {
                                                                                        _model.isDataUploading2 = false;
                                                                                      }
                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                        setState(() {
                                                                                          _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                          _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                        });
                                                                                      } else {
                                                                                        setState(() {});
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Inserez votre video',
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 10.0)),
                                                                          ),
                                                                        ),
                                                                      if ((_model.uploadedFileUrl2 != null &&
                                                                              _model.uploadedFileUrl2 !=
                                                                                  '') &&
                                                                          (updateEventStep4MediaRecord?.video == null ||
                                                                              updateEventStep4MediaRecord?.video == ''))
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.3,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              FlutterFlowMediaDisplay(
                                                                                path: valueOrDefault<String>(
                                                                                  _model.uploadedFileUrl2,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                ),
                                                                                imageBuilder: (path) => ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                  child: Image.network(
                                                                                    path,
                                                                                    width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                                videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                  path: path,
                                                                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                  autoPlay: false,
                                                                                  looping: true,
                                                                                  showControls: true,
                                                                                  allowFullScreen: true,
                                                                                  allowPlaybackSpeedMenu: false,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryTransparent,
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.00, 0.00),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 40.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 60.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                    icon: Icon(
                                                                                      Icons.delete,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                    showLoadingIndicator: true,
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('UPDATE_EVENT_STEP4_delete_ICN_ON_TAP');
                                                                                      logFirebaseEvent('IconButton_clear_uploaded_data');
                                                                                      setState(() {
                                                                                        _model.isDataUploading2 = false;
                                                                                        _model.uploadedLocalFile2 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                        _model.uploadedFileUrl2 = '';
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      15.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 15.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'UPDATE_EVENT_STEP4_BTNValidateFrom_ON_TA');
                                                logFirebaseEvent(
                                                    'BTNValidateFrom_backend_call');

                                                await updateEventStep4MediaRecord!
                                                    .reference
                                                    .update(
                                                        createMediaRecordData(
                                                  image: valueOrDefault<String>(
                                                    _model.uploadedFileUrl1 !=
                                                                null &&
                                                            _model.uploadedFileUrl1 !=
                                                                ''
                                                        ? _model
                                                            .uploadedFileUrl1
                                                        : updateEventStep4MediaRecord
                                                            ?.image,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                  ),
                                                  video: valueOrDefault<String>(
                                                    _model.uploadedFileUrl2 !=
                                                                null &&
                                                            _model.uploadedFileUrl2 !=
                                                                ''
                                                        ? _model
                                                            .uploadedFileUrl2
                                                        : updateEventStep4MediaRecord
                                                            ?.video,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                  ),
                                                  updatedTime:
                                                      getCurrentTimestamp,
                                                  eventRef:
                                                      widget.eventstDetails,
                                                ));
                                                logFirebaseEvent(
                                                    'BTNValidateFrom_navigate_to');

                                                context.pushNamed('Dashboard');
                                              },
                                              text:
                                                  'Enregistrer les modifications',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 30.0)),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 20.0))
                                    .around(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
