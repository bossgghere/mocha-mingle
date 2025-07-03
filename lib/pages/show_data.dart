import 'package:flutter/material.dart';
import 'package:coffee_ui/datamodel/getterSetter.dart'; // Your Coffee model
import 'package:coffee_ui/db/db_helper.dart'; // Your DBHelper

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late Future<List<Coffee>> _coffeeList;

  @override
  void initState() {
    super.initState();
    _coffeeList = DBHelper().fetchCoffee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee List"),
      ),
      body: FutureBuilder<List<Coffee>>(
        future: _coffeeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No coffee data found."));
          }

          final coffees = snapshot.data!;

          return ListView.builder(
            itemCount: coffees.length,
            itemBuilder: (context, index) {
              final coffee = coffees[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset(coffee.image, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(coffee.name),
                  subtitle: Text("${coffee.category.name} • ₹${coffee.cost.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await DBHelper().deleteCoffee(coffee.id!);
                      setState(() {
                        _coffeeList = DBHelper().fetchCoffee(); // Refresh list
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
