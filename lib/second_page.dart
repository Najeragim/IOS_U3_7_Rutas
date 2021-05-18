import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();
  SecondPage({Key key, this.texto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Najera: Página 2"),
        centerTitle: true,
      ), //AppBar
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 40,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ingrese una palabra",
                  hintText: "Palabra",
                  labelStyle: TextStyle(
                    color: Colors.orange,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ), //Padding
            ElevatedButton(
              child: Text("Volver"),
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ), //Botón elevado
          ], //Hijos de columna principal
        ), //Columna principal
      ), //Body Center
    ); //Scaffold
  } //Constructor
} //Clase SecondPage
