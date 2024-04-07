import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

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

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn
            ? entryPage ?? const NavBarPage()
            : const UserLoginWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? const NavBarPage()
              : const UserLoginWidget(),
          routes: [
            FFRoute(
              name: 'Maps',
              path: 'maps',
              builder: (context, params) => const MapsWidget(),
            ),
            FFRoute(
              name: 'UserLogin',
              path: 'userLogin',
              builder: (context, params) => const UserLoginWidget(),
            ),
            FFRoute(
              name: 'WebViewEvent',
              path: 'webViewEvent',
              builder: (context, params) => WebViewEventWidget(
                itemUrl: params.getParam(
                  'itemUrl',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'UserForgotPassword',
              path: 'userForgotPassword',
              builder: (context, params) => const UserForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'ListOfEstablishments',
              path: 'listOfEstablishments',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'ListOfEstablishments')
                  : const NavBarPage(
                      initialPage: 'ListOfEstablishments',
                      page: ListOfEstablishmentsWidget(),
                    ),
            ),
            FFRoute(
              name: 'UserSignUp',
              path: 'userSignUp',
              builder: (context, params) => const UserSignUpWidget(),
            ),
            FFRoute(
              name: 'Dashboard',
              path: 'dashboard',
              builder: (context, params) => const DashboardWidget(),
            ),
            FFRoute(
              name: 'UpdateEstStep1',
              path: 'updateEstStep1',
              builder: (context, params) => UpdateEstStep1Widget(
                establishmentDetails: params.getParam(
                  'establishmentDetails',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
              ),
            ),
            FFRoute(
              name: 'CreateEstStep1',
              path: 'step1Info',
              builder: (context, params) => const CreateEstStep1Widget(),
            ),
            FFRoute(
              name: 'WebViewEstablishment',
              path: 'webViewEstablishment',
              builder: (context, params) => WebViewEstablishmentWidget(
                itemUrlEstablishment: params.getParam(
                  'itemUrlEstablishment',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
              ),
            ),
            FFRoute(
              name: 'CreateEventsStep1',
              path: 'createEventsStep1',
              builder: (context, params) => CreateEventsStep1Widget(
                establishmentRef: params.getParam(
                  'establishmentRef',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
              ),
            ),
            FFRoute(
              name: 'UpdateEventStep1',
              path: 'updateEventStep1',
              builder: (context, params) => UpdateEventStep1Widget(
                eventstDetails: params.getParam(
                  'eventstDetails',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'UserPhone',
              path: 'userPhone',
              builder: (context, params) => const UserPhoneWidget(),
            ),
            FFRoute(
              name: 'UserPhoneConfirmationNew',
              path: 'userPhoneConfirmationNew',
              builder: (context, params) => const UserPhoneConfirmationNewWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'Profile')
                  : const NavBarPage(
                      initialPage: 'Profile',
                      page: ProfileWidget(),
                    ),
            ),
            FFRoute(
              name: 'Account',
              path: 'account',
              requireAuth: true,
              builder: (context, params) => const AccountWidget(),
            ),
            FFRoute(
              name: 'Settings',
              path: 'settings',
              requireAuth: true,
              builder: (context, params) => const SettingsWidget(),
            ),
            FFRoute(
              name: 'Security',
              path: 'security',
              requireAuth: true,
              builder: (context, params) => const SecurityWidget(),
            ),
            FFRoute(
              name: 'Preferences',
              path: 'preferences',
              requireAuth: true,
              builder: (context, params) => const PreferencesWidget(),
            ),
            FFRoute(
              name: 'accountDeletion',
              path: 'accountDeletion',
              requireAuth: true,
              builder: (context, params) => const AccountDeletionWidget(),
            ),
            FFRoute(
              name: 'UserPhoneConfirmationExist',
              path: 'userPhoneConfirmationExist',
              builder: (context, params) => const UserPhoneConfirmationExistWidget(),
            ),
            FFRoute(
              name: 'Feedback',
              path: 'feedback',
              builder: (context, params) => const FeedbackWidget(),
            ),
            FFRoute(
              name: 'CreateEstStep2',
              path: 'createEstStep2',
              builder: (context, params) => CreateEstStep2Widget(
                estRef: params.getParam(
                  'estRef',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
              ),
            ),
            FFRoute(
              name: 'CreateEstStep3',
              path: 'createEstStep3',
              builder: (context, params) => CreateEstStep3Widget(
                estRef: params.getParam(
                  'estRef',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
              ),
            ),
            FFRoute(
              name: 'UpdateEstStep2',
              path: 'updateEstStep2',
              builder: (context, params) => UpdateEstStep2Widget(
                establishmentDetails: params.getParam(
                  'establishmentDetails',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
              ),
            ),
            FFRoute(
              name: 'UpdateEstStep3',
              path: 'updateEstStep3',
              builder: (context, params) => UpdateEstStep3Widget(
                establishmentDetails: params.getParam(
                  'establishmentDetails',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
              ),
            ),
            FFRoute(
              name: 'CreateEventStep4',
              path: 'createEventStep4',
              builder: (context, params) => CreateEventStep4Widget(
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'CreateEventStep2',
              path: 'createEventStep2',
              builder: (context, params) => CreateEventStep2Widget(
                establishmentRef: params.getParam(
                  'establishmentRef',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'UpdateEventStep4',
              path: 'updateEventStep4',
              builder: (context, params) => UpdateEventStep4Widget(
                eventstDetails: params.getParam(
                  'eventstDetails',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'UpdateEventStep2',
              path: 'updateEventStep2',
              builder: (context, params) => UpdateEventStep2Widget(
                eventstDetails: params.getParam(
                  'eventstDetails',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'ShowOfEvents',
              path: 'showOfEvents',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ShowOfEventsWidget(
                  showOfEvents: params.getParam(
                    'showOfEvents',
                    ParamType.DocumentReference,
                    false,
                    ['events'],
                  ),
                ),
              ),
            ),
            FFRoute(
              name: 'CreateEventStep3',
              path: 'createEventStep3',
              builder: (context, params) => CreateEventStep3Widget(
                establishmentRef: params.getParam(
                  'establishmentRef',
                  ParamType.DocumentReference,
                  false,
                  ['establishments'],
                ),
                eventRef: params.getParam(
                  'eventRef',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'UpdateEventStep3',
              path: 'updateEventStep3',
              builder: (context, params) => UpdateEventStep3Widget(
                eventstDetails: params.getParam(
                  'eventstDetails',
                  ParamType.DocumentReference,
                  false,
                  ['events'],
                ),
              ),
            ),
            FFRoute(
              name: 'ManagerDashboard',
              path: 'managerDashboard',
              requireAuth: true,
              builder: (context, params) => const ManagerDashboardWidget(),
            ),
            FFRoute(
              name: 'managerSignUp',
              path: 'managerSignUp',
              builder: (context, params) => const ManagerSignUpWidget(),
            ),
            FFRoute(
              name: 'managerWaitList',
              path: 'managerWaitList',
              builder: (context, params) => const ManagerWaitListWidget(),
            ),
            FFRoute(
              name: 'MapsEstDetails',
              path: 'mapsEstDetails',
              asyncParams: {
                'estRef': getDoc(
                    ['establishments'], EstablishmentsRecord.fromSnapshot),
              },
              builder: (context, params) => MapsEstDetailsWidget(
                estRef: params.getParam(
                  'estRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'ListOfEvents',
              path: 'listOfEvents',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'ListOfEvents')
                  : const NavBarPage(
                      initialPage: 'ListOfEvents',
                      page: ListOfEventsWidget(),
                    ),
            ),
            FFRoute(
              name: 'ShowOfEstablishment',
              path: 'showOfEstablishment',
              asyncParams: {
                'estRef': getDoc(
                    ['establishments'], EstablishmentsRecord.fromSnapshot),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ShowOfEstablishmentWidget(
                  estRef: params.getParam(
                    'estRef',
                    ParamType.Document,
                  ),
                ),
              ),
            ),
            FFRoute(
              name: 'createPromotion',
              path: 'createPromotion',
              builder: (context, params) => const CreatePromotionWidget(),
            ),
            FFRoute(
              name: 'updatePromotion',
              path: 'updatePromotion',
              builder: (context, params) => const UpdatePromotionWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
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
    StructBuilder<T>? structBuilder,
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
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
            return '/userLogin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
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
                      'assets/images/Typo_-_bleu_clair.png',
                      width: MediaQuery.sizeOf(context).width * 0.6,
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
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

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
    if (widget.state.location.startsWith('/link') &&
        widget.state.location.contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
