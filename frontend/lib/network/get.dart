import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://13.48.70.3:3000/api';

Future<List<Map<String, dynamic>>> fetchMenu() async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/items'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['data']);
    }
    else {
      throw Exception('Failed to fetch menu');
    }
  } catch (e) {
    print('Error fetching menu: $e');
    return [];
  }
}



Future<Map<String, dynamic>?> createOrder({
  required int userId,
  required int restaurantId,
  required double totalPrice,
  required List<Map<String, dynamic>> items,
}) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'restaurantId': restaurantId,
        'totalPrice': totalPrice,
        'items': items,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['data'];
    }
    return null;
  } catch (e) {
    print('Error creating order: $e');
    return null;
  }
}