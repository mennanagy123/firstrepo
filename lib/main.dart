import 'package:e_commmerces/providers/RegistrationProvider.dart';
import 'package:e_commmerces/providers/productsProvider.dart';
import 'package:e_commmerces/screens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductsProvider()),
        ChangeNotifierProvider(create: (context)=>RegistrationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUpPage(),
      ),
    );
  }
}