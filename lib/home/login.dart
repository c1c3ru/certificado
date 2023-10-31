import 'package:flutter/material.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de Certificados'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Gerador de Certificados',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    // Display messages from session
                    if (sessionMessage != null) Text(sessionMessage!),
                    if (sessionMessageCad != null) Text(sessionMessageCad!),
                    const SizedBox(height: 16.0),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Nome:',
                        hintText: 'Usuário',
                      ),
                      onChanged: (value) {
                        // Handle text field changes
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Senha:',
                        hintText: 'Senha',
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        // Handle text field changes
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle login button press
                      },
                      child: const Text('Entrar'),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle request certificate button press
                      },
                      child: const Text('Solicitar Certificado'),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle register user button press
                      },
                      child: const Text('Cadastrar Usuário'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? sessionMessage; // Replace with your session message
String? sessionMessageCad; // Replace with your session message

// Add the necessary PHP session handling logic here
