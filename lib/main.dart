import 'package:flutter/material.dart';
import 'package:loondry/categories/view_models/categories_viewmodel.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:loondry/customers/views/list_customer_view.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp());
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
        home: ListCustomerView(),
      ),
    );
  }
}
