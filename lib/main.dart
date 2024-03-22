import 'package:flutter/material.dart';
import 'package:invoice_app/view/Home_screen/homescreen.dart';
import 'package:invoice_app/view/pdfscreen/pdfscreen.dart';
import 'package:invoice_app/view/product_data/product_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Homescreen(),
        '/data':(context) => productdata(),
        '/pdf':(context) => Pdfscreen(),
      },
    );
  }
}

