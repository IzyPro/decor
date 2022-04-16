import 'dart:async';

import 'package:decor_app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSuccessfulBottomSheet extends ConsumerWidget {
  const CustomSuccessfulBottomSheet(
      {Key? key,
      this.message = '',
      this.willRedirect = false,
      this.route,
      this.wMessage,
      this.redirectMessage,
      this.isRouteReplacement = false,
      this.seconds,
      this.showRedirectMessage = false,
      this.routeArgs})
      : super(key: key);
  final String message;
  final bool willRedirect;
  final bool isRouteReplacement;
  final String? redirectMessage;
  final bool showRedirectMessage;
  final String? route;
  final Widget? wMessage;
  final int? seconds;
  final dynamic routeArgs;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer(
        Duration(seconds: seconds ?? 3),
        () => !willRedirect
            ? Navigator.pop(context)
            : isRouteReplacement && route != null
                ? {
                    Navigator.pop(context),
                    Navigator.of(context).pushReplacementNamed(route as String,
                        arguments: routeArgs)
                  }
                : Navigator.of(context).pushNamed(route as String));
    return SingleChildScrollView(
      child: Column(
        children: [
          wMessage ??
              Text(message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline4),
          const SizedBox(height: ySpace3),
          if (willRedirect || showRedirectMessage)
            Text(redirectMessage ?? 'Redirecting...',
                style: Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}
