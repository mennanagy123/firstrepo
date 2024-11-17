import 'package:e_commmerces/providers/productsProvider.dart';
import 'package:e_commmerces/widgets/cardcustome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context,value,child){
          if(value.products.isEmpty){
            value.getProducts();
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ), itemCount: 10,itemBuilder: (context,index)=>CardProductCustome(model: value.products[index]));
        },
      )
    );
  }
}
