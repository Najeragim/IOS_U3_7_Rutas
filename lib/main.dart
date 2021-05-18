import 'package:flutter/material.dart';
import 'package:najera/route_generator.dart';

void main() => runApp(RutasApp());

class RutasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruteo',
      initialRoute: "/",
      theme: ThemeData(primarySwatch: Colors.orange,),
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );//Material App
  }//Constructor
} //Clase RutasApp

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageOne({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Najera: Página 1'),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Siguiente página",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),//Texto
            ),//Padding
            onPressed: () {
              _openSecondPage(context);
            },
          ),//Botón Material
        ),//Contenedor hijo
      ),//Body Center
    );//Scaffold
  }
  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  }//Funcion Abrir segunda página
}// Clase PageOne



