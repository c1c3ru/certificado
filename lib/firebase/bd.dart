import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  static FirebaseApp firebaseApp;
  static DatabaseReference databaseReference;

  static Future<void> initialize() async {
    firebaseApp = await Firebase.initializeApp(
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

    databaseReference = FirebaseDatabase(app: firebaseApp).reference();
  }

  // Exemplo de função para obter dados
  static Future<void> getData() async {
    // Assume que você tem uma estrutura no Firebase Realtime Database
    // Para acessar seu banco de dados, utilize: databaseReference.child('sua_colecao')

    try {
      DataSnapshot dataSnapshot = (await databaseReference.child('sua_colecao').once()) as DataSnapshot;
      if (kDebugMode) {
        print('Data: ${dataSnapshot.value}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao obter dados: $error');
      }
    }
  }

// Adicione mais métodos para inserir, atualizar ou excluir dados conforme necessário
}



