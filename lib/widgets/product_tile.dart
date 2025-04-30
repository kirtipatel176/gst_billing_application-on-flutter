import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../state/app_state.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculating CGST and SGST
    double cgst = (product.price * product.gstPercentage) / 200;
    double sgst = cgst;
    double totalPrice = product.price + cgst + sgst;

    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(
          'Price: ₹${product.price}\nGST: ${product.gstPercentage}%',
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('CGST: ₹${cgst.toStringAsFixed(2)}'),
            Text('SGST: ₹${sgst.toStringAsFixed(2)}'),
            Text('Total: ₹${totalPrice.toStringAsFixed(2)}'),
          ],
        ),
        onTap: () {
          // Add product to cart
          context.read<AppState>().addProductToCart(product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product.name} added to cart')),
          );
        },
      ),
    );
  }
}
