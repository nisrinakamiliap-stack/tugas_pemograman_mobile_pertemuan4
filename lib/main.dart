import 'package:flutter/material.dart';
import 'login_page.dart'; // supaya main.dart kenal class LoginPage
 
void main() {
  runApp(const ProfilApp());
}
 
class ProfilApp extends StatelessWidget {
  const ProfilApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // halaman pertama kini LoginPage, bukan HalamanProfil
    );
  }
}
