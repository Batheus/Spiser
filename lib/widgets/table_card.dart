import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spiser/models/cart_model.dart';

class TableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "Número da Mesa",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700]
          ),
        ),
        leading: Icon(Icons.restaurant),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite sua mesa - Aperte ENTER"
              ),
              initialValue: CartModel.of(context).tableCode ?? "",
              onFieldSubmitted: (text){
                Firestore.instance.collection("tables").document(text).get().then(
                        (docSnap){
                      if(docSnap.data != null){
                        CartModel.of(context).setTable(text, docSnap.data["table"]);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Mesa de número ${docSnap.data["table"]} registrada!"),
                              backgroundColor: Theme.of(context).primaryColor,)
                        );
                      } else {
                        CartModel.of(context).setTable(null, 0);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Mesa não existente!"),
                              backgroundColor: Colors.redAccent,)
                        );
                      }
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
