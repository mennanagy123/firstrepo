import 'package:e_commmerces/screens/LoginScreen.dart';
import 'package:e_commmerces/widgets/TextFaildCustomeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/RegistrationProvider.dart';
class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});
TextEditingController emailcont = TextEditingController();
TextEditingController passcont = TextEditingController();
TextEditingController namecont = TextEditingController();
TextEditingController numbercont = TextEditingController();
final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Form(key: formkey,child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 350,
            height: 650,
            color: Colors.black12,
            child: Column(
              children: [
                SizedBox(height: 50,),
                TextFalidCustome(txtlabel: "Email", controller: emailcont, obscuretxt: false, validator: (value){
                  if(value == null || value.isEmpty){
                    return "This Faild Requird";
                  }
                  return null;
                },
                ),
                TextFalidCustome(txtlabel: "password", 
                    controller: passcont, obscuretxt: true, validator: (value){
                  if(value == null || value.isEmpty){
                    return "This Failed Required";
                  }
                  return null;
                    },
                ),
                TextFalidCustome(txtlabel: "Phone Number", 
                    controller: numbercont, obscuretxt: false,
                    validator: (value){
                  if(value == null || value.isEmpty){
                    return "This Failed Requird";
                  }
                  return null;
                    },
                ),
                TextFalidCustome(txtlabel: "Name", 
                    controller: namecont, obscuretxt: false,
                    validator: (value){
                  if(value == null|| value.isEmpty){
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
                            value.SignUp(
                              email:emailcont.text,
                              password:passcont.text,
                              name:namecont.text,
                              number:numbercont.text
                            );
                            if(value.user!=null){
                              if(value.user!.status){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=>LoginPage()));
                              }else{
                                ScaffoldMessenger(
                                  child: SnackBar(content: Text("Invalid data")),
                                );
                              }
                            }
                          }
                        },
                          child: Text("Sign Up",style: TextStyle(color: Colors.white),
                          ),
                        ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an Account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                        child: Text("Login"))
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
