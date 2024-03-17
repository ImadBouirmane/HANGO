import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_image_model.dart';
export 'empty_image_model.dart';

class EmptyImageWidget extends StatefulWidget {
  const EmptyImageWidget({super.key});

  @override
  State<EmptyImageWidget> createState() => _EmptyImageWidgetState();
}

class _EmptyImageWidgetState extends State<EmptyImageWidget> {
  late EmptyImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.3,
      height: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryTransparent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          'Aucune Image inséré',
          style: FlutterFlowTheme.of(context).titleMedium,
        ),
      ),
    );
  }
}
