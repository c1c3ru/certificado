import 'package:flutter/material.dart';

class EventRegistration extends StatelessWidget {
  const EventRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: const EventRegistrationPage(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Cadastro de Eventos'),
    );
  }
}

class EventRegistrationPage extends StatelessWidget {
  const EventRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(labelText: 'Nome do Evento:'),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Conteúdo Programático',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            // TODO: Implementar o editor de conteúdo
          ),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(labelText: 'Local do Evento:'),
          ),
          const SizedBox(height: 16.0),
          const Row(
            children: [
              Expanded(
                child: TextField(
                  // TODO: Implementar data inicial
                  decoration: InputDecoration(labelText: 'Data inicial'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  // TODO: Implementar data final
                  decoration: InputDecoration(labelText: 'Data final'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar ação de cadastrar evento
            },
            child: const Text('Cadastrar Evento'),
          ),
        ],
      ),
    );
  }
}
