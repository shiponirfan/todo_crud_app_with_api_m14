import 'package:flutter/material.dart';
import 'package:todo_crud_app_with_api_m14/screens/product_list.dart';

class TodoCrudApp extends StatelessWidget {
  const TodoCrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}
