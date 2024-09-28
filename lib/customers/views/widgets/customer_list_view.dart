import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loondry/customers/models/customer_model.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:loondry/customers/views/widgets/show_customer_form.dart';
import 'package:provider/provider.dart';

class CustomerListView extends StatelessWidget {
  final CustomerViewmodel viewmodel;
  const CustomerListView({
    required this.viewmodel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewmodel.customers.length,
      itemBuilder: (context, index) {
        final customer = viewmodel.customers[index];
        return Slidable(
          key: ValueKey(customer.id),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  final CustomerModel? customerModel =
                      await showCustomerForm(context, customer);
                  if (customerModel != null) {
                    if (context.mounted) {
                      log(customerModel.name.toString());
                      context
                          .read<CustomerViewmodel>()
                          .updateCustomer(customerModel);
                    }
                  }
                },
                autoClose: false,
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit,
              ),
              SlidableAction(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                onPressed: (context) {
                  viewmodel.deleteCustomer(customer);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
              ),
            ],
          ),
          child: Card(
            color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
            shape: RoundedRectangleBorder(),
            child: ListTile(
              title: Text(customer.name!),
            ),
          ),
        );
      },
    );
  }
}
