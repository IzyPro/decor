import 'package:decor_app/models/product_model.dart';
import 'package:decor_app/utils/exports.dart';

class Product extends ConsumerWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    final args = ModalRoute.of(context)?.settings.arguments as ServiceProducts;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: generalHorizontalPadding, vertical: ySpace3),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: ySpaceMid, bottom: ySpaceMid, left: ySpaceMid),
                      child: const Icon(Icons.arrow_back_ios),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: generalHorizontalPadding,
                        horizontal: ySpaceMid),
                    padding: const EdgeInsets.all(generalHorizontalPadding),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).dialogBackgroundColor
                            ]),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(buttonBorderRadius))),
                    child: Image.asset(args.productImage),
                  ),
                  const SizedBox(
                    height: ySpaceMin,
                  ),
                  Row(
                    children: [
                      Text(
                        args.productName,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline2
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        "\$${args.productPrice}",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline2
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: ySpaceMin,
                  ),
                  Text(
                    args.productDescription,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline2
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: ySpaceMid,
                  ),
                  Text(
                    args.longDescription,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  const SizedBox(
                    height: ySpace1,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          _viewModel.getColors().length,
                          (index) => GestureDetector(
                            onTap: () => _viewModel.setCurrentColorIndex(index),
                            child: Container(
                                margin: const EdgeInsets.only(right: ySpaceMid),
                                width: _viewModel.currentColorIndex == index
                                    ? 45
                                    : 35,
                                height: _viewModel.currentColorIndex == index
                                    ? 45
                                    : 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _viewModel.getColors()[index]
                                        ['color'],
                                    border: Border.all(
                                        color: _viewModel.currentColorIndex ==
                                                index
                                            ? Colors.black
                                            : Colors.transparent))),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => _viewModel.decreaseQuantity(),
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(
                              width: ySpaceMin,
                            ),
                            Text(
                              _viewModel.quantity.toString(),
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline3
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: ySpaceMin,
                            ),
                            InkWell(
                              onTap: () => _viewModel.increaseQuantity(),
                              child: const Icon(Icons.add_circle),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.2),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(buttonBorderRadius))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: topSpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => _viewModel.handleFavourite(args),
                        child: Container(
                          padding: const EdgeInsets.all(ySpaceMid),
                          child:
                              _viewModel.favourites.any((e) => e.id == args.id)
                                  ? Icon(
                                      Icons.favorite,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : Icon(
                                      Icons.favorite_outline,
                                      color: Theme.of(context).canvasColor,
                                    ),
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              shape: BoxShape.circle),
                        ),
                      ),
                      InkWell(
                        onTap: (() => _viewModel.addTocart(context, args)),
                        child: Container(
                          padding: const EdgeInsets.all(ySpace1),
                          child: Row(children: [
                            Text(
                              'Add to cart',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline4
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                            ),
                            const SizedBox(
                              width: ySpace1,
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: Theme.of(context).backgroundColor,
                            ),
                          ]),
                          decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(containerRadius + 10))),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ));
  }
}
