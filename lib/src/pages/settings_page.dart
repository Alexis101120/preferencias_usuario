import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/widgets/menu_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static const String routName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int? _genero = 1;
  String _nombre = 'Alexis';

  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarPref();
    _textEditingController = new TextEditingController(text: _nombre);
  }

  cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState(() {});
  }

  _getSelectedRadio(int? valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('genero', valor ?? 1);
    _genero = valor ?? 1;
    print(valor);
    setState(() {});
  }

  _getSeletedColor(bool valor) {
    _colorSecundario = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
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
                onChanged: (value) {},
                controller: _textEditingController,
              ),
            )
          ],
        ));
  }
}
