// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/playground_view.dart';

class Routes {
  static const String playgroundView = '/';
  static const all = <String>{
    playgroundView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.playgroundView, page: PlaygroundView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    PlaygroundView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PlaygroundView(),
        settings: data,
      );
    },
  };
}
