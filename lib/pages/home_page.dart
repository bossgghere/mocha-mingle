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
  //list of coffee types
  final List coffeeTypes = [
    ['Cappucino', false],
    ['Latte', false],
    ['Tea', false],
    ['Milk', false],
  ];

  // user tap on coffee types
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          //finding the best coffee for u
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),

          SizedBox(
            height: 25,
          ),
          //Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          // horizontal list view
          Container(
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
                      });
                },
              )),

          //horizontal list
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/latte.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '\$4.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '\$6.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/milk.jpg',
                  coffeeName: 'Milk Coffee',
                  coffeePrice: '\$5.00',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
