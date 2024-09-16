import 'package:flutter/material.dart';
import 'package:todo_crud_app_with_api_m14/widgets/products_list_tile.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return const ProductsListTile();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: 10),
      ),
    );
  }
}
