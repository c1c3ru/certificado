import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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

  static Future<List<String>> fetchEventNames() async {
    List<String> eventNames = [];

    try {
      DataSnapshot dataSnapshot = (await databaseReference.child('evento').once()) as DataSnapshot;
      if (dataSnapshot.value != null) {
        Object? eventMap = dataSnapshot.value;
        eventMap?.forEach((key, value) {
          eventNames.add(value['nome_event']);
        });
      }
    } catch (error) {
      print('Erro ao buscar os nomes dos eventos: $error');
    }

    return eventNames;
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
          child: FutureBuilder<List<String>>(
            future: FirebaseService.fetchEventNames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<String>? eventNames = snapshot.data;
                return DropdownButton<String>(
                  value: null,
                  items: eventNames?.map((String eventName) {
                    return DropdownMenuItem<String>(
                      value: eventName,
                      child: Text(eventName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Do something when the dropdown value changes
                  },
                );
              } else {
                return const Text('Nenhum conteúdo disponível.');
              }
            },
          ),
        ),
      ),
    );
  }
}
