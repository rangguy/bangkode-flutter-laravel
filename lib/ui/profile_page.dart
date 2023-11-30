import 'dart:convert';

import 'package:bangkode/Screens/login_screen.dart';
import 'package:bangkode/Services/auth_services.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

Future<Map<String, dynamic>?> fetchUserProfile(String email, String password) async {
  var response = await AuthServices.login(email, password);

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);

    // Mengekstrak informasi nama dan email dari respons server
    String name = jsonResponse['user']['name'];
    String userEmail = jsonResponse['user']['email'];

    // Mengembalikan nama dan email dalam bentuk Map
    return {'name': name, 'email': userEmail};
  } else {
    // Jika ada kesalahan, kembalikan null atau lakukan penanganan kesalahan lainnya
    return null;
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/person.png',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'User',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'user@mail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
