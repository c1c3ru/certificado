import 'package:flutter/material.dart';


class CertificateRequest extends StatelessWidget {
  const CertificateRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Solicitar Certificado'),
        ),
        body: const CertificateRequestPage(),
      ),
    );
  }
}

class CertificateRequestPage extends StatelessWidget {
  const CertificateRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Solicitar Certificado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(labelText: 'Nome do Evento'),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(labelText: 'Instituição'),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Carga Horária'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Tipo'),
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('Comissão Organizadora')),
                    DropdownMenuItem(value: '2', child: Text('Organizador em Evento')),
                    DropdownMenuItem(value: '3', child: Text('Participante em Evento')),
                    DropdownMenuItem(value: '4', child: Text('Palestrante em Evento')),
                    DropdownMenuItem(value: '5', child: Text('Participante em Atividade')),
                    DropdownMenuItem(value: '6', child: Text('Conclusão de Curso')),
                    DropdownMenuItem(value: '7', child: Text('Texto próprio')),
                  ],
                  onChanged: (value) {
                    // Handle dropdown value change
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Período(Dias/Meses)'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Ano'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(labelText: 'Local'),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Lista de Nomes:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const TextField(
            maxLines: 8,
            decoration: InputDecoration(
              hintText: 'Participante 01\nParticipante 02\nParticipante 03',
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Lista de Emails:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const TextField(
            maxLines: 8,
            decoration: InputDecoration(
              hintText: 'Email 01\nEmail 02\nEmail 03',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar ação de solicitar certificado
            },
            child: const Text('Solicitar'),
          ),
        ],
      ),
    );
  }
}
