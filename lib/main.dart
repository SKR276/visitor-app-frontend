import 'package:flutter/material.dart';
import 'package:visitor_app_new/pages/adminLogin.dart';

void main(){
  runApp(MainPage());
}
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminLogin(
      ),
    );
  }
}
