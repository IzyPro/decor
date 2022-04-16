import 'package:decor_app/styles/app_colors.dart';
import 'package:decor_app/utils/assets.dart';
import 'package:decor_app/views/home.dart';
import 'package:decor_app/views/nav_bar.dart';
import 'package:decor_app/views/product.dart';
import 'package:decor_app/views/widgets/buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'const_values.dart';

abstract class Routes {
  static const home = "/home";
  static const homeScreen = "/homeScreen";
  static const product = "/product";
  static const favourites = "/favourites";
  static const cart = "/cart";
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  var args = settings.arguments;
  switch (settings.name) {
    case Routes.homeScreen:
      return MaterialPageRoute<dynamic>(
          builder: (context) => HomeNavigation(), settings: settings);
    case Routes.home:
      return MaterialPageRoute<dynamic>(
          builder: (context) => Home(), settings: settings);
    case Routes.product:
      return MaterialPageRoute<dynamic>(
          builder: (context) => const Product(), settings: settings);

    default:
      return unknownRoutePage(settings.name!);
  }
}

PageRoute unknownRoutePage(String routeName) => MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: generalHorizontalPadding, vertical: ySpace2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(memoji),
              const SizedBox(height: ySpace2 - 4),
              Text('Oops,\n\nLooks like this page is in development',
                  textAlign: TextAlign.center,
                  style: Theme.of(ctx)
                      .primaryTextTheme
                      .headline3
                      ?.copyWith(color: AppColors.black)),
              const SizedBox(height: ySpace3 + ySpace1 - 5),
              if (kDebugMode)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text(
                    routeName == "/"
                        ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                        : 'Route name $routeName is not found!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              CustomButton(
                  actionText: 'Go back', onTap: () => Navigator.of(ctx).pop())
            ],
          ),
        ),
      ),
    );
