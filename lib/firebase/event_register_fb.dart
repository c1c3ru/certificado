import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  static DatabaseReference databaseReference;

  static Future<void> initialize() async {
    await Firebase.initializeApp(
      name: 'yourAppName',
      options: const FirebaseOptions(
        apiKey: 'YOUR_API_KEY',
        authDomain: 'YOUR_AUTH_DOMAIN',
        databaseURL: 'YOUR_DATABASE_URL',
        projectId: 'YOUR_PROJECT_ID',
        storageBucket: 'YOUR_STORAGE_BUCKET',
        messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
        appId: 'YOUR_APP_ID',
      ),
    );

    databaseReference = FirebaseDatabase.instance.reference();
  }

  static Future<void> sendData({
    required String nomeEvent,
    required String conteudoEvent,
    required String localEvent,
    required String dataEventIn,
    required String dataEventFin,
  }) async {
    try {
      await databaseReference.child('evento').push().set({
        'nome_event': nomeEvent,
        'conteudo_event': conteudoEvent,
        'local_event': localEvent,
        'data_event_in': dataEventIn,
        'data_event_fin': dataEventFin,
      });
    } catch (error) {
      print('Erro ao enviar dados: $error');
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();

  // Exemplo de como enviar dados
  await FirebaseService.sendData(
    nomeEvent: 'Nome do Evento',
    conteudoEvent: 'Conteúdo do Evento',
    localEvent: 'Local do Evento',
    dataEventIn: 'Data Inicial do Evento',
    dataEventFin: 'Data Final do Evento',
  );

  // runApp(MyApp());
}
