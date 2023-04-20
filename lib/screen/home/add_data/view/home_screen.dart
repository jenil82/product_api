import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../post_deta/provider/post_provider.dart';
import '../provider/provider_deta.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  AddProvider? AddProviderTrue;
  AddProvider? AddProviderFalse;

  ProductProvider? ProductProviderTrue;
  ProductProvider? ProductProviderFalse;

  @override
  Widget build(BuildContext context) {
    AddProviderTrue = Provider.of<AddProvider>(context, listen: true);
    AddProviderFalse = Provider.of<AddProvider>(context, listen: false);
    ProductProviderTrue = Provider.of<ProductProvider>(context, listen: true);
    ProductProviderFalse = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Product"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: AddProviderTrue!.txtName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: AddProviderTrue!.txtRate,
                  decoration: InputDecoration(
                    labelText: "Enter Rate",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: AddProviderTrue!.txtPrice,
                  decoration: InputDecoration(
                    labelText: "Enter Price",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: AddProviderTrue!.txtOffer,
                  decoration: InputDecoration(
                    labelText: "Enter Offer",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: AddProviderTrue!.txtDescription,
                  decoration: InputDecoration(
                    labelText: "Enter Description",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: AddProviderTrue!.txtCategory,
                  decoration: InputDecoration(
                    labelText: "Enter Category",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String name = AddProviderTrue!.txtName.text;
                    String offer = AddProviderTrue!.txtOffer.text;
                    String description = AddProviderTrue!.txtDescription.text;
                    String category = AddProviderTrue!.txtCategory.text;
                    String rate = AddProviderTrue!.txtRate.text;
                    String price = AddProviderTrue!.txtPrice.text;
                    String msg = await AddProviderFalse!.postApi(
                        name, rate, price, offer, description, category);
                    ProductProviderFalse!.getApi();
                    print("$msg");
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
