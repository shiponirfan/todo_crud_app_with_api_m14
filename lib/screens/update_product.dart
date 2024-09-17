import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_crud_app_with_api_m14/moduls/product.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key, required this.product});

  final Product product;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  late TextEditingController _productNameTEController = TextEditingController();
  late TextEditingController _productCodeTEController = TextEditingController();
  late TextEditingController _productImageTEController =
      TextEditingController();
  late TextEditingController _productUnitPriceTEController =
      TextEditingController();
  late TextEditingController _productQtyTEController = TextEditingController();
  late TextEditingController _productTotalPriceTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _productNameTEController =
        TextEditingController(text: widget.product.productName);
    _productCodeTEController =
        TextEditingController(text: widget.product.productCode);
    _productImageTEController =
        TextEditingController(text: widget.product.productImage);
    _productUnitPriceTEController =
        TextEditingController(text: widget.product.unitPrice);
    _productQtyTEController = TextEditingController(text: widget.product.qty);
    _productTotalPriceTEController =
        TextEditingController(text: widget.product.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
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
                      onPressed: _onTapUpdateProductButton,
                      child: const Text(
                        'Update Product',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
            )
          ],
        ));
  }

  void _onTapUpdateProductButton() {
    if (_formKey.currentState!.validate()) {
      updateProduct();
    }
  }

  Future<void> updateProduct() async {
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
    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.product.id}');
    Response response = await post(uri,
        headers: {'Content-Type': 'Application/json'},
        body: jsonEncode(requestBody));
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Product Updated')));
    }
    setState(() {
      isLoading = false;
    });
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
