import 'package:dio/dio.dart';
import 'package:e_commmerces/Models/product_model.dart';

class Productsservices{
  static Dio dio = Dio();
  static Future<List<ProductModel>>GetProducts()async{
    try{
      List<ProductModel>products = [];
      final response = await dio.get('https://student.valuxapps.com/api/home');
      if(response.statusCode==200){
        for(int i=0;i<10;i++){
          products.add(ProductModel.fromJson(response.data,i ));
        }
        print(products);
        return products;
      }else{
        throw Exception("Getting products Failed");
      }
    }catch(e){
      throw Exception("Error $e");
    }
  }
}