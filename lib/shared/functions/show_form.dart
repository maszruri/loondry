import 'package:flutter/material.dart';
import 'package:loondry/categories/models/categories_model.dart';
import 'package:loondry/categories/view_models/categories_viewmodel.dart';
import 'package:loondry/categories/views/widgets/show_categories_form.dart';
import 'package:loondry/customers/models/customer_model.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:loondry/customers/views/widgets/show_customer_form.dart';
import 'package:provider/provider.dart';

class ShowForm {
  static categories(BuildContext context) async {
    final CategoriesModel? categories = await showCategoriesForm(context, null);
    if (categories != null) {
      if (context.mounted) {
        context.read<CategoriesViewmodel>().createCategories(categories);
      }
    }
  }

  static customer(BuildContext context) async {
    final CustomerModel? customer = await showCustomerForm(context, null);
    if (customer != null) {
      if (context.mounted) {
        context.read<CustomerViewmodel>().createCustomer(customer);
      }
    }
  }
}
