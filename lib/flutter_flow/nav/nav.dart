import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '../../auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn
            ? NavBarPage()
            : ListOfEstablishmentsWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NavBarPage()
              : ListOfEstablishmentsWidget(),
        ),
        FFRoute(
          name: 'ShowOfEstablishments',
          path: '/showOfEstablishments',
          builder: (context, params) => ShowOfEstablishmentsWidget(
            establishmentDetails: params.getParam('establishmentDetails',
                ParamType.DocumentReference, false, ['establishments']),
          ),
        ),
        FFRoute(
          name: 'Maps',
          path: '/maps',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Maps')
              : NavBarPage(
                  initialPage: 'Maps',
                  page: MapsWidget(),
                ),
        ),
        FFRoute(
          name: 'UserLogin',
          path: '/userLogin',
          builder: (context, params) => UserLoginWidget(),
        ),
        FFRoute(
          name: 'WebViewEvent',
          path: '/webViewEvent',
          builder: (context, params) => WebViewEventWidget(
            itemUrl: params.getParam(
                'itemUrl', ParamType.DocumentReference, false, ['events']),
          ),
        ),
        FFRoute(
          name: 'UserForgotPassword',
          path: '/userForgotPassword',
          builder: (context, params) => UserForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'ListOfEstablishments',
          path: '/listOfEstablishments',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ListOfEstablishments')
              : NavBarPage(
                  initialPage: 'ListOfEstablishments',
                  page: ListOfEstablishmentsWidget(),
                ),
        ),
        FFRoute(
          name: 'ListOfEvents',
          path: '/listOfEvents',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ListOfEvents')
              : NavBarPage(
                  initialPage: 'ListOfEvents',
                  page: ListOfEventsWidget(
                    eventDetails: params.getParam('eventDetails',
                        ParamType.DocumentReference, false, ['events']),
                  ),
                ),
        ),
        FFRoute(
          name: 'UserSignUp',
          path: '/userSignUp',
          builder: (context, params) => UserSignUpWidget(),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: 'UpdateEstablishment',
          path: '/updateEstablishment',
          builder: (context, params) => UpdateEstablishmentWidget(
            establishmentDetails: params.getParam('establishmentDetails',
                ParamType.DocumentReference, false, ['establishments']),
          ),
        ),
        FFRoute(
          name: 'CreateEstablishment',
          path: '/createEstablishment',
          builder: (context, params) => CreateEstablishmentWidget(),
        ),
        FFRoute(
          name: 'WebViewEstablishment',
          path: '/webViewEstablishment',
          builder: (context, params) => WebViewEstablishmentWidget(
            itemUrlEstablishment: params.getParam('itemUrlEstablishment',
                ParamType.DocumentReference, false, ['establishments']),
          ),
        ),
        FFRoute(
          name: 'eventFilterResult',
          path: '/eventFilterResult',
          builder: (context, params) => EventFilterResultWidget(
            themeEvent: params.getParam('themeEvent', ParamType.String),
            musicType: params.getParam('musicType', ParamType.String),
            weekend: params.getParam('weekend', ParamType.bool),
            jeudredi: params.getParam('jeudredi', ParamType.bool),
            freeEnter: params.getParam('freeEnter', ParamType.bool),
            booked: params.getParam('booked', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'CreateEvents',
          path: '/createEvents',
          builder: (context, params) => CreateEventsWidget(),
        ),
        FFRoute(
          name: 'UpdateEvents',
          path: '/updateEvents',
          builder: (context, params) => UpdateEventsWidget(
            eventstDetails: params.getParam('eventstDetails',
                ParamType.DocumentReference, false, ['events']),
          ),
        ),
        FFRoute(
          name: 'ShowOfEvents',
          path: '/EventDetails',
          builder: (context, params) => ShowOfEventsWidget(
            showOfEvents: params.getParam(
                'showOfEvents', ParamType.DocumentReference, false, ['events']),
          ),
        ),
        FFRoute(
          name: 'UserPhone',
          path: '/userPhone',
          builder: (context, params) => UserPhoneWidget(),
        ),
        FFRoute(
          name: 'UserPhoneConfirmationNew',
          path: '/userPhoneConfirmationNew',
          builder: (context, params) => UserPhoneConfirmationNewWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'Account',
          path: '/account',
          requireAuth: true,
          builder: (context, params) => AccountWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          requireAuth: true,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'Security',
          path: '/security',
          requireAuth: true,
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: 'Preferences',
          path: '/preferences',
          requireAuth: true,
          builder: (context, params) => PreferencesWidget(),
        ),
        FFRoute(
          name: 'accountDeletion',
          path: '/accountDeletion',
          requireAuth: true,
          builder: (context, params) => AccountDeletionWidget(),
        ),
        FFRoute(
          name: 'UserPhoneConfirmationExist',
          path: '/userPhoneConfirmationExist',
          builder: (context, params) => UserPhoneConfirmationExistWidget(),
        ),
        FFRoute(
          name: 'establishmentFilterResults',
          path: '/establishmentFilterResults',
          builder: (context, params) => EstablishmentFilterResultsWidget(
            type: params.getParam('type', ParamType.String),
            artist: params.getParam('artist', ParamType.String),
            weekend: params.getParam('weekend', ParamType.bool),
            jeudredi: params.getParam('jeudredi', ParamType.bool),
            freeEntrance: params.getParam('freeEntrance', ParamType.bool),
            booked: params.getParam('booked', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Feedback',
          path: '/feedback',
          builder: (context, params) => FeedbackWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/listOfEstablishments';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Typo_-_bleu_fonce.png',
                      width: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link?request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
