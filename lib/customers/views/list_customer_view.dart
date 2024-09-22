import 'package:flutter/material.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:loondry/customers/views/form_customer_view.dart';
import 'package:loondry/customers/widgets/customer_list_view.dart';
import 'package:provider/provider.dart';

class ListCustomerView extends StatefulWidget {
  const ListCustomerView({super.key});

  @override
  State<ListCustomerView> createState() => _ListCustomerViewState();
}

class _ListCustomerViewState extends State<ListCustomerView> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<CustomerViewmodel>().getCustomers(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CustomerViewmodel>(
        builder: (context, value, child) {
          if (value.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (value.customers.isEmpty) {
              return const Center(
                child: Text(
                  "No Data",
                  style: TextStyle(color: Colors.black),
                ),
              );
            } else {
              return CustomerListView(viewmodel: value);
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const FormCustomerView(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
