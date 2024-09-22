import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loondry/customers/models/customer_model.dart';
import 'package:loondry/customers/view_models/customer_viewmodel.dart';
import 'package:provider/provider.dart';

class FormCustomerView extends StatefulWidget {
  final CustomerModel? customer;
  const FormCustomerView({super.key, this.customer});

  @override
  State<FormCustomerView> createState() => _FormCustomerViewState();
}

class _FormCustomerViewState extends State<FormCustomerView> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final customer = widget.customer;
    if (customer != null) {
      _nameController.text = customer.name!;
      _phoneController.text = customer.phone!;
      _addressController.text = customer.address!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.customer == null ? "Add" : "Edit"} Customer"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter customer name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: "Phone",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter customer phone number';
                  } else if (value.length < 6) {
                    return 'Minimum 6 digit phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  hintText: "Address",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter customer address';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final customer = CustomerModel(
                        name: _nameController.text.trim(),
                        phone: _phoneController.text.trim(),
                        address: _addressController.text.trim());
                    if (widget.customer == null) {
                      context
                          .read<CustomerViewmodel>()
                          .createCustomer(customer);
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text(widget.customer == null ? "Add" : "Edit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
