// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:todo_app/havetodo.dart' as _i3;
import 'package:todo_app/home.dart' as _i2;
import 'package:todo_app/login.dart' as _i1;
import 'package:todo_app/todoadd.dart' as _i5;
import 'package:todo_app/wanttodo.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    HaveToDoRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.HaveToDoPage(),
      );
    },
    WantToDoRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.WantToDoPage(),
      );
    },
    TodoAddRoute.name: (routeData) {
      final args = routeData.argsAs<TodoAddRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.TodoAddPage(
          key: args.key,
          which: args.which,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i6.RouteConfig(
          HaveToDoRoute.name,
          path: '/have-to-do-page',
        ),
        _i6.RouteConfig(
          WantToDoRoute.name,
          path: '/want-to-do-page',
        ),
        _i6.RouteConfig(
          TodoAddRoute.name,
          path: '/todo-add-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.HaveToDoPage]
class HaveToDoRoute extends _i6.PageRouteInfo<void> {
  const HaveToDoRoute()
      : super(
          HaveToDoRoute.name,
          path: '/have-to-do-page',
        );

  static const String name = 'HaveToDoRoute';
}

/// generated route for
/// [_i4.WantToDoPage]
class WantToDoRoute extends _i6.PageRouteInfo<void> {
  const WantToDoRoute()
      : super(
          WantToDoRoute.name,
          path: '/want-to-do-page',
        );

  static const String name = 'WantToDoRoute';
}

/// generated route for
/// [_i5.TodoAddPage]
class TodoAddRoute extends _i6.PageRouteInfo<TodoAddRouteArgs> {
  TodoAddRoute({
    _i7.Key? key,
    required int which,
  }) : super(
          TodoAddRoute.name,
          path: '/todo-add-page',
          args: TodoAddRouteArgs(
            key: key,
            which: which,
          ),
        );

  static const String name = 'TodoAddRoute';
}

class TodoAddRouteArgs {
  const TodoAddRouteArgs({
    this.key,
    required this.which,
  });

  final _i7.Key? key;

  final int which;

  @override
  String toString() {
    return 'TodoAddRouteArgs{key: $key, which: $which}';
  }
}
