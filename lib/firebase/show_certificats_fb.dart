import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

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

  static Future<void> sendSessionData({
    required String evento,
    required String instituicao,
    required String local,
    required String periodo,
    required String cargaHoraria,
    required List<String> nomesLista,
    required List<String> emailsLista,
  }) async {
    try {
      await databaseReference.child('sessions').push().set({
        'evento': evento,
        'instituicao': instituicao,
        'local': local,
        'periodo': periodo,
        'cargaHoraria': cargaHoraria,
        'nomesLista': nomesLista,
        'emailsLista': emailsLista,
      });
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao enviar dados da sessão: $error');
      }
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();

  // Exemplo de como enviar dados da sessão
  await FirebaseService.sendSessionData(
    evento: 'Nome do Evento',
    instituicao: 'Instituição',
    local: 'Local do Evento',
    periodo: 'Período',
    cargaHoraria: 'Carga Horária',
    nomesLista: ['Nome1', 'Nome2'],
    emailsLista: ['email1@example.com', 'email2@example.com'],
  );

  // runApp(MyApp());
}
