import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_empty_list_model.dart';
export 'event_empty_list_model.dart';

class EventEmptyListWidget extends StatefulWidget {
  const EventEmptyListWidget({Key? key}) : super(key: key);

  @override
  _EventEmptyListWidgetState createState() => _EventEmptyListWidgetState();
}

class _EventEmptyListWidgetState extends State<EventEmptyListWidget> {
  late EventEmptyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventEmptyListModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        alignment: AlignmentDirectional(0.0, -0.5),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Aucun  événement planifié',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).accent2,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
      ),
    );
  }
}
