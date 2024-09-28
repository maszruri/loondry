import 'package:flutter/material.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:loondry/customers/views/widgets/customer_list_view.dart';
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
      // ignore: use_build_context_synchronously
      () => context.read<CustomerViewmodel>().getCustomers(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<CustomerViewmodel>(
        builder: (context, value, child) {
          if (value.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 6,
                  ),
                  const Text(
                    "Customer",
                    style: TextStyle(fontSize: 30),
                  ),
                  const Divider(),
                  Expanded(
                    child: value.customers.isEmpty
                        ? child!
                        : OverflowBox(
                            maxWidth: MediaQuery.of(context).size.width,
                            child: CustomerListView(viewmodel: value),
                          ),
                  ),
                ],
              ),
            );
          }
        },
        child: const Center(
          child: Text(
            "No Customer",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
