import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/property_provider.dart';
import '../widgets/property/property_tile.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    PropertyProvider propertyPro = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shops'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 700,
              width: 400,
              child: ListView.builder(
                itemCount: propertyPro.property.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return PropertyTile(
                    property: propertyPro.property[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
