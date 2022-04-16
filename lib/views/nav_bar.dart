import 'package:decor_app/views/cart.dart';
import 'package:decor_app/views/favourites.dart';
import 'package:decor_app/views/home.dart';
import 'package:decor_app/utils/exports.dart';

class HomeNavigation extends ConsumerWidget {
  HomeNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(homeViewModel);
    Future<bool> _onBackPressed() {
      return Future.delayed(const Duration(seconds: 2));
    }

    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: _pages.elementAt(ref.watch(homeViewModel).currentNavBarIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: generalHorizontalPadding,
                horizontal: generalHorizontalPadding + 10),
            child: BottomNavigationBar(
              elevation: 35,
              backgroundColor: Theme.of(context).canvasColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: ref.watch(homeViewModel).currentNavBarIndex,
              onTap: _viewModel.setNavBarIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: ''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<Widget> _pages = <Widget>[
    Home(),
    const FavouriteProducts(),
    const Cart()
  ];
}
