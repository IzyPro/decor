import 'package:carousel_slider/carousel_slider.dart';
import 'package:decor_app/views/widgets/product_frame.dart';
import 'package:decor_app/utils/exports.dart';

class Home extends ConsumerWidget {
  Home({Key? key}) : super(key: key);
  final _labels = ["Trending", "Decor", "Chairs"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: generalHorizontalPadding, vertical: topSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover\nNew tems',
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
                    hint: 'Search Products',
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
              Container(
                alignment: Alignment.center,
                child: TabBar(
                  tabs: _labels
                      .map((l) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 3,
                            ),
                            child: Text(
                              l,
                            ),
                          ))
                      .toList(),
                  isScrollable: true,
                  indicatorColor: Theme.of(context).textTheme.headline4?.color,
                  labelColor: Theme.of(context).tabBarTheme.labelColor,
                  unselectedLabelColor:
                      Theme.of(context).tabBarTheme.unselectedLabelColor,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w400),
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(
                          color: Theme.of(context)
                              .tabBarTheme
                              .unselectedLabelColor),
                  labelPadding:
                      const EdgeInsets.only(left: 0, right: ySpace3 + ySpace1),
                  indicatorPadding: const EdgeInsets.only(right: ySpace1),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 400.0,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                          ),
                          items: _viewModel.getTrending().map((i) {
                            return ProductFrame(product: i);
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 400.0,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                          ),
                          items: _viewModel.getDecor().map((i) {
                            return ProductFrame(product: i);
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 400.0,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                          ),
                          items: _viewModel.getChairs().map((i) {
                            return ProductFrame(product: i);
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            ],
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
      ),
    );
  }
}
