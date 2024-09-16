import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _productImageTEController =
      TextEditingController();
  final TextEditingController _productUnitPriceTEController =
      TextEditingController();
  final TextEditingController _productQtyTEController = TextEditingController();
  final TextEditingController _productTotalPriceTEController =
      TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _buildProductForm(),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
        key: globalKey,
        child: Column(
          children: [
            TextFormField(
              controller: _productNameTEController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Name',
                labelText: 'Product Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid product name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _productCodeTEController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Code',
                labelText: 'Product Code',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid product code';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _productImageTEController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Image',
                labelText: 'Product Image',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid product image';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _productUnitPriceTEController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Unit Price',
                labelText: 'Unit Price',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid unit price';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _productQtyTEController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Qty',
                labelText: 'Qty',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid qty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _productTotalPriceTEController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Total Price',
                labelText: 'Total Price',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid total price';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                  onPressed: _onTapAddProductButton,
                  child: const Text(
                    'Add Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            )
          ],
        ));
  }

  void _onTapAddProductButton() {}

  @override
  void dispose() {
    _productNameTEController.dispose();
    _productCodeTEController.dispose();
    _productImageTEController.dispose();
    _productUnitPriceTEController.dispose();
    _productQtyTEController.dispose();
    _productTotalPriceTEController.dispose();
    super.dispose();
  }
}
