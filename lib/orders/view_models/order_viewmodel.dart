import 'package:flutter/material.dart';
import 'package:loondry/categories/models/categories_model.dart';
import 'package:loondry/categories/repo/categories_service.dart';
import 'package:loondry/customers/models/customer_model.dart';
import 'package:loondry/customers/repo/customer_service.dart';

class OrderViewmodel extends ChangeNotifier {
  List<CustomerModel> _customers = [];
  List<CategoriesModel> _categories = [];
  CustomerModel? _selectedCustomer;
  CategoriesModel? _selectedCategories;
  CustomerModel? get selectedCustomer => _selectedCustomer;
  CategoriesModel? get selectedCategories => _selectedCategories;
  List<CustomerModel> get customers => _customers;
  List<CategoriesModel> get categories => _categories;

  clearData() {
    _customers = [];
    _categories = [];
    setCustomer(null);
    setCategories(null);
  }

  setData() async {
    final customer = await CustomerService.getCustomers();
    final category = await CategoriesService.getCategories();
    _customers = customer
        .map(
          (e) => CustomerModel.fromMap(e),
        )
        .toList();
    _categories = category
        .map(
          (e) => CategoriesModel.fromMap(e),
        )
        .toList();
    notifyListeners();
  }

  setCustomer(CustomerModel? customer) {
    _selectedCustomer = customer;
    notifyListeners();
  }

  setCategories(CategoriesModel? categories) {
    _selectedCategories = categories;
    notifyListeners();
  }
}
