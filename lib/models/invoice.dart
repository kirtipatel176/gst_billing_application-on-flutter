import './product.dart';

class Invoice {
  final List<Product> products;
  final double totalAmount;
  final double cgst;
  final double sgst;

  Invoice({
    required this.products,
    required this.totalAmount,
    required this.cgst,
    required this.sgst,
  });
}
