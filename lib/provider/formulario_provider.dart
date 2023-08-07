import 'package:flutter/material.dart';

import '../models/formulario.dart';

class FormularioProvider with ChangeNotifier {
  List<Formulario> formularios = [];

  void addFormulario(Formulario formulario) {
    formularios.add(formulario);
    notifyListeners();
  }
}
