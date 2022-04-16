import 'package:decor_app/models/cart_model.dart';
import 'package:decor_app/utils/exports.dart';

class CartFrame extends ConsumerWidget {
  const CartFrame({Key? key, required this.cartItem}) : super(key: key);
  final CartItem cartItem;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: ySpaceMin),
      padding: const EdgeInsets.symmetric(
          horizontal: ySpace1, vertical: ySpace1 - 3),
      child: Row(
        children: [
          Image.asset(
            cartItem.product.productImage,
            width: 50,
          ),
          const SizedBox(
            width: ySpaceMid,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.product.productName,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(
                height: ySpaceMin,
              ),
              Text(cartItem.product.productDescription,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4
                      ?.copyWith(fontStyle: FontStyle.italic)),
              const SizedBox(
                height: ySpaceMid,
              ),
              Text('Quantity: ${cartItem.quantity}'),
            ],
          ),
          const SizedBox(
            width: ySpaceMid,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${cartItem.product.productPrice}',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: ySpaceMid,
              ),
              InkWell(
                onTap: () {
                  _viewModel.cart.removeWhere((e) => e.id == cartItem.id);
                  _viewModel.notifyListeners();
                },
                child: const Icon(Icons.delete_outline),
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(containerRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, .8), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
    );
  }
}
