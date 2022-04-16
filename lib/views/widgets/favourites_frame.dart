import 'package:decor_app/models/product_model.dart';
import 'package:decor_app/utils/exports.dart';
import 'package:decor_app/utils/router.dart';

class FavouriteFrame extends ConsumerWidget {
  const FavouriteFrame({Key? key, required this.favouriteItem})
      : super(key: key);
  final ServiceProducts favouriteItem;
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(Routes.product, arguments: favouriteItem),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.symmetric(vertical: ySpaceMin),
        padding: const EdgeInsets.symmetric(
            horizontal: ySpace1, vertical: ySpace1 - 3),
        child: Row(
          children: [
            Image.asset(
              favouriteItem.productImage,
              width: MediaQuery.of(context).size.width * 0.25,
            ),
            const SizedBox(
              width: ySpaceMid,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(favouriteItem.productName,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: ySpaceMin,
                  ),
                  Text(favouriteItem.productDescription,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4
                          ?.copyWith(fontStyle: FontStyle.italic)),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('\$${favouriteItem.productPrice}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline4
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      InkWell(
                        onTap: () => _viewModel.handleFavourite(favouriteItem),
                        child: _viewModel.favourites
                                .any((e) => e.id == favouriteItem.id)
                            ? Icon(
                                Icons.favorite,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: Theme.of(context).canvasColor,
                              ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: ySpaceMid,
                  ),
                  Text(favouriteItem.longDescription,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline5
                          ?.copyWith(fontStyle: FontStyle.italic)),

                  //Text('Quantity: ${favouriteItem.quantity}'),
                ],
              ),
            ),
            const SizedBox(
              width: ySpaceMid,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(containerRadius)),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).cardColor
              ]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, .8), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
