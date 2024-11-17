import 'package:e_commmerces/screens/productscreen.dart';
import 'package:e_commmerces/screens/signupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/RegistrationProvider.dart';
import '../widgets/TextFaildCustomeWidget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailcont = TextEditingController();
  TextEditingController passcont = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 350,
            height: 650,
            color: Colors.black12,
            child: Form(key: formkey,child: Column(
              children: [
                SizedBox(height: 60),
                SizedBox(height: 50,),
                TextFalidCustome(txtlabel: "Email", controller: emailcont, obscuretxt: false, validator: (value){
                  if(value == null || value.isEmpty){
                    return "This Falid Requird";
                  }
                  return null;
                },
                ),
                TextFalidCustome(txtlabel: "password", controller: passcont, obscuretxt: true, validator: (value){
                  if(value == null || value.isEmpty){
                    return "This Faild Requird";
                  }
                  return null;
                },
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Consumer<RegistrationProvider>(
                    builder: (context,value,child)=>MaterialButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        value.Login(
                            email: emailcont.text,
                            password: passcont.text);
                        if(value.user !=null){
                          if(value.user!.status){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductsPage()));
                          }else{
                            ScaffoldMessenger(
                              child: SnackBar(content: Text("invalid data")),
                            );
                          }
                        }else{
                          ScaffoldMessenger(
                            child:SnackBar(content: Text("can't fitch"))
                          );
                        }
                      }
                    },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black45,
                      height: 40,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an Account"),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage(),));
                        }, child: Text("Sign Up"))
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
