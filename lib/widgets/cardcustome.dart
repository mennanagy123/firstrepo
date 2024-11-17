import 'package:e_commmerces/Models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/productsdeatils.dart';

class CardProductCustome extends StatelessWidget{
  CardProductCustome({super.key, required this.model});
  ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          elevation:20,
          child:Center(
            child: Column(
              children: [
                InkWell(
                  onTap: ()=> Navigator.push(
                    context,MaterialPageRoute(builder: (context)=>Productdeatils(
                    products:model,
                  ),)
                  ),
                  child: Container(
                    width: 130,
                    height: 130,
                    child: Image(image: NetworkImage(model.img)
                    ),
                  ),
                ),
                Text(
                  model.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}