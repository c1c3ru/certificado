import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class CertificateGenerator extends StatelessWidget {
  const CertificateGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CertificateGeneratorScreen(),
    );
  }
}

class CertificateGeneratorScreen extends StatelessWidget {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController attendeesController = TextEditingController();

  CertificateGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificate Generator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: eventNameController,
                decoration: const InputDecoration(labelText: 'Event Name'),
              ),
              TextFormField(
                controller: institutionController,
                decoration: const InputDecoration(labelText: 'Institution'),
              ),
              TextFormField(
                controller: attendeesController,
                maxLines: 5,
                decoration: const InputDecoration(
                    labelText: 'Attendees (comma-separated)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  generateCertificate(
                    eventNameController.text,
                    institutionController.text,
                    attendeesController.text,
                  );
                },
                child: const Text('Generate Certificate'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
