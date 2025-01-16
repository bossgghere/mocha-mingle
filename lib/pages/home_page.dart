import 'package:coffee_ui/pages/profile.dart';
import 'package:coffee_ui/util/coffee_tile.dart';
import 'package:coffee_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of coffee types
  final List coffeeTypes = [
    ['Cappuccino', false],
    ['Latte', false],
    ['Tea', false],
    ['Milk', false],
  ];

  // User tap on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      if (coffeeTypes[index][1] == true) {
        coffeeTypes[index][1] = false;
        return;
      }

      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      
      body: Column(
        mainAxisSize: MainAxisSize.min, // Make the Column size to its children
        children: [
          // Finding the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 56, color: Colors.white),
            ),
          ),
          const SizedBox(height: 25),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.orange),
                hintText: 'Find your coffee...',
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              style:
                  const TextStyle(color: Colors.white), // Set input text color
            ),
          ),
          const SizedBox(height: 20),
          // Coffee types horizontal list
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeTypes[index][0],
                  isSelected: coffeeTypes[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          // Horizontal coffee list with Expanded to prevent overflow
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/latte.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '\$4.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee.jpg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '\$6.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/milk.jpg',
                  coffeeName: 'Milk Coffee',
                  coffeePrice: '\$5.00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
