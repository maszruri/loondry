import 'package:flutter/material.dart';
import 'package:loondry/categories/view_models/categories_viewmodel.dart';
import 'package:loondry/categories/views/list_categories_view.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:provider/provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomerViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesViewmodel(),
        ),
      ],
      child: const MaterialApp(
        home: ListCategoriesView(),
      ),
    );
  }
}
