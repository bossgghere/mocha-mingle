import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

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
        title: Text(
          'Favorites',
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Favorites Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Your Favorite Coffees',
              style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),

          // List of Favorite Coffees (Sample)
          Expanded(
            child: ListView.builder(
              itemCount: 5,  // Example number of favorite items
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.black54,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(Icons.favorite, color: Colors.orange),
                    title: Text(
                      'Coffee #$index',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      'Delicious coffee drink',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                      onPressed: () {
                        // Remove from favorites logic
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
