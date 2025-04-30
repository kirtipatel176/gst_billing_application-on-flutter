import 'package:flutter_test/flutter_test.dart';
import 'package:gst_billing_app/services/gst_calculation_service.dart';

void main() {
  test('GST Calculation for product', () {
    double price = 100;
    int gstPercentage = 18;
    double cgst = GSTCalculationService.calculateCGST(price, gstPercentage);
    double sgst = GSTCalculationService.calculateSGST(price, gstPercentage);
    double total = GSTCalculationService.calculateTotalPrice(price, cgst, sgst);

    expect(cgst, 9.0);
    expect(sgst, 9.0);
    expect(total, 118.0);
  });
}
