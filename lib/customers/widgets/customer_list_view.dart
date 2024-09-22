import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:loondry/customers/views/form_customer_view.dart';

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
                onPressed: (context) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FormCustomerView(
                        customer: customer,
                      ),
                    ),
                  );
                },
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (context) {
                  viewmodel.deleteCustomer(customer);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: ListTile(
            title: Text(customer.name!),
            subtitle: Text(customer.phone!),
          ),
        );
      },
    );
  }
}
