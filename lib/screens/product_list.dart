import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_crud_app_with_api_m14/moduls/product.dart';
import 'package:todo_crud_app_with_api_m14/screens/add_product.dart';
import 'package:todo_crud_app_with_api_m14/widgets/products_list_tile.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    getProductList();
  }

  final List<Product> productList = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Product List'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  getProductList();
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              )
            : productList.isEmpty
                ? const Center(
                    child: Text(
                    'No Product Found\nPlease Add Some Product to Show',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return ProductsListTile(
                        product: productList[index],
                        onTapDeleteButton: onTapDeleteProduct,
                        getProductList: getProductList,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: productList.length),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProduct(),
              )).then((_) {
            getProductList();
          });
        },
        label: const Text('Add Product'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    setState(() {
      isLoading = true;
    });
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
          id: item['_id'] ?? '',
          productName: item['ProductName'] ?? '',
          productCode: item['ProductCode'] ?? '',
          productImage: item['Img'] ?? '',
          unitPrice: item['UnitPrice'] ?? '',
          qty: item['Qty'] ?? '',
          totalPrice: item['TotalPrice'] ?? '',
        );
        productList.add(product);
        setState(() {
          isLoading = false;
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> onTapDeleteProduct(String getId) async {
    Uri uri =
        Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$getId');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Product Deleted')));
        getProductList();
      });
    }
  }
}
