import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'search_events_model.dart';
export 'search_events_model.dart';

class SearchEventsWidget extends StatefulWidget {
  const SearchEventsWidget({
    super.key,
    bool? parameter1,
  }) : parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<SearchEventsWidget> createState() => _SearchEventsWidgetState();
}

class _SearchEventsWidgetState extends State<SearchEventsWidget> {
  late SearchEventsModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchEventsModel());

    _model.eventsSearchMobileController ??= TextEditingController();
    _model.eventsSearchMobileFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(),
            child: TextFormField(
              controller: _model.eventsSearchMobileController,
              focusNode: _model.eventsSearchMobileFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.eventsSearchMobileController',
                const Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              onFieldSubmitted: (_) async {
                logFirebaseEvent('SEARCH_EVENTS_eventsSearchMobile_ON_TEXT');
                currentUserLocationValue = await getCurrentUserLocation(
                    defaultLocation: const LatLng(0.0, 0.0));
                logFirebaseEvent('eventsSearchMobile_algolia_search');
                safeSetState(() => _model.algoliaSearchResults = null);
                await EventsRecord.search(
                  term: _model.eventsSearchMobileController.text,
                  location: getCurrentUserLocation(
                      defaultLocation: const LatLng(37.4298229, -122.1735655)),
                )
                    .then((r) => _model.algoliaSearchResults = r)
                    .onError((_, __) => _model.algoliaSearchResults = [])
                    .whenComplete(() => setState(() {}));
              },
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintText: 'Trouver une événement',
                hintStyle: FlutterFlowTheme.of(context).labelLarge,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                suffixIcon: _model.eventsSearchMobileController!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.eventsSearchMobileController?.clear();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: FlutterFlowTheme.of(context).grayIcon,
                          size: 25.0,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.eventsSearchMobileControllerValidator
                  .asValidator(context),
            ),
          ),
        ),
        Builder(
          builder: (context) {
            if (valueOrDefault<bool>(
              widget.parameter1 == false,
              true,
            )) {
              return FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.filter_list_sharp,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SEARCH_EVENTS_filter_list_sharp_ICN_ON_T');
                },
              );
            } else {
              return FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.clear,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SEARCH_EVENTS_COMP_clear_ICN_ON_TAP');
                },
              );
            }
          },
        ),
      ].divide(const SizedBox(width: 5.0)),
    );
  }
}
