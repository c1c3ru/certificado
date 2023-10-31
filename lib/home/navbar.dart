import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('GERADOR DE CERTIFICADOS'),
      actions: [
        Text('Olá, ${getUserFirstName()}'),
        IconButton(
          icon: const Icon(Icons.event),
          onPressed: () {
            // TODO: Implementar a ação do botão Eventos
          },
        ),
        IconButton(
          icon: const Icon(Icons.description),
          onPressed: () {
            // TODO: Implementar a ação do botão Solicitações
          },
        ),
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            // TODO: Implementar a ação do botão Encerrar Sessão
          },
        ),
      ],
    );
  }

  String getUserFirstName() {
    // TODO: Implementar a lógica para obter o primeiro nome do usuário
    return 'Usuário';
  }
}
