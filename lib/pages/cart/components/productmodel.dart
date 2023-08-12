class Product{
  final String? pictureUrl;
  final String? name;
  final String? color;
  final String? price;
  final int? quantity;
  

  Product({
    this.pictureUrl,
    this.name,
    this.color,
    this.price,
    this.quantity = 1,
});
}