import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Map<String, dynamic>> cartItems = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  late Timer _timer;

  final List<String> imageUrls = [
    'assets/images/coffee.jpg',
    'assets/images/latte.jpg',
    'assets/images/milk.jpg',
    'assets/images/new1.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        if (_currentPage >= imageUrls.length) _currentPage = 0;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning";
    if (hour < 17) return "Good Afternoon";
    return "Good Evening";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Greeting
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${getGreeting()}, ☕',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 46,
                        color: Colors.orangeAccent,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'FIND THE BEST COFFEE HERE',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 32,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Tagline
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  '"Life happens. Coffee helps."\nA sip of hope, every day.',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Auto-scrolling image slider
              SizedBox(
                height: 230,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double value = 1.0;
                        if (_pageController.position.haveDimensions) {
                          value = (_pageController.page! - index).abs();
                          value = (1 - (value * 0.3)).clamp(0.0, 1.0);
                        }
                        return Transform.scale(
                          scale: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage(imageUrls[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Popular Categories',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 26,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    buildCategoryTile('Espresso', Icons.local_cafe),
                    buildCategoryTile('Latte', Icons.coffee),
                    buildCategoryTile('Cold Brew', Icons.icecream),
                    buildCategoryTile('Desserts', Icons.cake),
                  ],
                ),
              ),
              

              const SizedBox(height: 30),

              // Why Choose Us
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Why Choose Us',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 26,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoTile(Icons.star, 'Premium Beans Only'),
                    infoTile(Icons.local_shipping, 'Fast Delivery'),
                    infoTile(Icons.favorite, 'Loved by Thousands'),
                    infoTile(Icons.access_time, 'Freshly Brewed Every Time'),
                    infoTile(Icons.local_offer, 'Great Offers Daily'),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryTile(String title, IconData icon) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(2, 4),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 26),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget infoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
