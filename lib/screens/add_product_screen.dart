import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _price = 0;
  double _gst = 0.05;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _price = double.parse(value!),
              ),
              DropdownButtonFormField<double>(
                value: _gst,
                items:
                    [0.05, 0.12, 0.18, 0.28]
                        .map(
                          (rate) => DropdownMenuItem(
                            value: rate,
                            child: Text('${(rate * 100).toInt()}% GST'),
                          ),
                        )
                        .toList(),
                onChanged: (val) => setState(() => _gst = val!),
                decoration: const InputDecoration(labelText: 'GST Rate'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newProduct = Product(
                      name: _name,
                      price: _price,
                      gst: _gst,
                    );
                    Provider.of<ProductProvider>(
                      context,
                      listen: false,
                    ).addProduct(newProduct);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
