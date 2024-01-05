import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_filter_model.dart';
export 'search_filter_model.dart';

class SearchFilterWidget extends StatefulWidget {
  const SearchFilterWidget({
    super.key,
    this.parameter1,
    bool? parameter2,
  })  : parameter2 = parameter2 ?? false;

  final List<EstablishmentsRecord>? parameter1;
  final bool parameter2;

  @override
  _SearchFilterWidgetState createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  late SearchFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchFilterModel());

    _model.estblishmentSearchMobileController ??= TextEditingController();
    _model.estblishmentSearchMobileFocusNode ??= FocusNode();

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(),
            child: TextFormField(
              controller: _model.estblishmentSearchMobileController,
              focusNode: _model.estblishmentSearchMobileFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.estblishmentSearchMobileController',
                const Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              onFieldSubmitted: (_) async {
                logFirebaseEvent('SEARCH_FILTER_estblishmentSearchMobile_O');
                logFirebaseEvent('estblishmentSearchMobile_update_componen');
                logFirebaseEvent('estblishmentSearchMobile_simple_search');
              },
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintText: 'Trouver une établissement',
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
                suffixIcon: _model
                        .estblishmentSearchMobileController!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.estblishmentSearchMobileController?.clear();
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
              validator: _model.estblishmentSearchMobileControllerValidator
                  .asValidator(context),
            ),
          ),
        ),
        Builder(
          builder: (context) {
            if (valueOrDefault<bool>(
              widget.parameter2 == false,
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
                  logFirebaseEvent('SEARCH_FILTER_filter_list_sharp_ICN_ON_T');
                  logFirebaseEvent('IconButton_update_component_state');
                  logFirebaseEvent('IconButton_bottom_sheet');
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
                  logFirebaseEvent('SEARCH_FILTER_COMP_clear_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_update_component_state');
                  logFirebaseEvent('IconButton_bottom_sheet');
                },
              );
            }
          },
        ),
      ].divide(const SizedBox(width: 5.0)),
    );
  }
}
