import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  static Future<void> updateStatus(String id) async {
    try {
      await databaseReference.child('solicitacao').child(id).update({'status': 'Emitido'});
      if (kDebugMode) {
        print('Status atualizado com sucesso.');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao atualizar o status: $error');
      }
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Chame esta função para atualizar o status
              FirebaseService.updateStatus('ID_DA_SOLICITACAO_A_SER_ATUALIZADA');
            },
            child: const Text('Atualizar Status'),
          ),
        ),
      ),
    );
  }
}
