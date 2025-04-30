// utils/gst_calculator.dart
class GSTCalculator {
  static double calculateCGST(double price, double gstRate) {
    return (price * gstRate) /
        200; // GST is divided equally between CGST and SGST
  }

  static double calculateSGST(double price, double gstRate) {
    return calculateCGST(price, gstRate);
  }

  static double calculateTotal(double price, double gstRate) {
    double cgst = calculateCGST(price, gstRate);
    double sgst = calculateSGST(price, gstRate);
    return price + cgst + sgst;
  }
}
