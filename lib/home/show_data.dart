import 'package:flutter/material.dart';



class ShowData extends StatelessWidget {
  const ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: const CertificatesRequestPage(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Solicitação de Certificados'),
    );
  }
}

class CertificatesRequestPage extends StatelessWidget {
  const CertificatesRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(labelText: 'Ano:'),
          ),
          const SizedBox(height: 16.0),
          CheckboxListTile(
            title: const Text('Mostrar certificados produzidos.'),
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: const Text('Mostrar certificados cancelados.'),
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar a ação do botão Mostrar
            },
            child: const Text('Mostrar'),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView(
                children: const [
                  // TODO: Implementar a lista de certificados aqui
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
