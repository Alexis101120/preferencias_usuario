import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widgets.dart';

class HomePage extends StatelessWidget {
  static const String routName = 'home';
  final prefs = PreferenciasUsuario();


  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routName;
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${ prefs.colorSecundario }'),
          Divider(),
          Text('Genero: ${ prefs.genero }'),
          Divider(),
          Text('Nombre de usuario: ${ prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
