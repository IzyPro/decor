import 'package:decor_app/models/product_model.dart';
import 'package:decor_app/providers/providers.dart';
import 'package:decor_app/utils/const_values.dart';
import 'package:decor_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductFrame extends ConsumerWidget {
  const ProductFrame({Key? key, required this.product}) : super(key: key);
  final ServiceProducts product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);

    void handleClick() {
      final isObs = ref.watch(favouriteProvider.state);
      isObs.state = !isObs.state;
      if (isObs.state) {
        _viewModel.favourites.add(product);
      } else {
        if (_viewModel.favourites.any((e) => e.id == product.id)) {
          _viewModel.favourites
              .removeWhere((element) => element.id == product.id);
        }
      }
    }

    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(Routes.product, arguments: product),
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: generalHorizontalPadding, horizontal: ySpaceMid),
        padding: const EdgeInsets.all(generalHorizontalPadding),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).dialogBackgroundColor
                ]),
            borderRadius:
                const BorderRadius.all(Radius.circular(buttonBorderRadius))),
        child: Column(children: [
          Image.asset(product.productImage),
          const Spacer(),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    product.productDescription,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => handleClick(),
                child: ValueNotifier<bool>(_viewModel.favourites
                        .any((e) => e.id == product.id)).value
                    ? Icon(
                        Icons.favorite_outline,
                        color: Theme.of(context).canvasColor,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
