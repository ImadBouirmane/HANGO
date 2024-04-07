import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'show_component_music_style_model.dart';
export 'show_component_music_style_model.dart';

class ShowComponentMusicStyleWidget extends StatefulWidget {
  const ShowComponentMusicStyleWidget({super.key});

  @override
  State<ShowComponentMusicStyleWidget> createState() =>
      _ShowComponentMusicStyleWidgetState();
}

class _ShowComponentMusicStyleWidgetState
    extends State<ShowComponentMusicStyleWidget> {
  late ShowComponentMusicStyleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowComponentMusicStyleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: StreamBuilder<List<EstablishmentsRecord>>(
        stream: queryEstablishmentsRecord(
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
          List<EstablishmentsRecord>
              musicStyleContainerEstablishmentsRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final musicStyleContainerEstablishmentsRecord =
              musicStyleContainerEstablishmentsRecordList.isNotEmpty
                  ? musicStyleContainerEstablishmentsRecordList.first
                  : null;
          return Container(
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0x7610212E),
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: const Color(0xFF10212E),
                width: 3.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF57CFAD),
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF57CFAD),
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
