import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.transparent,
      ),
      body:  Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Icon(Icons.person_2 , size: 175,),
            SizedBox(
              height: 30,
            ),
            Text("Gourav Kumar" , style: GoogleFonts.bebasNeue(fontSize: 50, color: Colors.orange))
          ],
        ),
      ),
    );
  }
}