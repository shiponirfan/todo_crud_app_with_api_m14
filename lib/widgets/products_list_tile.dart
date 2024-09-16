import 'package:flutter/material.dart';

class ProductsListTile extends StatelessWidget {
  const ProductsListTile({
    super.key,
  });

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
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // Optional: For rounded corners
              child: Image.network(
                'https://shop.adarbepari.com/wp-content/uploads/2024/09/bangladesh-tshirt-backside-design.jpg',
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
                const Text(
                  'Product Name',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Unit Price',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'QTY',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Total Price',
                      style: TextStyle(
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
                        onPressed: () {},
                        label: const Text(
                          'Edit',
                          style: TextStyle(
                              color: Colors.orange, fontSize: 18),
                        ),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Card(
                      child: TextButton.icon(
                        onPressed: () {},
                        label: const Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 18),
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