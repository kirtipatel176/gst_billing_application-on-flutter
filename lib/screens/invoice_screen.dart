import 'package:flutter/material.dart';
import '../models/product.dart';

class InvoiceScreen extends StatelessWidget {
  final Product product;

  const InvoiceScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cgst = (product.price * product.gst) / 2;
    final sgst = (product.price * product.gst) / 2;
    final total = product.price + cgst + sgst;

    return Scaffold(
      appBar: AppBar(title: const Text('Invoice Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'INVOICE',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _invoiceRow('Product Name', product.name),
                  _invoiceRow(
                    'Base Price',
                    '₹${product.price.toStringAsFixed(2)}',
                  ),
                  _invoiceRow('GST Rate', '${(product.gst * 100).toInt()}%'),
                  const Divider(height: 30),
                  _invoiceRow('CGST (50%)', '₹${cgst.toStringAsFixed(2)}'),
                  _invoiceRow('SGST (50%)', '₹${sgst.toStringAsFixed(2)}'),
                  const Divider(height: 30, thickness: 1.2),
                  _invoiceRow(
                    'Total Amount',
                    '₹${total.toStringAsFixed(2)}',
                    isBold: true,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check_circle),
                      label: const Text("Done"),
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _invoiceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
