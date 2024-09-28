import 'package:flutter/material.dart';
import 'package:loondry/categories/view_models/categories_viewmodel.dart';
import 'package:loondry/categories/views/widgets/categories_list_view.dart';
import 'package:provider/provider.dart';

class ListCategoriesView extends StatefulWidget {
  const ListCategoriesView({super.key});

  @override
  State<ListCategoriesView> createState() => _ListCategoriesViewState();
}

class _ListCategoriesViewState extends State<ListCategoriesView> {
  @override
  void initState() {
    Future.microtask(
      () {
        // ignore: use_build_context_synchronously
        context.read<CategoriesViewmodel>().getCategories();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CategoriesViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (viewmodel.categories.isEmpty) {
              return const Center(
                child: Text("No Categories"),
              );
            } else {
              return CategoriesListView(viewmodel: viewmodel);
            }
          }
        },
      ),
    );
  }
}
