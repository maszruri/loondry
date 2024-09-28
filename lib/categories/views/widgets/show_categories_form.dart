import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loondry/categories/models/categories_model.dart';

Future showCategoriesForm(
    BuildContext context, CategoriesModel? categories) async {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController minWeightController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  if (categories != null) {
    nameController.text = categories.name!;
    priceController.text = categories.price.toString();
    minWeightController.text = categories.minimumWeight.toString();
    durationController.text = categories.duration.toString();
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
              "${categories == null ? "Add" : "Edit"} Categories",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Price per Kilogramm',
                prefix: Text("Rp. "),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: minWeightController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration:
                  const InputDecoration(labelText: 'Minimum Weight (Kg)'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: durationController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: "Duration (days)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (categories != null) {
                  final CategoriesModel categoriesModel = CategoriesModel(
                    id: categories.id,
                    name: nameController.text.trim(),
                    price: int.parse(priceController.text.trim()),
                    minimumWeight: int.parse(minWeightController.text.trim()),
                    duration: int.parse(durationController.text.trim()),
                  );
                  Navigator.of(context).pop(categoriesModel);
                } else {
                  final CategoriesModel categoriesModel = CategoriesModel(
                    name: nameController.text.trim(),
                    price: int.parse(priceController.text.trim()),
                    minimumWeight: int.parse(minWeightController.text.trim()),
                    duration: int.parse(durationController.text.trim()),
                  );
                  Navigator.of(context).pop(categoriesModel);
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
