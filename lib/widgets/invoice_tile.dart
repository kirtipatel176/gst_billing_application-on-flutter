import 'package:flutter/material.dart';
import '../models/product.dart';

class InvoiceTile extends StatelessWidget {
  final Product product;
  final int quantity;

  const InvoiceTile({Key? key, required this.product, required this.quantity})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculating CGST, SGST, and total price for the invoice item
    double cgst = (product.price * product.gstPercentage) / 200;
    double sgst = cgst;
    double itemTotal = product.price + cgst + sgst;
    double totalPrice = itemTotal * quantity;

    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Unit Price: ₹${product.price}'),
            Text('GST: ${product.gstPercentage}%'),
            Text('CGST: ₹${cgst.toStringAsFixed(2)}'),
            Text('SGST: ₹${sgst.toStringAsFixed(2)}'),
            Text('Item Total: ₹${itemTotal.toStringAsFixed(2)}'),
            Text(
              'Total for ${quantity} item(s): ₹${totalPrice.toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }
}
