import 'package:flutter/material.dart';
import 'package:loondry/categories/view_models/categories_viewmodel.dart';
import 'package:loondry/core/theme/theme.dart';
import 'package:loondry/core/theme/util.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:loondry/home/view_models/home_viewmodel.dart';
import 'package:loondry/home/views/home_view.dart';
import 'package:loondry/orders/view_models/order_viewmodel.dart';
import 'package:loondry/shared/local_storage/sqlite_db.dart';
import 'package:provider/provider.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SqliteDb.loondryDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Bona Nova");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomerViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderViewmodel(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: "Loondry",
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        home: HomePage(),
      ),
    );
  }
}
