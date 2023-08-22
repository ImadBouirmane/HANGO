import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_establishment_model.dart';
export 'update_establishment_model.dart';

class UpdateEstablishmentWidget extends StatefulWidget {
  const UpdateEstablishmentWidget({
    Key? key,
    required this.establishmentDetails,
  }) : super(key: key);

  final DocumentReference? establishmentDetails;

  @override
  _UpdateEstablishmentWidgetState createState() =>
      _UpdateEstablishmentWidgetState();
}

class _UpdateEstablishmentWidgetState extends State<UpdateEstablishmentWidget> {
  late UpdateEstablishmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateEstablishmentModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UpdateEstablishment'});
    _model.tFlatLngController ??= TextEditingController();
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

    return StreamBuilder<EstablishmentsRecord>(
      stream: EstablishmentsRecord.getDocument(widget.establishmentDetails!),
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
        final updateEstablishmentEstablishmentsRecord = snapshot.data!;
        return Title(
            title: 'UpdateEstablishment',
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
                            updateOnChange: true,
                            child: SideBarWidget(
                              oneBG: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              oneIcon: Icon(
                                Icons.home_filled,
                              ),
                              twoBG: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              twoIcon: Icon(
                                Icons.event,
                              ),
                              threeColor:
                                  FlutterFlowTheme.of(context).tertiary400,
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
                                              'UPDATE_ESTABLISHMENT_chevron_left_ICN_ON');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Modification du l\'établissement',
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
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              if (_model
                                                                      .isDataUploading1 ==
                                                                  true) {
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final uploadedImages = _model
                                                                            .uploadedFileUrls1
                                                                            .map((e) =>
                                                                                e)
                                                                            .toList();
                                                                        return GridView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
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
                                                                          itemCount:
                                                                              uploadedImages.length,
                                                                          itemBuilder:
                                                                              (context, uploadedImagesIndex) {
                                                                            final uploadedImagesItem =
                                                                                uploadedImages[uploadedImagesIndex];
                                                                            return Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.3,
                                                                              height: MediaQuery.sizeOf(context).height * 9223372036854776.0,
                                                                              child: Stack(
                                                                                children: [
                                                                                  FlutterFlowMediaDisplay(
                                                                                    path: valueOrDefault<String>(
                                                                                      (_model.uploadedFileUrls1.contains(uploadedImagesItem) != null ? _model.uploadedFileUrls1.map((e) => e).toList() : updateEstablishmentEstablishmentsRecord.image).first,
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
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
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
                                                                                          logFirebaseEvent('UPDATE_ESTABLISHMENT_delete_ICN_ON_TAP');
                                                                                          logFirebaseEvent('IconButton_clear_uploaded_data');
                                                                                          setState(() {
                                                                                            _model.isDataUploading1 = false;
                                                                                            _model.uploadedLocalFiles1 = [];
                                                                                            _model.uploadedFileUrls1 = [];
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final imagesExistsEst = updateEstablishmentEstablishmentsRecord
                                                                            .image
                                                                            .toList();
                                                                        return GridView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
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
                                                                          itemCount:
                                                                              imagesExistsEst.length,
                                                                          itemBuilder:
                                                                              (context, imagesExistsEstIndex) {
                                                                            final imagesExistsEstItem =
                                                                                imagesExistsEst[imagesExistsEstIndex];
                                                                            return FlutterFlowMediaDisplay(
                                                                              path: valueOrDefault<String>(
                                                                                imagesExistsEstItem,
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
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'UPDATE_ESTABLISHMENT_INSEREZ_VOS_IMAGES_');
                                                              logFirebaseEvent(
                                                                  'Button_upload_media_to_firebase');
                                                              final selectedMedia =
                                                                  await selectMedia(
                                                                mediaSource:
                                                                    MediaSource
                                                                        .photoGallery,
                                                                multiImage:
                                                                    true,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                setState(() =>
                                                                    _model.isDataUploading1 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                          .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                      (m) async => await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading1 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length &&
                                                                    downloadUrls
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  setState(() {
                                                                    _model.uploadedLocalFiles1 =
                                                                        selectedUploadedFiles;
                                                                    _model.uploadedFileUrls1 =
                                                                        downloadUrls;
                                                                  });
                                                                } else {
                                                                  setState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }
                                                            },
                                                            text:
                                                                'Inserez vos images',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 50.0)),
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
                                                              if (_model.uploadedFileUrl2 !=
                                                                      null &&
                                                                  _model.uploadedFileUrl2 !=
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
                                                                          _model.uploadedFileUrl2 != null && _model.uploadedFileUrl2 != ''
                                                                              ? _model.uploadedFileUrl2
                                                                              : updateEstablishmentEstablishmentsRecord.videoPath,
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
                                                                              0.0,
                                                                              0.0),
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
                                                                              logFirebaseEvent('UPDATE_ESTABLISHMENT_delete_ICN_ON_TAP');
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
                                                                            0.0,
                                                                            0.0),
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
                                                                            logFirebaseEvent('UPDATE_ESTABLISHMENT_add_circle_ICN_ON_T');
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
                                                      TextFormField(
                                                        controller: _model
                                                                .tFNameController ??=
                                                            TextEditingController(
                                                          text:
                                                              updateEstablishmentEstablishmentsRecord
                                                                  .name,
                                                        ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Nom de l\'établissement',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'Nom de l\'établissement',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFNameControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                                .tFDescriptionController ??=
                                                            TextEditingController(
                                                          text:
                                                              updateEstablishmentEstablishmentsRecord
                                                                  .description,
                                                        ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Description de l\'établissement',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFDescriptionControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'Precisez votre localization',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowPlacePicker(
                                                                  iOSGoogleMapsApiKey:
                                                                      'AIzaSyAu1xRj92baC1e6doE7Dh_7Drh0Wn7KO90',
                                                                  androidGoogleMapsApiKey:
                                                                      'AIzaSyCgAGHHm7w6LdGQegp1WY5ctmX-IsLeMek',
                                                                  webGoogleMapsApiKey:
                                                                      'AIzaSyDmP6aJTRYjSd5-3zsciJw0I45FuYiRim4',
                                                                  onSelect:
                                                                      (place) async {
                                                                    setState(() =>
                                                                        _model.placePickerValue =
                                                                            place);
                                                                  },
                                                                  defaultText:
                                                                      'Sélectionnez l\'emplacement',
                                                                  icon: Icon(
                                                                    Icons.place,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    size: 16.0,
                                                                  ),
                                                                  buttonOptions:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        400.0,
                                                                    height:
                                                                        40.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                        ),
                                                                    elevation:
                                                                        2.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                                .tFStreetController ??=
                                                            TextEditingController(
                                                          text:
                                                              updateEstablishmentEstablishmentsRecord
                                                                  .adresse
                                                                  .street,
                                                        ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Adresse ',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'Inscrire l\'adresse',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFStreetControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 150.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .tFzipCodeController ??=
                                                                    TextEditingController(
                                                                  text: updateEstablishmentEstablishmentsRecord
                                                                      .adresse
                                                                      .zipCode,
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Code Postal',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  hintText:
                                                                      'Code Postal',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                validator: _model
                                                                    .tFzipCodeControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width: 150.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .tFcityController ??=
                                                                    TextEditingController(
                                                                  text: updateEstablishmentEstablishmentsRecord
                                                                      .adresse
                                                                      .city,
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Ville',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  hintText:
                                                                      'Ville',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                validator: _model
                                                                    .tFcityControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 150.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .tFstateController ??=
                                                                    TextEditingController(
                                                                  text: updateEstablishmentEstablishmentsRecord
                                                                      .adresse
                                                                      .state,
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Etat',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  hintText:
                                                                      'Etat',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                validator: _model
                                                                    .tFstateControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width: 150.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                        .tFcountryController ??=
                                                                    TextEditingController(
                                                                  text: updateEstablishmentEstablishmentsRecord
                                                                      .adresse
                                                                      .country,
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Pays',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  hintText:
                                                                      'Pays',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                validator: _model
                                                                    .tFcountryControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .tFlatLngController,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Coordonnée géographique',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'Longitude et latitude',
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFlatLngControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                                .tFemailAddressController ??=
                                                            TextEditingController(
                                                          text:
                                                              updateEstablishmentEstablishmentsRecord
                                                                  .email,
                                                        ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Adresse email ',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'Inscrire l\'email de contact pour la clientelle',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFemailAddressControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                                .tFphoneNumberController ??=
                                                            TextEditingController(
                                                          text:
                                                              updateEstablishmentEstablishmentsRecord
                                                                  .phoneNumber,
                                                        ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Numéro de téléphone',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'Inscrire le téléphone de contact pour la clientelle',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFphoneNumberControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                                .tFURLWebSiteController ??=
                                                            TextEditingController(
                                                          text:
                                                              updateEstablishmentEstablishmentsRecord
                                                                  .webSite,
                                                        ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'URL Site Web',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'URL du site web',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFURLWebSiteControllerValidator
                                                            .asValidator(
                                                                context),
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
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Type d\'établissement',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '* 2 choix possible',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: FFAppState()
                                                                      .TypeOfEstablishment
                                                                      .map((label) =>
                                                                          ChipData(
                                                                              label))
                                                                      .toList(),
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          _model.choiceChipsValues =
                                                                              val),
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        4.0,
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        4.0,
                                                                  ),
                                                                  chipSpacing:
                                                                      20.0,
                                                                  rowSpacing:
                                                                      12.0,
                                                                  multiselect:
                                                                      true,
                                                                  initialized:
                                                                      _model.choiceChipsValues !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    updateEstablishmentEstablishmentsRecord
                                                                        .type,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                      // Error Initially selected value is not in defined options.
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
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Détails de l\'établissement',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Réservation ?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      FlutterFlowRadioButton(
                                                                        options:
                                                                            [
                                                                          'Oui',
                                                                          'Non'
                                                                        ].toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() {}),
                                                                        controller: _model
                                                                            .rBTNRservationValueController ??= FormFieldController<String>(updateEstablishmentEstablishmentsRecord
                                                                                .reservation
                                                                            ? 'Oui'
                                                                            : 'Non'),
                                                                        optionHeight:
                                                                            25.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.black,
                                                                            ),
                                                                        buttonPosition:
                                                                            RadioButtonPosition.left,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        radioButtonColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        inactiveRadioButtonColor:
                                                                            Color(0x8A000000),
                                                                        toggleable:
                                                                            false,
                                                                        horizontalAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalAlignment:
                                                                            WrapCrossAlignment.start,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Terrasse?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      FlutterFlowRadioButton(
                                                                        options:
                                                                            [
                                                                          'Oui',
                                                                          'Non'
                                                                        ].toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() {}),
                                                                        controller: _model
                                                                            .rBTNTerrasseValueController ??= FormFieldController<String>(updateEstablishmentEstablishmentsRecord
                                                                                .terrasse
                                                                            ? 'Oui'
                                                                            : 'Non'),
                                                                        optionHeight:
                                                                            25.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.black,
                                                                            ),
                                                                        buttonPosition:
                                                                            RadioButtonPosition.left,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        radioButtonColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        inactiveRadioButtonColor:
                                                                            Color(0x8A000000),
                                                                        toggleable:
                                                                            false,
                                                                        horizontalAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalAlignment:
                                                                            WrapCrossAlignment.start,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Machine à cigarette ?',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      FlutterFlowRadioButton(
                                                                        options:
                                                                            [
                                                                          'Oui',
                                                                          'Non'
                                                                        ].toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() {}),
                                                                        controller: _model
                                                                            .rBTNCigaretteMAchineValueController ??= FormFieldController<String>(updateEstablishmentEstablishmentsRecord
                                                                                .cigaretteMachine
                                                                            ? 'Oui'
                                                                            : 'Non'),
                                                                        optionHeight:
                                                                            25.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.black,
                                                                            ),
                                                                        buttonPosition:
                                                                            RadioButtonPosition.left,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        radioButtonColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        inactiveRadioButtonColor:
                                                                            Color(0x8A000000),
                                                                        toggleable:
                                                                            false,
                                                                        horizontalAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalAlignment:
                                                                            WrapCrossAlignment.start,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
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
                                                                header: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Style musicale',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '* Sélectionne 2 styles musicales maximum',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                expanded:
                                                                    Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          FlutterFlowCheckboxGroup(
                                                                        options: FFAppState()
                                                                            .MusicStyle
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.checkBoxMusicStyleValues = val),
                                                                        controller:
                                                                            _model.checkBoxMusicStyleValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          updateEstablishmentEstablishmentsRecord
                                                                              .musicStyle,
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).primaryBtnText,
                                                                        checkboxBorderColor:
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        checkboxBorderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        initialized:
                                                                            _model.checkBoxMusicStyleValues !=
                                                                                null,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
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
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
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
                                                                header: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Nourriture',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '* Sélectionne 2 styles musicales maximum',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                expanded:
                                                                    Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          FlutterFlowCheckboxGroup(
                                                                        options: FFAppState()
                                                                            .Food
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.checkBoxFoodValues = val),
                                                                        controller:
                                                                            _model.checkBoxFoodValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          updateEstablishmentEstablishmentsRecord
                                                                              .food,
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).primaryBtnText,
                                                                        checkboxBorderColor:
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        checkboxBorderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        initialized:
                                                                            _model.checkBoxFoodValues !=
                                                                                null,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                                .tFspecialityController ??=
                                                            TextEditingController(
                                                          text:
                                                              updateEstablishmentEstablishmentsRecord
                                                                  .speciality,
                                                        ),
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Spécialité',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'Inscrire ici la spécialité de l\'établissement ',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
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
                                                        validator: _model
                                                            .tFspecialityControllerValidator
                                                            .asValidator(
                                                                context),
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
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
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
                                                                header: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Divertissement / jeux',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '* Sélectionne 2 styles musicales maximum',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                expanded:
                                                                    Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          FlutterFlowCheckboxGroup(
                                                                        options: FFAppState()
                                                                            .Game
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.checkBoxGamesValues = val),
                                                                        controller:
                                                                            _model.checkBoxGamesValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          updateEstablishmentEstablishmentsRecord
                                                                              .game,
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).primaryBtnText,
                                                                        checkboxBorderColor:
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        checkboxBorderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                        initialized:
                                                                            _model.checkBoxGamesValues !=
                                                                                null,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
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
                                                              'Les horaires',
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                ScheduleRecord>>(
                                                          stream:
                                                              queryScheduleRecord(
                                                            parent:
                                                                updateEstablishmentEstablishmentsRecord
                                                                    .reference,
                                                            queryBuilder: (scheduleRecord) =>
                                                                scheduleRecord.where(
                                                                    'estblishmentRef',
                                                                    isEqualTo:
                                                                        updateEstablishmentEstablishmentsRecord
                                                                            .reference),
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
                                                            List<ScheduleRecord>
                                                                wrapScheduleRecordList =
                                                                snapshot.data!;
                                                            final wrapScheduleRecord =
                                                                wrapScheduleRecordList
                                                                        .isNotEmpty
                                                                    ? wrapScheduleRecordList
                                                                        .first
                                                                    : null;
                                                            return Wrap(
                                                              spacing: 50.0,
                                                              runSpacing: 15.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        'Lundi',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if (wrapScheduleRecord
                                                                              ?.mondayIsClose ==
                                                                          false)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.mondayOpeningController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.mondayOpening != null && wrapScheduleRecord?.mondayOpening != '' ? wrapScheduleRecord?.mondayOpening : '',
                                                                                          'Lundi ouverture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.mondayOpeningController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Lundi Ouverture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.mondayOpeningController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.mondayOpeningController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.mondayOpeningControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.mondayClosingController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.mondayClosing != null && wrapScheduleRecord?.mondayClosing != '' ? wrapScheduleRecord?.mondayClosing : '',
                                                                                          'Lundi fermeture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.mondayClosingController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Lundi Fermeture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.mondayClosingController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.mondayClosingController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.mondayClosingControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Fermé',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.mondayValue ??= valueOrDefault<bool>(
                                                                                wrapScheduleRecord?.mondayIsClose != null ? wrapScheduleRecord?.mondayIsClose : true,
                                                                                false,
                                                                              ),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.mondayValue = newValue!);
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_monday_ON_TOGGLE_ON');
                                                                                  logFirebaseEvent('monday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleMonday = false;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_monday_ON_TOGGLE_OF');
                                                                                  logFirebaseEvent('monday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleMonday = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            30.0)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        'Mardi',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if (wrapScheduleRecord
                                                                              ?.tuesdayIsClose ==
                                                                          false)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.thursdayOpeningController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.tuesdayOpening != null && wrapScheduleRecord?.tuesdayOpening != '' ? wrapScheduleRecord?.tuesdayOpening : '',
                                                                                          'Mardi ouverture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.thursdayOpeningController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Jeudi Ouverture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.thursdayOpeningController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.thursdayOpeningController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.thursdayOpeningControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.thursdayClosingController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.tuesdayClosing != null && wrapScheduleRecord?.tuesdayClosing != '' ? wrapScheduleRecord?.tuesdayClosing : '',
                                                                                          'Mardi fermeture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.thursdayClosingController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Jeudi Fermeture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.thursdayClosingController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.thursdayClosingController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.thursdayClosingControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Fermé',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.tuesdayValue ??= valueOrDefault<bool>(
                                                                                wrapScheduleRecord?.tuesdayIsClose != null ? wrapScheduleRecord?.tuesdayIsClose : true,
                                                                                false,
                                                                              ),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.tuesdayValue = newValue!);
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_tuesday_ON_TOGGLE_O');
                                                                                  logFirebaseEvent('tuesday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleTuesday = false;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_tuesday_ON_TOGGLE_O');
                                                                                  logFirebaseEvent('tuesday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleTuesday = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        'Mercredi',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if (wrapScheduleRecord
                                                                              ?.wednesdayIsClose ==
                                                                          false)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.wednesdayOpeningController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.wednesdayOpening != null && wrapScheduleRecord?.wednesdayOpening != '' ? wrapScheduleRecord?.wednesdayOpening : '',
                                                                                          'Mercredi ouverture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.wednesdayOpeningController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Mercredi Ouverture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.wednesdayOpeningController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.wednesdayOpeningController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.wednesdayOpeningControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.wednesdayClosingController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.wednesdayClosing != null && wrapScheduleRecord?.wednesdayClosing != '' ? wrapScheduleRecord?.wednesdayClosing : '',
                                                                                          'Mercredi fermeture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.wednesdayClosingController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Mercredi Fermeture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.wednesdayClosingController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.wednesdayClosingController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.wednesdayClosingControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Fermé',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.wednesdayValue ??= valueOrDefault<bool>(
                                                                                wrapScheduleRecord?.wednesdayIsClose != null ? wrapScheduleRecord?.wednesdayIsClose : true,
                                                                                false,
                                                                              ),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.wednesdayValue = newValue!);
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_wednesday_ON_TOGGLE');
                                                                                  logFirebaseEvent('wednesday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleWednesday = false;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_wednesday_ON_TOGGLE');
                                                                                  logFirebaseEvent('wednesday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleWednesday = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Jeudi',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if (wrapScheduleRecord
                                                                              ?.thursdayIsClose ==
                                                                          false)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.tuesdayOpeningController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.thursdayOpening != null && wrapScheduleRecord?.thursdayOpening != '' ? wrapScheduleRecord?.thursdayOpening : '',
                                                                                          'Jeudi ouverture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.tuesdayOpeningController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Mardi Ouverture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.tuesdayOpeningController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.tuesdayOpeningController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.tuesdayOpeningControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.tuesdayClosingController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.thursdayClosing != null && wrapScheduleRecord?.thursdayClosing != '' ? wrapScheduleRecord?.thursdayClosing : '',
                                                                                          'Jeudi fermeture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.tuesdayClosingController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Mardi Fermeture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.tuesdayClosingController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.tuesdayClosingController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.tuesdayClosingControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Fermé',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.thursdayValue ??= valueOrDefault<bool>(
                                                                                wrapScheduleRecord?.thursdayIsClose != null ? wrapScheduleRecord?.thursdayIsClose : true,
                                                                                false,
                                                                              ),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.thursdayValue = newValue!);
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_thursday_ON_TOGGLE_');
                                                                                  logFirebaseEvent('thursday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleThursday = false;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_thursday_ON_TOGGLE_');
                                                                                  logFirebaseEvent('thursday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleThursday = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        'Vendredi',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if (wrapScheduleRecord
                                                                              ?.fridayIsClose ==
                                                                          false)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.fridayOpeningController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.fridayOpening != null && wrapScheduleRecord?.fridayOpening != '' ? wrapScheduleRecord?.fridayOpening : '',
                                                                                          'Vendredi ouverture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.fridayOpeningController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Vendredi Ouverture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.fridayOpeningController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.fridayOpeningController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.fridayOpeningControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.fridayClosingController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.fridayClosing != null && wrapScheduleRecord?.fridayClosing != '' ? wrapScheduleRecord?.fridayClosing : '',
                                                                                          'Vendredi fermeture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.fridayClosingController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Vendredi Fermeture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.fridayClosingController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.fridayClosingController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.fridayClosingControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Fermé',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.fridayValue ??= valueOrDefault<bool>(
                                                                                wrapScheduleRecord?.fridayIsClose != null ? wrapScheduleRecord?.fridayIsClose : true,
                                                                                false,
                                                                              ),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.fridayValue = newValue!);
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_friday_ON_TOGGLE_ON');
                                                                                  logFirebaseEvent('friday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleFriday = false;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_friday_ON_TOGGLE_OF');
                                                                                  logFirebaseEvent('friday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleFriday = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        'Samedi',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if ((wrapScheduleRecord?.saturdayIsClose ==
                                                                              false) &&
                                                                          responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            tablet:
                                                                                false,
                                                                          ))
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.saturdayOpeningController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.saturdayOpening != null && wrapScheduleRecord?.saturdayOpening != '' ? wrapScheduleRecord?.saturdayOpening : '',
                                                                                          'Samedi ouverture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.saturdayOpeningController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Samedi Ouverture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.saturdayOpeningController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.saturdayOpeningController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.saturdayOpeningControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.saturdayClosingController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.saturdayClosing != null && wrapScheduleRecord?.saturdayClosing != '' ? wrapScheduleRecord?.saturdayClosing : '',
                                                                                          'Samedi fermeture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.saturdayClosingController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Samedi Fermeture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.saturdayClosingController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.saturdayClosingController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.saturdayClosingControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Fermé',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.saturdayValue ??= valueOrDefault<bool>(
                                                                                wrapScheduleRecord?.sundayIsClose != null ? wrapScheduleRecord?.saturdayIsClose : true,
                                                                                false,
                                                                              ),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.saturdayValue = newValue!);
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_saturday_ON_TOGGLE_');
                                                                                  logFirebaseEvent('saturday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleSaturday = false;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_saturday_ON_TOGGLE_');
                                                                                  logFirebaseEvent('saturday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleSaturday = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        'Dimanche',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if (wrapScheduleRecord
                                                                              ?.sundayIsClose ==
                                                                          false)
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.sundayOpeningController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.sundayOpening != null && wrapScheduleRecord?.sundayOpening != '' ? wrapScheduleRecord?.sundayOpening : '',
                                                                                          'Dimanche ouverture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.sundayOpeningController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Dimanche Ouverture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.sundayOpeningController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.sundayOpeningController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.sundayOpeningControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.07,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.08,
                                                                                    child: TextFormField(
                                                                                      controller: _model.sundayClosingController ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          wrapScheduleRecord?.sundayClosing != null && wrapScheduleRecord?.sundayClosing != '' ? wrapScheduleRecord?.sundayClosing : '',
                                                                                          'Dimanche fermeture',
                                                                                        ),
                                                                                      ),
                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                        '_model.sundayClosingController',
                                                                                        Duration(milliseconds: 2000),
                                                                                        () => setState(() {}),
                                                                                      ),
                                                                                      autofocus: true,
                                                                                      textInputAction: TextInputAction.done,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Dimanche Fermeture',
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                        hintText: '00:00 ',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        suffixIcon: _model.sundayClosingController!.text.isNotEmpty
                                                                                            ? InkWell(
                                                                                                onTap: () async {
                                                                                                  _model.sundayClosingController?.clear();
                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.clear,
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                              )
                                                                                            : null,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      keyboardType: TextInputType.datetime,
                                                                                      validator: _model.sundayClosingControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Fermé',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.sundayValue ??= valueOrDefault<bool>(
                                                                                wrapScheduleRecord?.sundayIsClose != null ? wrapScheduleRecord?.sundayIsClose : true,
                                                                                false,
                                                                              ),
                                                                              onChanged: (newValue) async {
                                                                                setState(() => _model.sundayValue = newValue!);
                                                                                if (newValue!) {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_sunday_ON_TOGGLE_ON');
                                                                                  logFirebaseEvent('sunday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleSunday = false;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('UPDATE_ESTABLISHMENT_sunday_ON_TOGGLE_OF');
                                                                                  logFirebaseEvent('sunday_update_app_state');
                                                                                  setState(() {
                                                                                    FFAppState().visibleStateScheduleSunday = true;
                                                                                  });
                                                                                }
                                                                              },
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 15.0))
                                                        .around(SizedBox(
                                                            height: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // still some calls for schedule I will complete next two hours
                                            StreamBuilder<List<ScheduleRecord>>(
                                              stream: queryScheduleRecord(
                                                parent:
                                                    updateEstablishmentEstablishmentsRecord
                                                        .reference,
                                                singleRecord: true,
                                              ),
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
                                                List<ScheduleRecord>
                                                    bTNValidateFromScheduleRecordList =
                                                    snapshot.data!;
                                                final bTNValidateFromScheduleRecord =
                                                    bTNValidateFromScheduleRecordList
                                                            .isNotEmpty
                                                        ? bTNValidateFromScheduleRecordList
                                                            .first
                                                        : null;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'UPDATE_ESTABLISHMENT_BTNValidateFrom_ON_');
                                                    logFirebaseEvent(
                                                        'BTNValidateFrom_backend_call');

                                                    await widget
                                                        .establishmentDetails!
                                                        .update({
                                                      ...createEstablishmentsRecordData(
                                                        name: _model.tFNameController
                                                                    .text ==
                                                                updateEstablishmentEstablishmentsRecord
                                                                    .name
                                                            ? updateEstablishmentEstablishmentsRecord
                                                                .name
                                                            : _model
                                                                .tFNameController
                                                                .text,
                                                        adresse:
                                                            createAddressStruct(
                                                          street: _model
                                                              .tFStreetController
                                                              .text,
                                                          zipCode: _model
                                                              .tFzipCodeController
                                                              .text,
                                                          city: _model
                                                              .tFcityController
                                                              .text,
                                                          state: _model
                                                              .tFstateController
                                                              .text,
                                                          country: _model
                                                              .tFcountryController
                                                              .text,
                                                          latiLong: _model
                                                              .placePickerValue
                                                              .latLng,
                                                          clearUnsetFields:
                                                              true,
                                                        ),
                                                        email: updateEstablishmentEstablishmentsRecord
                                                                    .email ==
                                                                _model
                                                                    .tFemailAddressController
                                                                    .text
                                                            ? updateEstablishmentEstablishmentsRecord
                                                                .email
                                                            : _model
                                                                .tFemailAddressController
                                                                .text,
                                                        phoneNumber:
                                                            updateEstablishmentEstablishmentsRecord
                                                                        .phoneNumber ==
                                                                    _model
                                                                        .tFphoneNumberController
                                                                        .text
                                                                ? updateEstablishmentEstablishmentsRecord
                                                                    .phoneNumber
                                                                : _model
                                                                    .tFphoneNumberController
                                                                    .text,
                                                        webSite: updateEstablishmentEstablishmentsRecord
                                                                    .webSite ==
                                                                _model
                                                                    .tFURLWebSiteController
                                                                    .text
                                                            ? updateEstablishmentEstablishmentsRecord
                                                                .webSite
                                                            : _model
                                                                .tFURLWebSiteController
                                                                .text,
                                                        speciality: updateEstablishmentEstablishmentsRecord
                                                                    .speciality ==
                                                                _model
                                                                    .tFspecialityController
                                                                    .text
                                                            ? updateEstablishmentEstablishmentsRecord
                                                                .speciality
                                                            : _model
                                                                .tFspecialityController
                                                                .text,
                                                        terrasse: _model
                                                                .rBTNTerrasseValue ==
                                                            'Oui',
                                                        reservation: _model
                                                                .rBTNRservationValue ==
                                                            'Oui',
                                                        cigaretteMachine: _model
                                                                .rBTNCigaretteMAchineValue ==
                                                            'Oui',
                                                        description:
                                                            updateEstablishmentEstablishmentsRecord
                                                                        .description ==
                                                                    _model
                                                                        .tFDescriptionController
                                                                        .text
                                                                ? updateEstablishmentEstablishmentsRecord
                                                                    .description
                                                                : _model
                                                                    .tFDescriptionController
                                                                    .text,
                                                        location: _model
                                                            .placePickerValue
                                                            .latLng,
                                                        updatedAt:
                                                            getCurrentTimestamp,
                                                        videoPath: _model
                                                            .uploadedFileUrl2,
                                                      ),
                                                      'type': _model
                                                          .choiceChipsValues,
                                                      'music_style': _model
                                                          .checkBoxMusicStyleValues,
                                                      'food': _model
                                                          .checkBoxFoodValues,
                                                      'game': _model
                                                          .checkBoxGamesValues,
                                                      'image': _model.uploadedFileUrls1
                                                                      .first !=
                                                                  null &&
                                                              _model.uploadedFileUrls1
                                                                      .first !=
                                                                  ''
                                                          ? _model
                                                              .uploadedFileUrls1
                                                          : updateEstablishmentEstablishmentsRecord
                                                              .image,
                                                    });
                                                    logFirebaseEvent(
                                                        'BTNValidateFrom_backend_call');

                                                    await bTNValidateFromScheduleRecord!
                                                        .reference
                                                        .update(
                                                            createScheduleRecordData(
                                                      mondayIsClose: _model
                                                                  .mondayValue !=
                                                              null
                                                          ? _model.mondayValue
                                                          : bTNValidateFromScheduleRecord
                                                              ?.mondayIsClose,
                                                      tuesdayIsClose:
                                                          bTNValidateFromScheduleRecord
                                                                      ?.tuesdayIsClose !=
                                                                  null
                                                              ? _model
                                                                  .tuesdayValue
                                                              : bTNValidateFromScheduleRecord
                                                                  ?.tuesdayIsClose,
                                                      wednesdayIsClose: _model
                                                                  .wednesdayValue !=
                                                              null
                                                          ? _model
                                                              .wednesdayValue
                                                          : bTNValidateFromScheduleRecord
                                                              ?.wednesdayIsClose,
                                                      thursdayIsClose: _model
                                                                  .thursdayValue !=
                                                              null
                                                          ? _model.thursdayValue
                                                          : bTNValidateFromScheduleRecord
                                                              ?.thursdayIsClose,
                                                      fridayIsClose: _model
                                                                  .fridayValue !=
                                                              null
                                                          ? _model.fridayValue
                                                          : bTNValidateFromScheduleRecord
                                                              ?.fridayIsClose,
                                                      saturdayIsClose: _model
                                                                  .saturdayValue !=
                                                              null
                                                          ? _model.saturdayValue
                                                          : bTNValidateFromScheduleRecord
                                                              ?.saturdayIsClose,
                                                      sundayIsClose: _model
                                                                  .sundayValue !=
                                                              null
                                                          ? _model.sundayValue
                                                          : bTNValidateFromScheduleRecord
                                                              ?.sundayIsClose,
                                                      mondayOpening: _model
                                                                      .mondayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.mondayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .mondayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.mondayOpening,
                                                      mondayClosing: _model
                                                                      .mondayClosingController
                                                                      .text !=
                                                                  null &&
                                                              _model.mondayClosingController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .mondayClosingController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.mondayClosing,
                                                      tuesdayOpening: _model
                                                                      .tuesdayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.tuesdayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .tuesdayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.tuesdayOpening,
                                                      tuesdayClosing: _model
                                                                      .tuesdayClosingController
                                                                      .text !=
                                                                  null &&
                                                              _model.tuesdayClosingController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .tuesdayClosingController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.tuesdayClosing,
                                                      wednesdayOpening: _model
                                                                      .wednesdayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.wednesdayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .wednesdayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.wednesdayOpening,
                                                      wednesdayClosing: _model
                                                                      .wednesdayClosingController
                                                                      .text !=
                                                                  null &&
                                                              _model.wednesdayClosingController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .wednesdayClosingController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.wednesdayClosing,
                                                      thursdayOpening: _model
                                                                      .thursdayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.thursdayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .thursdayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.thursdayOpening,
                                                      thursdayClosing: _model
                                                                      .tuesdayClosingController
                                                                      .text !=
                                                                  null &&
                                                              _model.tuesdayClosingController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .tuesdayClosingController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.thursdayClosing,
                                                      fridayOpening: _model
                                                                      .fridayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.fridayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .fridayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.fridayOpening,
                                                      fridayClosing: _model
                                                                      .fridayClosingController
                                                                      .text !=
                                                                  null &&
                                                              _model.fridayClosingController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .fridayClosingController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.fridayClosing,
                                                      saturdayOpening: _model
                                                                      .saturdayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.saturdayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .saturdayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.saturdayOpening,
                                                      saturdayClosing: _model
                                                                      .saturdayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.saturdayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .saturdayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.saturdayClosing,
                                                      sundayOpening: _model
                                                                      .sundayOpeningController
                                                                      .text !=
                                                                  null &&
                                                              _model.sundayOpeningController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .sundayOpeningController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.sundayOpening,
                                                      sundayClosing: _model
                                                                      .sundayClosingController
                                                                      .text !=
                                                                  null &&
                                                              _model.sundayClosingController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .sundayClosingController
                                                              .text
                                                          : bTNValidateFromScheduleRecord
                                                              ?.sundayClosing,
                                                      estblishmentRef:
                                                          updateEstablishmentEstablishmentsRecord
                                                              .reference,
                                                      updatedAt:
                                                          getCurrentTimestamp,
                                                    ));
                                                    logFirebaseEvent(
                                                        'BTNValidateFrom_navigate_to');

                                                    context
                                                        .pushNamed('Dashboard');
                                                  },
                                                  text:
                                                      'Enregistrer les modifications',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
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
                                                          color: Colors.white,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                );
                                              },
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
      },
    );
  }
}
