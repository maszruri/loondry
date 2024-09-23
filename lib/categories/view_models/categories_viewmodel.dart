import 'package:flutter/material.dart';
import 'package:loondry/categories/models/categories_model.dart';
import 'package:loondry/categories/repo/categories_service.dart';

class CategoriesViewmodel extends ChangeNotifier {
  List<CategoriesModel> _categories = [];
  bool _loading = false;

  List<CategoriesModel> get categories => _categories;
  bool get loading => _loading;

  setCategories(List<CategoriesModel> categories) async {
    _categories = categories;
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  getCategories() async {
    setLoading(true);
    var response = await CategoriesService.getCategories();
    List<CategoriesModel> categories = response
        .map(
          (e) => CategoriesModel.fromMap(e),
        )
        .toList();
    setCategories(categories);
    setLoading(false);
  }

  createCategories(CategoriesModel categories) async {
    await CategoriesService.createCategories(categories);
    getCategories();
  }

  updateCategories(CategoriesModel categories) async {
    await CategoriesService.updateCategories(categories);
    getCategories();
  }

  deleteCategories(CategoriesModel categories) async {
    await CategoriesService.deleteCategories(categories.id!);
    getCategories();
  }
}
