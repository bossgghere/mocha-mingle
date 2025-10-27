import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart'; // Make sure this file contains the cartItems list

class CoffeeDetailedPage extends StatefulWidget {
  final Map<String, dynamic> coffee;

  const CoffeeDetailedPage({super.key, required this.coffee});

  @override
  State<CoffeeDetailedPage> createState() => _CoffeeDetailedPageState();
}

class _CoffeeDetailedPageState extends State<CoffeeDetailedPage>
    with SingleTickerProviderStateMixin {
  String selectedSize = 'S';
  double displayPrice = 0.0;
  int quantity = 1;

  late AnimationController _buttonController;

  @override
  void initState() {
    super.initState();
    displayPrice = widget.coffee['price']?.toDouble() ?? 0.0;
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  void updatePrice(String size) {
    double basePrice = widget.coffee['price']?.toDouble() ?? 0.0;
    setState(() {
      selectedSize = size;
      if (size == 'S') {
        displayPrice = basePrice;
      } else if (size == 'M') {
        displayPrice = basePrice + 30;
      } else if (size == 'L') {
        displayPrice = basePrice + 60;
      }
    });
  }

  void addToCart() {
    final coffee = widget.coffee;
    cartItems.add({
      'id': coffee['id'],
      'name': coffee['name'],
      'price': displayPrice,
      'quantity': quantity,
      'image': coffee['imageUrl'],
      'size': selectedSize,
    });
  }

  @override
  Widget build(BuildContext context) {
    final coffee = widget.coffee;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF141414), Color(0xFF1E1E1E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: Image.network(
                        coffee['imageUrl'] ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.broken_image, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.85)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 12,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffee['name'] ?? '',
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Handcrafted with love ☕',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(5, (i) {
                              return const Icon(Icons.star,
                                  size: 16, color: Colors.amber);
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Select Size",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.2),
                                      border: Border.all(color: Colors.orange),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      '₹${displayPrice.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                          color: Colors.orangeAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: ['S', 'M', 'L'].map((size) {
                                  final isSelected = size == selectedSize;
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ChoiceChip(
                                      label: Text(size),
                                      labelStyle: TextStyle(
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      selectedColor: Colors.orangeAccent,
                                      backgroundColor: Colors.white10,
                                      selected: isSelected,
                                      onSelected: (_) => updatePrice(size),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                coffee['description'] ?? '',
                                style: GoogleFonts.lora(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                        color: Colors.redAccent),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) quantity--;
                                      });
                                    },
                                  ),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                        color: Colors.greenAccent),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Center(
                                child: GestureDetector(
                                  onTapDown: (_) => _buttonController.forward(),
                                  onTapUp: (_) {
                                    _buttonController.reverse();
                                    addToCart();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Text("Added to cart",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                    );
                                  },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.orangeAccent
                                                .withOpacity(0.5),
                                            blurRadius: 12,
                                            offset: const Offset(0, 5),
                                          )
                                        ],
                                      ),
                                      child: const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
