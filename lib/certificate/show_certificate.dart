import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;



class CertificateViewe extends StatelessWidget {
  const CertificateViewe({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CertificateViewerScreen(),
    );
  }
}

class CertificateViewerScreen extends StatelessWidget {
  const CertificateViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificate Viewer'),
      ),
      body: FutureBuilder(
        // Replace with your logic to fetch certificate data from Firebase
        future: fetchCertificateDataFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Replace with your logic to display the certificate data
            // and handle download or display of certificates
            return buildCertificateListView(snapshot.data);
          }
          return const Center(child: Text('No data available.'));
        },
      ),
    );
  }

  Future<List<CertificateData>> fetchCertificateDataFromFirebase() async {
    // TODO: Fetch certificate data from Firebase
    // Return a list of CertificateData objects
    // You need to implement this according to your Firebase structure
    return []; // Placeholder, replace with actual data
  }

  Widget buildCertificateListView(List<CertificateData> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index].eventName),
          subtitle: Text('Year: ${data[index].year}'),
          onTap: () {
            // Replace with your logic to handle certificate viewing or download
            // You may want to open a PDF viewer or start a download
            // based on the certificate information
          },
        );
      },
    );
  }
}

// Placeholder class for certificate data
class CertificateData {
  final String eventName;
  final int year;

  CertificateData({required this.eventName, required this.year});
}
