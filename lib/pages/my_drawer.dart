<<<<<<< HEAD
=======
import 'package:coffee_ui/pages/about_us_page.dart';
import 'package:coffee_ui/pages/order_history.dart';
>>>>>>> 94a3958 (todaycommit)
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
<<<<<<< HEAD
      backgroundColor: Colors.grey[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                'MOCHA MINGLE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.white),
            title: const Text('Order History', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle Order History navigation
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Handle Settings navigation
              Navigator.pop(context);
            },
          ),
=======
      backgroundColor: const Color(0xFF1E1E1E),
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.coffee, size: 32, color: Colors.orange),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'MOCHA MINGLE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Fresh Brew. Daily Joy.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Order History
          ListTile(
            leading: const Icon(Icons.history, color: Colors.orangeAccent),
            title: const Text(
              'Order History',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            hoverColor: Colors.orange.withOpacity(0.1),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderHistory()),
              );
            },
          ),
          const Divider(color: Colors.white24, indent: 16, endIndent: 16),

          ListTile(
            leading: const Icon(Icons.history, color: Colors.orangeAccent),
            title: const Text(
              'About us',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            hoverColor: Colors.orange.withOpacity(0.1),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),

          const Spacer(),
        
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.orangeAccent),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            hoverColor: Colors.orange.withOpacity(0.1),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to Settings page here
            },
          ),
          SizedBox(height: 20,),
          

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              '☕ Made with love',
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
          ),
>>>>>>> 94a3958 (todaycommit)
        ],
      ),
    );
  }
}
