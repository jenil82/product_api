import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_api/screen/home/add_data/provider/provider_deta.dart';
import 'package:product_api/screen/home/add_data/view/home_screen.dart';
import 'package:product_api/screen/home/post_deta/provider/post_provider.dart';
import 'package:product_api/screen/home/post_deta/view/post_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'add': (context) => AddScreen(),
        },
      ),
    ),
  );
}