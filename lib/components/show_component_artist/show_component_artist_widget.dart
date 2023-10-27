import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_component_artist_model.dart';
export 'show_component_artist_model.dart';

class ShowComponentArtistWidget extends StatefulWidget {
  const ShowComponentArtistWidget({Key? key}) : super(key: key);

  @override
  _ShowComponentArtistWidgetState createState() =>
      _ShowComponentArtistWidgetState();
}

class _ShowComponentArtistWidgetState extends State<ShowComponentArtistWidget> {
  late ShowComponentArtistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowComponentArtistModel());

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

    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(
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
        List<EventsRecord> typesContainerEventsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final typesContainerEventsRecord =
            typesContainerEventsRecordList.isNotEmpty
                ? typesContainerEventsRecordList.first
                : null;
        return Container(
          width: double.infinity,
          height: 120.0,
          decoration: BoxDecoration(
            color: Color(0x5D39D2C0),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF57CFAD),
              width: 3.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
