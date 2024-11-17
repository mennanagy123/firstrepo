import 'package:dio/dio.dart';
import 'package:e_commmerces/Models/registration_model.dart';

class RegistrationServices{
  static Dio dio = Dio();
  static Future<RegistrationModel>Login(String email,String password)async{
    try{
      final response = await dio.post('https://student.valuxapps.com/api/login',
        data:{'email':email,'password':password});
      if(response.statusCode==200){
        print(response.data);
        return RegistrationModel.fromJson(response.data);
      }else{
        throw Exception("Login failed");
      }
    }catch(e){
      throw Exception("Error:$e");
    }
  }
  static Future<RegistrationModel>SignUp(
      String email,String password,String name,String number
      )async{
    try{
      final response = await dio.post('https://student.valuxapps.com/api/register',data: {
        'name':name,
        'password':password,
        'email':email,
        'phone':number,
      });
      if(response.statusCode==200){
        print(response.data);
        return RegistrationModel.fromJson(response.data);
      }else{
        throw Exception("Sign Up failed");
      }
    }
    catch(e){
      throw Exception("Error: $e");
    }
  }
}