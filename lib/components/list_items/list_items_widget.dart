import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_items_model.dart';
export 'list_items_model.dart';

class ListItemsWidget extends StatefulWidget {
  const ListItemsWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final String? parameter1;

  @override
  _ListItemsWidgetState createState() => _ListItemsWidgetState();
}

class _ListItemsWidgetState extends State<ListItemsWidget> {
  late ListItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemsModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.05,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              _model.mouseRegionHovered == true
                  ? FlutterFlowTheme.of(context).accent4
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: SelectionArea(
                      child: AutoSizeText(
                    widget.parameter1!.maybeHandleOverflow(
                      maxChars: 60,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.normal,
                        ),
                  )),
                ),
              ),
            ].addToStart(SizedBox(width: 10.0)),
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
