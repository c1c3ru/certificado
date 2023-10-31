import 'package:flutter/cupertino.dart';

import 'firebase/bd.dart';
import 'home/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();

  // Exemplo de como chamar a função para obter dados
  await FirebaseService.getData();
  runApp(const Login());
}