import 'package:csv_test/services/csv_importer.dart';
import 'package:flutter/material.dart';

class RawCsvScreen extends StatelessWidget {
  const RawCsvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raw CSV Data'),
      ),
      body: FutureBuilder(
        future: loadCSV(),
        builder: (BuildContext context,
            AsyncSnapshot<List<List<dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].join(
                      ' | ')), // Customize this according to your CSV structure
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading CSV file'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
