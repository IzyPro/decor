import 'package:decor_app/utils/exports.dart';
import 'package:decor_app/views/widgets/buttons.dart';
import 'package:decor_app/views/widgets/cart_frame.dart';

class Cart extends ConsumerWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
            left: generalHorizontalPadding,
            right: generalHorizontalPadding,
            top: topSpace,
            bottom: 0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Items in\nyour Cart',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline2
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomField(
                  width: MediaQuery.of(context).size.width * 0.7,
                  pIcon: const Icon(Icons.search),
                  hint: 'Search Cart',
                ),
                const SizedBox(
                  width: ySpaceMid,
                ),
                Container(
                  padding: const EdgeInsets.all(ySpaceMid),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(containerRadius)),
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: Theme.of(context).backgroundColor,
                    size: 25,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: ySpace1 + ySpaceMid,
            ),
            ValueNotifier(_viewModel.cart.isEmpty).value
                ? Center(
                    child: Text('Your Cart is Empty',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4!
                            .copyWith(fontStyle: FontStyle.italic)),
                  )
                : Column(
                    children: [
                      ..._viewModel.cart.map((e) => CartFrame(
                            cartItem: e,
                          ))
                    ],
                  ),
            if (_viewModel.cart.isNotEmpty)
              Column(
                children: [
                  const SizedBox(
                    height: topSpace,
                  ),
                  Row(
                    children: [
                      const Text('Total: '),
                      const Spacer(),
                      Text('\$${_viewModel.getTotalPrice()}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline3!
                              .copyWith(fontStyle: FontStyle.italic))
                    ],
                  ),
                  const SizedBox(
                    height: ySpace1,
                  ),
                  CustomButton(actionText: 'Checkout', onTap: () {})
                ],
              ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: generalHorizontalPadding - 5,
            horizontal: generalHorizontalPadding),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.symmetric(
              vertical: generalHorizontalPadding,
              horizontal: generalHorizontalPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius:
                const BorderRadius.all(Radius.circular(buttonBorderRadius)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.home_outlined),
              Icon(Icons.favorite_border_outlined),
              Icon(Icons.shopping_cart_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
