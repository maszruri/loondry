import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loondry/customers/models/customer_model.dart';

Future showCustomerForm(BuildContext context, CustomerModel? customer) async {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  if (customer != null) {
    nameController.text = customer.name!;
    phoneController.text = customer.phone!;
    addressController.text = customer.address!;
  }

  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    context: context,
    elevation: 5,
    isScrollControlled: true,
    builder: (context) => Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${customer == null ? "Add" : "Edit"} Customer",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter customer name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter customer phone number';
                } else if (value.length < 6) {
                  return 'Minimum 6 digit phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Address"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter customer address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (customer != null) {
                    final CustomerModel customerModel = CustomerModel(
                      id: customer.id,
                      name: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                      address: addressController.text.trim(),
                    );
                    Navigator.of(context).pop(customerModel);
                  } else {
                    final CustomerModel customerModel = CustomerModel(
                      name: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                      address: addressController.text.trim(),
                    );
                    Navigator.of(context).pop(customerModel);
                  }
                }
              },
              child: const Text('Create New'),
            ),
          ],
        ),
      ),
    ),
  );
}
