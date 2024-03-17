import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'update_promotion_model.dart';
export 'update_promotion_model.dart';

class UpdatePromotionWidget extends StatefulWidget {
  const UpdatePromotionWidget({super.key});

  @override
  State<UpdatePromotionWidget> createState() => _UpdatePromotionWidgetState();
}

class _UpdatePromotionWidgetState extends State<UpdatePromotionWidget> {
  late UpdatePromotionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdatePromotionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'updatePromotion'});
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
        title: 'updatePromotion',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ),
          ),
        ));
  }
}
