import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

Future<List<List<dynamic>>> loadCSV() async {
  // Load the CSV file from assets
  String csvData = await rootBundle.loadString('assets/cars.csv');

  // Parse the CSV data
  List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);

  return csvTable;
}
