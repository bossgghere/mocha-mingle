import 'package:coffee_ui/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

      bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: " "),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: " "),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: " ")
      ]),

      
      body: Column(
        children: [
          //finding the best coffee for u
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Find the best coffee for you' ,
             style: GoogleFonts.bebasNeue(
              fontSize: 56
             ),),
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
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                )
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          //horizontal list 
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
              ],
            ),
          )



        ],
      ),
    );
  }
}
