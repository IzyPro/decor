import 'package:decor_app/models/cart_model.dart';
import 'package:decor_app/models/product_model.dart';
import 'package:decor_app/utils/assets.dart';
import 'package:decor_app/utils/router.dart';
import 'package:decor_app/views/widgets/dialog_widget.dart';
import 'package:decor_app/views/widgets/success_bottom_sheet.dart';
import 'package:decor_app/utils/exports.dart';

class HomeViewModel extends ChangeNotifier {
  List<ServiceProducts> favourites = <ServiceProducts>[];
  List<CartItem> cart = <CartItem>[];
  int currentColorIndex = 0;
  int currentNavBarIndex = 0;
  int quantity = 1;
  HomeViewModel(Reader read) {
    getChairs();
  }

  List<ServiceProducts> getTrending() {
    var result = <ServiceProducts>[];
    result.add(getChairs().first);
    result.add(getDecor().first);
    result.add(getDecor().last);
    return result;
  }

  List<ServiceProducts> getChairs() {
    return [
      ServiceProducts(
          id: 1,
          productName: 'Broques',
          productDescription: 'Wine Cocoon',
          longDescription:
              "Brownish wine laced cocoon with pink exterior and centered pivot stand providing 180 degress rotation.",
          productImage: masterChair,
          productPrice: 150),
      ServiceProducts(
          id: 2,
          productName: 'Snow White',
          productDescription: 'Swivel',
          longDescription:
              "Snow white cushion with golden swivel stand providing 360 degress rotation. 100% percent cotton cover material with stainless adjestible swivel.",
          productImage: swiveChair,
          productPrice: 70),
      ServiceProducts(
          id: 3,
          productName: 'Ber',
          productDescription: 'Ber Queen Cushion',
          longDescription:
              "Elevated pink cushion with golden swivel extensible stand providing the elegance and quality of a queen. Stainless golden coated circular stand",
          productImage: berChair,
          productPrice: 80)
    ];
  }

  List<ServiceProducts> getDecor() {
    return [
      ServiceProducts(
          id: 4,
          productName: 'Degrees',
          productDescription: 'Coated Shelf',
          longDescription:
              "90 degrees multi-partitioned hard wooden coated shelf with weight capacity of up to 150kg",
          productImage: bookShelf,
          productPrice: 50),
      ServiceProducts(
          id: 5,
          productName: 'Icee',
          productDescription: 'Golden Chandelier',
          longDescription:
              "Iced golden chandelier providing 360 degrees wireless remote adjustible brightness that fills the room with enough warmth",
          productImage: roundChandelier,
          productPrice: 270),
      ServiceProducts(
          id: 6,
          productName: 'Trace',
          productDescription: 'Trace Chandelier',
          longDescription:
              "Steel canopy chandelier with arms that turn to different angles and an adjustable hanging height, you can direct the light where you want it",
          productImage: traceChandelier,
          productPrice: 120)
    ];
  }

  List<Map<String, dynamic>> getColors() {
    return [
      {
        'color': const Color(0xFF499F68),
        'border': const Color.fromARGB(255, 5, 20, 10),
      },
      {
        'color': const Color(0xFFf2a39c),
        'border': const Color.fromARGB(255, 5, 20, 10),
      },
      {
        'color': const Color(0xFFfbf3c4),
        'border': const Color.fromARGB(255, 5, 20, 10),
      },
    ];
  }

  setCurrentColorIndex(int index) {
    currentColorIndex = index;
    notifyListeners();
  }

  setNavBarIndex(int index) {
    currentNavBarIndex = index;
    notifyListeners();
  }

  increaseQuantity() {
    quantity++;
    notifyListeners();
  }

  decreaseQuantity() {
    quantity = quantity == 1 ? quantity : --quantity;
    debugPrint(quantity.toString());
    notifyListeners();
  }

  addTocart(BuildContext ctx, ServiceProducts product) {
    cart.add(CartItem(id: product.id, product: product, quantity: quantity));
    DialogWidgets.modalBottomSheetMenu(
      ctx,
      CustomSuccessfulBottomSheet(
        message: '$quantity ${product.productName} added to cart',
        route: Routes.cart,
      ),
      isError: false,
    );
  }
}
