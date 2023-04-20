import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../add_data/provider/provider_deta.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getApi();
  }

  ProductProvider? ProductProviderTrue;
  ProductProvider? ProductProviderFalse;

  @override
  Widget build(BuildContext context) {
    ProductProviderTrue = Provider.of<ProductProvider>(context, listen: true);
    ProductProviderFalse = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'add');
              },
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
          title: Text(
            "Products",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: ProductProviderTrue!.jsonData!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "${ProductProviderTrue!.jsonData[index].productName}"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 70,
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "₹${ProductProviderTrue!.jsonData[index].productPrice}"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 90,
                      child: Text(
                          "${ProductProviderTrue!.jsonData[index].productCategory}"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}