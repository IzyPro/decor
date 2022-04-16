class ServiceProducts {
  ServiceProducts({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.longDescription,
    required this.productImage,
    required this.productPrice,
  });
  late final int id;
  late final String productName;
  late final String productDescription;
  late final String longDescription;
  late final String productImage;
  late final double productPrice;
}
