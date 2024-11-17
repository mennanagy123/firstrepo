import 'package:e_commmerces/Models/registration_model.dart';
import 'package:e_commmerces/Services/RegistrationServices.dart';
import 'package:flutter/cupertino.dart';

class RegistrationProvider extends ChangeNotifier{
  RegistrationModel? user;
  Future<void> Login({required String email,required String password})async{
    user = await RegistrationServices.Login(email, password);
    notifyListeners();
  }
  Future<void> SignUp({
    required String email,
    required String password,
    required String name,
    required String number
})async{
    user = await RegistrationServices.SignUp(email, password, name, number);
    notifyListeners();
  }
}