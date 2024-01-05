import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_images_model.dart';
export 'list_images_model.dart';

class ListImagesWidget extends StatefulWidget {
  const ListImagesWidget({
    super.key,
    required this.images,
  });

  final List<DocumentReference>? images;

  @override
  _ListImagesWidgetState createState() => _ListImagesWidgetState();
}

class _ListImagesWidgetState extends State<ListImagesWidget> {
  late ListImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListImagesModel());

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

    return SizedBox(
      width: double.infinity,
      height: 300.0,
      child: Stack(
        children: [
          PageView(
            controller: _model.pageViewController ??=
                PageController(initialPage: 0),
            onPageChanged: (_) => setState(() {}),
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('LIST_IMAGES_EstablishmentImage_ON_TAP');
                  logFirebaseEvent('EstablishmentImage_expand_image');
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: FlutterFlowExpandedImageView(
                        image: Image.network(
                          'https://picsum.photos/seed/927/600',
                          fit: BoxFit.contain,
                        ),
                        allowRotation: true,
                        tag: 'establishmentImageTag',
                        useHeroAnimation: true,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'establishmentImageTag',
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/927/600',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
              child: smooth_page_indicator.SmoothPageIndicator(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                count: 1,
                axisDirection: Axis.horizontal,
                onDotClicked: (i) async {
                  await _model.pageViewController!.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                effect: smooth_page_indicator.ExpandingDotsEffect(
                  expansionFactor: 3.0,
                  spacing: 8.0,
                  radius: 16.0,
                  dotWidth: 16.0,
                  dotHeight: 8.0,
                  dotColor: FlutterFlowTheme.of(context).primaryTransparent,
                  activeDotColor: FlutterFlowTheme.of(context).primary,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
