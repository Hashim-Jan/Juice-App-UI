import 'package:flutter/material.dart';
import 'package:flutteruitask/models/juice_data_model.dart';
import 'package:provider/provider.dart';
import 'ui/screens/splash_screen.dart';

void main()=>runApp(MultiProvider(
    providers:[
    ChangeNotifierProvider(create: (context)=>JuiceModel(),

    )
],
  child: MyApp(),),);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SplashScreen()
        ),
      ),
    );
  }
}
