import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'back_navigation_model.dart';
export 'back_navigation_model.dart';

class BackNavigationWidget extends StatefulWidget {
  const BackNavigationWidget({Key? key}) : super(key: key);

  @override
  _BackNavigationWidgetState createState() => _BackNavigationWidgetState();
}

class _BackNavigationWidgetState extends State<BackNavigationWidget> {
  late BackNavigationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackNavigationModel());

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
      alignment: AlignmentDirectional(-0.98, -0.90),
      child: FlutterFlowIconButton(
        borderColor: FlutterFlowTheme.of(context).primary,
        borderRadius: 20.0,
        borderWidth: 1.0,
        buttonSize: 40.0,
        fillColor: FlutterFlowTheme.of(context).primaryBackground,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: FlutterFlowTheme.of(context).tertiary400,
          size: 24.0,
        ),
        onPressed: () async {
          logFirebaseEvent('BACK_NAVIGATION_arrow_back_rounded_ICN_O');
          logFirebaseEvent('IconButton_navigate_back');
          context.safePop();
        },
      ),
    );
  }
}
