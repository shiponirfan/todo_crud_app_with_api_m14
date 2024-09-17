import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(child: _buildProductForm()),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
        key: _formKey,
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
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : TextButton(
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

  void _onTapAddProductButton() {
    if (_formKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTEController.text,
      "ProductCode": _productCodeTEController.text,
      "Img": _productImageTEController.text,
      "UnitPrice": _productUnitPriceTEController.text,
      "Qty": _productQtyTEController.text,
      "TotalPrice": _productTotalPriceTEController.text,
    };
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Response response = await post(uri,
        headers: {'Content-Type': 'Application/json'},
        body: jsonEncode(requestBody));
    if (response.statusCode == 200) {
      _clearTextField();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('New Product Added')));
    }
    setState(() {
      isLoading = false;
    });
  }

  void _clearTextField() {
    _productNameTEController.clear();
    _productCodeTEController.clear();
    _productImageTEController.clear();
    _productUnitPriceTEController.clear();
    _productQtyTEController.clear();
    _productTotalPriceTEController.clear();
  }

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
