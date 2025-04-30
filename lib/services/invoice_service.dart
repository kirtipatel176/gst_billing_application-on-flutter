import 'package:flutter/material.dart';
import '../models/invoice.dart';

class InvoiceScreen extends StatelessWidget {
  final Invoice invoice;

  InvoiceScreen({required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Invoice')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...invoice.products.map((product) {
              return ListTile(
                title: Text(product.name),
                subtitle: Text('₹${product.price}'),
              );
            }).toList(),
            Divider(),
            Text('CGST: ₹${invoice.cgst}', style: TextStyle(fontSize: 18)),
            Text('SGST: ₹${invoice.sgst}', style: TextStyle(fontSize: 18)),
            Divider(),
            Text(
              'Total Amount: ₹${invoice.totalAmount}',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
