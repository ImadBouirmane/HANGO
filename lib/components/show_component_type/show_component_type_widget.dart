import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'show_component_type_model.dart';
export 'show_component_type_model.dart';

class ShowComponentTypeWidget extends StatefulWidget {
  const ShowComponentTypeWidget({super.key});

  @override
  State<ShowComponentTypeWidget> createState() =>
      _ShowComponentTypeWidgetState();
}

class _ShowComponentTypeWidgetState extends State<ShowComponentTypeWidget> {
  late ShowComponentTypeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowComponentTypeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EstablishmentsRecord>>(
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
        List<EstablishmentsRecord> typesContainerEstablishmentsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final typesContainerEstablishmentsRecord =
            typesContainerEstablishmentsRecordList.isNotEmpty
                ? typesContainerEstablishmentsRecordList.first
                : null;
        return Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: const Color(0x5D39D2C0),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: const Color(0xFF57CFAD),
              width: 3.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                valueOrDefault<String>(
                  typesContainerEstablishmentsRecord?.type.first,
                  '*',
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  typesContainerEstablishmentsRecord?.type.last,
                  '*',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
