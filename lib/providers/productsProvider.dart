import 'package:e_commmerces/Models/product_model.dart';
import 'package:e_commmerces/Services/ProductsServices.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider extends ChangeNotifier{
  List<ProductModel> products=[];
  Future<void> getProducts()async{
    products = await Productsservices.GetProducts();
    notifyListeners();
  }
}