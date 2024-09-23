import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loondry/categories/models/categories_model.dart';
import 'package:loondry/categories/view_models/categories_viewmodel.dart';
import 'package:loondry/categories/views/widgets/show_categories_form.dart';
import 'package:provider/provider.dart';

class CategoriesListView extends StatelessWidget {
  final CategoriesViewmodel viewmodel;
  const CategoriesListView({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewmodel.categories.length,
      itemBuilder: (context, index) {
        final category = viewmodel.categories[index];
        return Slidable(
          key: ValueKey(category.id),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  final CategoriesModel? categoriesModel =
                      await showCategoriesForm(context, category);
                  if (categoriesModel != null) {
                    if (context.mounted) {
                      log(categoriesModel.name.toString());
                      context
                          .read<CategoriesViewmodel>()
                          .updateCategories(categoriesModel);
                    }
                  }
                },
                autoClose: false,
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (context) {
                  viewmodel.deleteCategories(category);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: ListTile(
            title: Text(category.name!),
            subtitle: Text(category.price.toString()),
          ),
        );
      },
    );
  }
}
