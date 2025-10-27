// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NotifyPage extends StatelessWidget {
//   const NotifyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: Column(
//         children: [
//           // Notifications Title
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: Text(
//               'Your Notifications',
//               style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
//             ),
//           ),
//           SizedBox(height: 20),

//           // List of Notifications (Sample)
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10, // Example number of notifications
//               itemBuilder: (context, index) {
//                 return Card(
//                   color: Colors.black54,
//                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//                   child: ListTile(
//                     leading: Icon(Icons.notifications, color: Colors.orange),
//                     title: Text(
//                       'New Offer #${index+1}',
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                     subtitle: Text(
//                       'Check out the latest coffee offers!',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     trailing: IconButton(
//                       icon:
//                           Icon(Icons.check_circle_outline, color: Colors.green),
//                       onPressed: () {
//                         // Mark as read logic
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
