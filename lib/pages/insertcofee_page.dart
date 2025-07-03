import 'package:coffee_ui/db/db_helper.dart';
import 'package:flutter/material.dart';
import '../datamodel/getterSetter.dart';

import 'show_data.dart';

class InsertCoffeePage extends StatefulWidget {
  const InsertCoffeePage({super.key});

  @override
  State<InsertCoffeePage> createState() => _InsertCoffeePageState();
}

class _InsertCoffeePageState extends State<InsertCoffeePage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _imageController = TextEditingController();
  final _costController = TextEditingController();
  CoffeeCategory _selectedCategory = CoffeeCategory.espresso;

  final DBHelper dbHelper = DBHelper();

  void _saveCoffee() async {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();
    final image = _imageController.text.trim();
    final cost = double.tryParse(_costController.text.trim()) ?? 0;

    if (name.isEmpty || desc.isEmpty || cost == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields required")),
      );
      return;
    }

    final coffee = Coffee(
      name: name,
      description: desc,
      image: image,
      cost: cost,
      category: _selectedCategory,
    );

    await dbHelper.insertCoffee(coffee);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ShowData()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: const Text("Add Coffee"), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _input("Name", _nameController),
              const SizedBox(height: 10),
              _input("Description", _descController),
              const SizedBox(height: 10),
              _input("Image Path", _imageController),
              const SizedBox(height: 10),
              _input("Cost", _costController, isNumber: true),
              const SizedBox(height: 10),
              DropdownButton<CoffeeCategory>(
                dropdownColor: Colors.grey[800],
                value: _selectedCategory,
                items: CoffeeCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.name, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedCategory = value);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCoffee,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Save Coffee"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(String label, TextEditingController controller, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.orange),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
      ),
    );
  }
}
