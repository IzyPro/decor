import 'package:decor_app/utils/exports.dart';

class FavouriteProducts extends ConsumerWidget {
  const FavouriteProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: generalHorizontalPadding, vertical: topSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Favourite\nitems',
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
                hint: 'Search favourites',
              ),
              const SizedBox(
                width: ySpaceMid,
              ),
              Container(
                padding: const EdgeInsets.all(ySpaceMid),
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(containerRadius)),
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
        ]),
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
