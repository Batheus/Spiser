 import 'package:flutter/material.dart';
import 'package:spiser/models/cart_model.dart';
import 'package:spiser/models/user_model.dart';
import 'package:spiser/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

 void main() => runApp(new MyApp());

 class MyApp extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return ScopedModel<UserModel>(
       model: UserModel(),
       child: ScopedModelDescendant<UserModel>(
           builder: (context, child, model){
             return ScopedModel<CartModel>(
               model: CartModel(model),
               child: MaterialApp(
                   title: "Spiser",
                   theme: ThemeData(
                       primarySwatch: Colors.blue,
                       primaryColor: Color.fromRGBO(210, 86, 76, 1)
                   ),
                   debugShowCheckedModeBanner: false,
                   home: HomeScreen()
               ),
             );
           }
       ),
     );
   }
 }
