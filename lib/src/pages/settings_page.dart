import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static const String routName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
   late bool _colorSecundario;
   late int _genero;
   String _nombre = 'Alexis';

  PreferenciasUsuario prefs = new PreferenciasUsuario();
  late TextEditingController _textEditingController;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    prefs.ultimaPagina = SettingsPage.routName;
    _textEditingController = new TextEditingController(text: prefs.nombreUsuario);
  }



  _getSelectedRadio(int? valor) {
    prefs.genero = valor!;
    _genero = valor;
    setState(() {});
  }


  _getSeletedColor(bool valor) {
    prefs.colorSecundario = valor;
    _colorSecundario = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: _getSeletedColor),
            RadioListTile(
                title: Text('Masculino'),
                value: 1,
                groupValue: _genero,
                onChanged: _getSelectedRadio),
            RadioListTile(
                title: Text('Femenino'),
                value: 2,
                groupValue: _genero,
                onChanged: _getSelectedRadio),
            const Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Ingrese nombre',
                ),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
                controller: _textEditingController,
              ),
            )
          ],
        ));
  }
}
