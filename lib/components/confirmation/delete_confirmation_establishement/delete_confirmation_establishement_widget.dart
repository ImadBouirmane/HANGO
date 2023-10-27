import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_confirmation_establishement_model.dart';
export 'delete_confirmation_establishement_model.dart';

class DeleteConfirmationEstablishementWidget extends StatefulWidget {
  const DeleteConfirmationEstablishementWidget({
    Key? key,
    required this.establishementRef,
    required this.mediaEst,
    required this.scheduleEst,
  }) : super(key: key);

  final DocumentReference? establishementRef;
  final DocumentReference? mediaEst;
  final DocumentReference? scheduleEst;

  @override
  _DeleteConfirmationEstablishementWidgetState createState() =>
      _DeleteConfirmationEstablishementWidgetState();
}

class _DeleteConfirmationEstablishementWidgetState
    extends State<DeleteConfirmationEstablishementWidget> {
  late DeleteConfirmationEstablishementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => DeleteConfirmationEstablishementModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.35,
        height: MediaQuery.sizeOf(context).height * 0.2,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AutoSizeText(
                    'Êtes-vous sûr de vouloir supprimer l\'établissement!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'DELETE_CONFIRMATION_ESTABLISHEMENT_ANNUL');
                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: 'Annuler',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'DELETE_CONFIRMATION_ESTABLISHEMENT_SUPPR');
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      logFirebaseEvent('Button_backend_call');
                      firestoreBatch.delete(widget.establishementRef!);
                      logFirebaseEvent('Button_backend_call');
                      firestoreBatch.delete(widget.mediaEst!);
                      logFirebaseEvent('Button_backend_call');
                      firestoreBatch.delete(widget.scheduleEst!);
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    } finally {
                      await firestoreBatch.commit();
                    }
                  },
                  text: 'Supprimer',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).error,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ].divide(SizedBox(height: 15.0)).around(SizedBox(height: 15.0)),
        ),
      ),
    );
  }
}
