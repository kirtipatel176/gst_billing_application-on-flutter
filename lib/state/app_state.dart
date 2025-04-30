import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/gst_calculation_service.dart';
import '../models/invoice.dart';

class AppState extends ChangeNotifier {
  List<Product> cart = [];
  List<Invoice> invoices = [];

  void addProductToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  void generateInvoice() {
    double totalAmount = 0;
    double cgst = 0;
    double sgst = 0;

    for (var product in cart) {
      double productCGST = GSTCalculationService.calculateCGST(
        product.price,
        product.gstPercentage,
      );
      double productSGST = GSTCalculationService.calculateSGST(
        product.price,
        product.gstPercentage,
      );
      totalAmount += GSTCalculationService.calculateTotalPrice(
        product.price,
        productCGST,
        productSGST,
      );
      cgst += productCGST;
      sgst += productSGST;
    }

    Invoice invoice = Invoice(
      products: cart,
      totalAmount: totalAmount,
      cgst: cgst,
      sgst: sgst,
    );

    invoices.add(invoice);
    cart.clear(); // Clear cart after generating invoice
    notifyListeners();
  }
}
