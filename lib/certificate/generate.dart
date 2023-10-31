import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;



class CertificateGenerator extends StatelessWidget {
  const CertificateGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CertificateGeneratorScreen(),
    );
  }
}

class CertificateGeneratorScreen extends StatelessWidget {
  const CertificateGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificate Generator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Replace with your logic to generate the certificate and save as PDF
            generateCertificateAndSaveAsPdf();
          },
          child: const Text('Generate Certificate'),
        ),
      ),
    );
  }

  Future<void> generateCertificateAndSaveAsPdf() async {
    // Replace with your logic to generate certificate content
    String certificateContent = 'This is a sample certificate content';

    // Create a PDF document
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              certificateContent,
              style: const pw.TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
    );

    // Save the PDF to a file
    final pdfBytes = await pdf.save();
    // TODO: Save the PDF bytes to your server or device storage

    // Example: Save to server using HTTP POST request
    final response = await http.post(
      Uri.parse('YOUR_SERVER_ENDPOINT'), // Replace with your server endpoint
      body: pdfBytes,
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('PDF saved successfully');
      }
    } else {
      if (kDebugMode) {
        print('Failed to save PDF: ${response.statusCode}');
      }
    }
  }
}
