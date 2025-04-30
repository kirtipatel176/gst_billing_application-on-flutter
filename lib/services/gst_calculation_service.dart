class GSTCalculationService {
  static double calculateCGST(double price, int gstPercentage) {
    return (price * gstPercentage / 100) / 2;
  }

  static double calculateSGST(double price, int gstPercentage) {
    return (price * gstPercentage / 100) / 2;
  }

  static double calculateTotalPrice(double price, double cgst, double sgst) {
    return price + cgst + sgst;
  }
}
