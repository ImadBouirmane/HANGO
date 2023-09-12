import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/images_delete_problem_admin_pop_up/images_delete_problem_admin_pop_up_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_est_step3_model.dart';
export 'create_est_step3_model.dart';

class CreateEstStep3Widget extends StatefulWidget {
  const CreateEstStep3Widget({
    Key? key,
    required this.estRef,
  }) : super(key: key);

  final DocumentReference? estRef;

  @override
  _CreateEstStep3WidgetState createState() => _CreateEstStep3WidgetState();
}

class _CreateEstStep3WidgetState extends State<CreateEstStep3Widget> {
  late CreateEstStep3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEstStep3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateEstStep3'});
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
        title: 'CreateEstStep3',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                          oneBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          oneIcon: Icon(
                            Icons.home_filled,
                          ),
                          twoBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          twoIcon: Icon(
                            Icons.event,
                          ),
                          threeColor: FlutterFlowTheme.of(context).tertiary400,
                          threeIcon: Icon(
                            Icons.house_outlined,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREATE_EST_STEP3_chevron_left_ICN_ON_TAP');
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
                                        'Créer un nouvelle établissement',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      Icons.home,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 12.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREATE_EST_STEP3_PAGE_home_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                        'Dashboard',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
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
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
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
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 20.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Media',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      StreamBuilder<
                                                          List<ImagesRecord>>(
                                                        stream:
                                                            queryImagesRecord(
                                                          parent: widget.estRef,
                                                          singleRecord: true,
                                                        ),
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
                                                          List<ImagesRecord>
                                                              imagesUploadImagesRecordList =
                                                              snapshot.data!;
                                                          final imagesUploadImagesRecord =
                                                              imagesUploadImagesRecordList
                                                                      .isNotEmpty
                                                                  ? imagesUploadImagesRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            4,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            10.0,
                                                                        childAspectRatio:
                                                                            1.0,
                                                                      ),
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            if (_model.uploadedFileUrl1 != null &&
                                                                                _model.uploadedFileUrl1 != '')
                                                                              Stack(
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                      _model.uploadedFileUrl1,
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
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 40.0,
                                                                                        fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                        icon: Icon(
                                                                                          Icons.delete,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('CREATE_EST_STEP3_PAGE_delete_ICN_ON_TAP');
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
                                                                            if (_model.uploadedFileUrl1 == null ||
                                                                                _model.uploadedFileUrl1 == '')
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
                                                                                      child: Builder(
                                                                                        builder: (context) => FlutterFlowIconButton(
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
                                                                                            logFirebaseEvent('CREATE_EST_STEP3_add_circle_ICN_ON_TAP');
                                                                                            logFirebaseEvent('IconButton_alert_dialog');
                                                                                            await showAlignedDialog(
                                                                                              context: context,
                                                                                              isGlobal: false,
                                                                                              avoidOverflow: false,
                                                                                              targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              builder: (dialogContext) {
                                                                                                return Material(
                                                                                                  color: Colors.transparent,
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                    child: ImagesDeleteProblemAdminPopUpWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));

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
                                                                          ],
                                                                        ),
                                                                        Stack(
                                                                          children: [
                                                                            if (_model.uploadedFileUrl2 != null &&
                                                                                _model.uploadedFileUrl2 != '')
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
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 40.0,
                                                                                        fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                        icon: Icon(
                                                                                          Icons.delete,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('CREATE_EST_STEP3_PAGE_delete_ICN_ON_TAP');
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
                                                                            if (_model.uploadedFileUrl2 == null ||
                                                                                _model.uploadedFileUrl2 == '')
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primary,
                                                                                        icon: Icon(
                                                                                          Icons.add_circle,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          size: 40.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('CREATE_EST_STEP3_add_circle_ICN_ON_TAP');
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
                                                                                      'Inserez votre image',
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Stack(
                                                                          children: [
                                                                            if (_model.uploadedFileUrl3 != null &&
                                                                                _model.uploadedFileUrl3 != '')
                                                                              Stack(
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                      _model.uploadedFileUrl3,
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
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 40.0,
                                                                                        fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                        icon: Icon(
                                                                                          Icons.delete,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('CREATE_EST_STEP3_PAGE_delete_ICN_ON_TAP');
                                                                                          logFirebaseEvent('IconButton_clear_uploaded_data');
                                                                                          setState(() {
                                                                                            _model.isDataUploading3 = false;
                                                                                            _model.uploadedLocalFile3 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                            _model.uploadedFileUrl3 = '';
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if (_model.uploadedFileUrl3 == null ||
                                                                                _model.uploadedFileUrl3 == '')
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primary,
                                                                                        icon: Icon(
                                                                                          Icons.add_circle,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          size: 40.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('CREATE_EST_STEP3_add_circle_ICN_ON_TAP');
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
                                                                                            setState(() => _model.isDataUploading3 = true);
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
                                                                                              _model.isDataUploading3 = false;
                                                                                            }
                                                                                            if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                              setState(() {
                                                                                                _model.uploadedLocalFile3 = selectedUploadedFiles.first;
                                                                                                _model.uploadedFileUrl3 = downloadUrls.first;
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
                                                                          ],
                                                                        ),
                                                                        Stack(
                                                                          children: [
                                                                            if (_model.uploadedFileUrl4 != null &&
                                                                                _model.uploadedFileUrl4 != '')
                                                                              Stack(
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                      _model.uploadedFileUrl4,
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
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 40.0,
                                                                                        fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                        icon: Icon(
                                                                                          Icons.delete,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('CREATE_EST_STEP3_PAGE_delete_ICN_ON_TAP');
                                                                                          logFirebaseEvent('IconButton_clear_uploaded_data');
                                                                                          setState(() {
                                                                                            _model.isDataUploading4 = false;
                                                                                            _model.uploadedLocalFile4 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                            _model.uploadedFileUrl4 = '';
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            if (_model.uploadedFileUrl4 == null ||
                                                                                _model.uploadedFileUrl4 == '')
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primary,
                                                                                        icon: Icon(
                                                                                          Icons.add_circle,
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          size: 40.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('CREATE_EST_STEP3_add_circle_ICN_ON_TAP');
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
                                                                                            setState(() => _model.isDataUploading4 = true);
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
                                                                                              _model.isDataUploading4 = false;
                                                                                            }
                                                                                            if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                              setState(() {
                                                                                                _model.uploadedLocalFile4 = selectedUploadedFiles.first;
                                                                                                _model.uploadedFileUrl4 = downloadUrls.first;
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
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 50.0)),
                                                          );
                                                        },
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              if (_model.uploadedFileUrl5 !=
                                                                      null &&
                                                                  _model.uploadedFileUrl5 !=
                                                                      '') {
                                                                return Container(
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
                                                                      FlutterFlowMediaDisplay(
                                                                        path: valueOrDefault<
                                                                            String>(
                                                                          _model.uploadedFileUrl5 != null && _model.uploadedFileUrl5 != ''
                                                                              ? valueOrDefault<String>(
                                                                                  _model.uploadedFileUrl5,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                                )
                                                                              : null,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hango-jmkvyo/assets/s6jl709e4v2s/Logo_-_bleu_clair.png',
                                                                        ),
                                                                        imageBuilder:
                                                                            (path) =>
                                                                                ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          child:
                                                                              Image.network(
                                                                            path,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.3,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.3,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                        videoPlayerBuilder:
                                                                            (path) =>
                                                                                FlutterFlowVideoPlayer(
                                                                          path:
                                                                              path,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.3,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.3,
                                                                          autoPlay:
                                                                              false,
                                                                          looping:
                                                                              true,
                                                                          showControls:
                                                                              true,
                                                                          allowFullScreen:
                                                                              true,
                                                                          allowPlaybackSpeedMenu:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.3,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryTransparent,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.delete,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              size: 24.0,
                                                                            ),
                                                                            showLoadingIndicator:
                                                                                true,
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('CREATE_EST_STEP3_PAGE_delete_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_clear_uploaded_data');
                                                                              setState(() {
                                                                                _model.isDataUploading5 = false;
                                                                                _model.uploadedLocalFile5 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                _model.uploadedFileUrl5 = '';
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              } else {
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryTransparent,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              60.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.add_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                40.0,
                                                                          ),
                                                                          showLoadingIndicator:
                                                                              true,
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('CREATE_EST_STEP3_add_circle_ICN_ON_TAP');
                                                                            // establishmentVideoUpload
                                                                            logFirebaseEvent('IconButton_establishmentVideoUpload');
                                                                            final selectedMedia =
                                                                                await selectMediaWithSourceBottomSheet(
                                                                              context: context,
                                                                              allowPhoto: false,
                                                                              allowVideo: true,
                                                                            );
                                                                            if (selectedMedia != null &&
                                                                                selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                              setState(() => _model.isDataUploading5 = true);
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
                                                                                _model.isDataUploading5 = false;
                                                                              }
                                                                              if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                setState(() {
                                                                                  _model.uploadedLocalFile5 = selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl5 = downloadUrls.first;
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
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 50.0)),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 15.0))
                                                        .around(SizedBox(
                                                            height: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 15.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CREATE_EST_STEP3_BTNValidateFrom_ON_TAP');
                                              logFirebaseEvent(
                                                  'BTNValidateFrom_backend_call');

                                              var imagesRecordReference =
                                                  ImagesRecord.createDoc(
                                                      widget.estRef!);
                                              await imagesRecordReference
                                                  .set(createImagesRecordData(
                                                image1: _model.uploadedFileUrl1,
                                                image2: _model.uploadedFileUrl2,
                                                image3: _model.uploadedFileUrl3,
                                                image4: _model.uploadedFileUrl4,
                                                video: _model.uploadedFileUrl5,
                                                establishmentRef: widget.estRef,
                                                updatedTime:
                                                    getCurrentTimestamp,
                                                creaatedTime:
                                                    getCurrentTimestamp,
                                              ));
                                              _model.imageEstUpload = ImagesRecord
                                                  .getDocumentFromData(
                                                      createImagesRecordData(
                                                        image1: _model
                                                            .uploadedFileUrl1,
                                                        image2: _model
                                                            .uploadedFileUrl2,
                                                        image3: _model
                                                            .uploadedFileUrl3,
                                                        image4: _model
                                                            .uploadedFileUrl4,
                                                        video: _model
                                                            .uploadedFileUrl5,
                                                        establishmentRef:
                                                            widget.estRef,
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        creaatedTime:
                                                            getCurrentTimestamp,
                                                      ),
                                                      imagesRecordReference);
                                              logFirebaseEvent(
                                                  'BTNValidateFrom_navigate_to');

                                              context.pushNamed('Dashboard');

                                              setState(() {});
                                            },
                                            text: 'Confirmer',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                      ].addToEnd(SizedBox(height: 20.0)),
                                    ),
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
  }
}
