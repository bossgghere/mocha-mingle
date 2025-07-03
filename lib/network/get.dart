import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchMenu() async {
  final url = Uri.parse('http://localhost:3000/menu'); // ⚠️ Use LAN IP on real device

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['menu']);
    } else {
      throw Exception('Failed to load menu: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching menu: $e');
  }
}

Future<void> createOrder(List<String> itemIds) async {
  final url = Uri.parse('http://localhost:3000/order'); // ⚠️ Use LAN IP on real device

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'itemIds': itemIds}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('✅ Order ID: ${data['orderId']}');
      print('💰 Total Price: ₹${data['totalPrice']}');
    } else {
      print('❌ Order failed: ${response.body}');
    }
  } catch (e) {
    print('Error creating order: $e');
  }
}
