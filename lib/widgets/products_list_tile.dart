import 'package:flutter/material.dart';
import 'package:todo_crud_app_with_api_m14/moduls/product.dart';
import 'package:todo_crud_app_with_api_m14/screens/update_product.dart';

class ProductsListTile extends StatelessWidget {
  const ProductsListTile({
    super.key,
    required this.product,
    required this.onTapDeleteButton,
    required this.getProductList,
  });

  final Product product;
  final Function onTapDeleteButton;
  final Function getProductList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // Optional: For rounded corners
              child: Image.network(
                product.productImage.toString().contains('http')
                    ? product.productImage
                    : 'https://www.aaronfaber.com/wp-content/uploads/2017/03/product-placeholder-wp.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Code: ${product.productCode}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Unit Price: ${product.unitPrice}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Qty: ${product.qty}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Total Price: ${product.totalPrice}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateProduct(
                                  product: product,
                                ),
                              )).then((_) {
                            getProductList();
                          });
                        },
                        label: const Text(
                          'Edit',
                          style: TextStyle(color: Colors.orange, fontSize: 18),
                        ),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Card(
                      child: TextButton.icon(
                        onPressed: () => onTapDeleteButton(product.id),
                        label: const Text(
                          'Delete',
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 18),
                        ),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
