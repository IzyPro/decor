import 'product_model.dart';

class CartItem {
  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });
  late final int id;
  late final ServiceProducts product;
  late final int quantity;
}
