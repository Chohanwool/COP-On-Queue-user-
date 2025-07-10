import 'package:flutter/material.dart';

class StackObserver extends NavigatorObserver {
  final List<Route<dynamic>> _routeStack = [];

  int get stackCount => _routeStack.length;

  @override
  void didPush(Route route, Route? previousRoute) {
    _routeStack.add(route);
    debugPrint('Pushed: ${route.settings.name}, Stack size: $stackCount');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _routeStack.remove(route);
    debugPrint('Popped: ${route.settings.name}, Stack size: $stackCount');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _routeStack.remove(route);
    debugPrint('Removed: ${route.settings.name}, Stack size: $stackCount');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute != null) {
      _routeStack.remove(oldRoute);
    }
    if (newRoute != null) {
      _routeStack.add(newRoute);
    }
    debugPrint(
      'Replaced: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}, Stack size: $stackCount',
    );
  }
}
