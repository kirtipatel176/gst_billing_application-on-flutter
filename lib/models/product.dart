class Product {
  final int? id;
  final String name;
  final double price;
  final double gst;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.gst,
  });

  // Convert Product to Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'price': price, 'gst': gst};
  }

  // Create Product from Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      gst: map['gst'],
    );
  }
}
