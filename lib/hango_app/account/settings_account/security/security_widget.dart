import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'security_model.dart';
export 'security_model.dart';

class SecurityWidget extends StatefulWidget {
  const SecurityWidget({super.key});

  @override
  State<SecurityWidget> createState() => _SecurityWidgetState();
}

class _SecurityWidgetState extends State<SecurityWidget> {
  late SecurityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecurityModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Security'});
    _model.emailOnMobileController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailOnMobileFocusNode ??= FocusNode();

    _model.phoneOnMobileController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.phoneOnMobileFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: currentUserEmail);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: currentPhoneNumber);
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
    return Title(
        title: 'Security',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: const Icon(
                  Icons.keyboard_return_rounded,
                  color: Color(0xFF57CFAD),
                  size: 20.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SECURITY_keyboard_return_rounded_ICN_ON_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Page Title',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primary,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      desktop: false,
                    ))
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Authentication',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: TextFormField(
                                        controller:
                                            _model.emailOnMobileController,
                                        focusNode:
                                            _model.emailOnMobileFocusNode,
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'SECURITY_emailOnMobile_ON_TEXTFIELD_SUBM');
                                          logFirebaseEvent(
                                              'emailOnMobile_backend_call');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            email: _model
                                                .emailOnMobileController.text,
                                          ));
                                          logFirebaseEvent(
                                              'emailOnMobile_auth');
                                          if (_model.emailOnMobileController
                                              .text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Email required!',
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          await authManager.updateEmail(
                                            email: _model
                                                .emailOnMobileController.text,
                                            context: context,
                                          );
                                          setState(() {});
                                        },
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Addresse Email',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          hintText:
                                              'Entrer votre nouvelle addresse email ici...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .emailOnMobileControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => TextFormField(
                                          controller:
                                              _model.phoneOnMobileController,
                                          focusNode:
                                              _model.phoneOnMobileFocusNode,
                                          onFieldSubmitted: (_) async {
                                            logFirebaseEvent(
                                                'SECURITY_phoneOnMobile_ON_TEXTFIELD_SUBM');
                                            logFirebaseEvent(
                                                'phoneOnMobile_backend_call');

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              phoneNumber: _model
                                                  .phoneOnMobileController.text,
                                            ));
                                          },
                                          autofocus: true,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Numéro de téléphone',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            hintText:
                                                'Entrer votre nouvelle Numéro de téléphone ici...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 24.0, 0.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          maxLines: null,
                                          keyboardType: TextInputType.phone,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .phoneOnMobileControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            _model.phoneOnMobileMask
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 15.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 30.0)),
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
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Authentication',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model.textController2,
                                          focusNode: _model.textFieldFocusNode1,
                                          onFieldSubmitted: (_) async {
                                            logFirebaseEvent(
                                                'SECURITY_TextField_1bhbi5a5_ON_TEXTFIELD');
                                            logFirebaseEvent(
                                                'TextField_backend_call');

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              email:
                                                  _model.textController2.text,
                                            ));
                                          },
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Addresse Email',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            hintText:
                                                'Entrer votre nouvelle addresse email ici...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 24.0, 0.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          maxLines: null,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => TextFormField(
                                            controller: _model.textController3,
                                            focusNode:
                                                _model.textFieldFocusNode2,
                                            onFieldSubmitted: (_) async {
                                              logFirebaseEvent(
                                                  'SECURITY_TextField_70gyhnph_ON_TEXTFIELD');
                                              logFirebaseEvent(
                                                  'TextField_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                phoneNumber:
                                                    _model.textController3.text,
                                              ));
                                            },
                                            autofocus: true,
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Numéro de téléphone',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintText:
                                                  'Entrer votre nouvelle Numéro de téléphone ici...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0, 0.0,
                                                          24.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            maxLines: null,
                                            keyboardType: TextInputType.phone,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .textController3Validator
                                                .asValidator(context),
                                            inputFormatters: [
                                              _model.textFieldMask2
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 15.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 30.0)),
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
  }
}
