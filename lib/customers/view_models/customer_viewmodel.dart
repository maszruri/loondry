import 'package:flutter/material.dart';
import 'package:loondry/customers/models/customer_model.dart';
import 'package:loondry/customers/repo/customer_service.dart';

class CustomerViewmodel extends ChangeNotifier {
  List<CustomerModel> _customers = [];
  bool _loading = false;

  List<CustomerModel> get customers => _customers;
  bool get loading => _loading;

  setCustomers(List<CustomerModel> customers) async {
    _customers = customers;
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  getCustomers() async {
    setLoading(true);
    var response = await CustomerService.getCustomers();
    List<CustomerModel> customers = response
        .map(
          (e) => CustomerModel.fromMap(e),
        )
        .toList();
    setCustomers(customers);
    setLoading(false);
  }

  createCustomer(CustomerModel customer) async {
    await CustomerService.createCustomer(customer);
    getCustomers();
  }

  deleteCustomer(CustomerModel customer) async {
    await CustomerService.deleteCustomer(customer.id!);
    getCustomers();
  }

  updateCustomer(CustomerModel customer) async {
    await CustomerService.updateCustomer(customer);
    getCustomers();
  }
}
