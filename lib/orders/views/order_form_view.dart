import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loondry/orders/view_models/order_viewmodel.dart';
import 'package:provider/provider.dart';

class OrderFormView extends StatefulWidget {
  const OrderFormView({super.key});

  @override
  State<OrderFormView> createState() => _OrderFormViewState();
}

class _OrderFormViewState extends State<OrderFormView> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<OrderViewmodel>().setData(),
    );
    super.initState();
  }

  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.read<OrderViewmodel>().clearData();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Form Order"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<OrderViewmodel>(
            builder: (context, viewmodel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownMenu(
                    leadingIcon: Icon(Icons.person),
                    width: double.maxFinite,
                    dropdownMenuEntries: viewmodel.customers
                        .map(
                          (e) => DropdownMenuEntry(value: e, label: e.name!),
                        )
                        .toList(),
                    label: const Text("Customer"),
                    onSelected: (value) => viewmodel.setCustomer(value!),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      DropdownMenu(
                        width: 200,
                        dropdownMenuEntries: viewmodel.categories
                            .map(
                              (e) =>
                                  DropdownMenuEntry(value: e, label: e.name!),
                            )
                            .toList(),
                        onSelected: (value) {
                          viewmodel.setCategories(value!);
                        },
                        enableFilter: false,
                        enableSearch: false,
                        label: const Text("Service"),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: weightController,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Weight",
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?\.?\d{0,2}')),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d*')),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text("Kg"),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 6,
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "Invoice",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Divider(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Customer",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                            },
                            children: [
                              TableRow(
                                children: [
                                  const Text("Name"),
                                  Text(
                                      ": ${viewmodel.selectedCustomer == null ? "..." : viewmodel.selectedCustomer!.name}"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text("Phone"),
                                  Text(
                                      ": ${viewmodel.selectedCustomer == null ? "..." : viewmodel.selectedCustomer!.phone}"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text("Address"),
                                  Text(
                                      ": ${viewmodel.selectedCustomer == null ? "..." : viewmodel.selectedCustomer!.address}"),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Service",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                            },
                            children: [
                              TableRow(
                                children: [
                                  const Text("Name"),
                                  Text(
                                      ": ${viewmodel.selectedCategories == null ? "..." : viewmodel.selectedCategories!.name}"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text("Price"),
                                  Text(
                                      ": ${viewmodel.selectedCategories == null ? "..." : viewmodel.selectedCategories!.price}"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text("Duration"),
                                  Text(
                                      ": ${viewmodel.selectedCategories == null ? "..." : "${viewmodel.selectedCategories!.duration} days"}"),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Center(
                                    child: Text("Service"),
                                  ),
                                  Center(
                                    child: Text("Price"),
                                  ),
                                  Center(
                                    child: Text("Weight (Kg)"),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Center(
                                      child: Text(
                                          "${viewmodel.selectedCategories == null ? "..." : viewmodel.selectedCategories!.name}")),
                                  Center(
                                      child: Text(
                                          "Rp. ${viewmodel.selectedCategories == null ? "0" : viewmodel.selectedCategories!.price}")),
                                  Center(
                                    child: Text(weightController.text),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Center(child: Text("")),
                                  Center(child: Text("Total Price")),
                                  Center(child: Text("Total")),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
