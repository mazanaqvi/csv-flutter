import 'package:csv_test/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class CarsCSVScreen extends StatefulWidget {
  const CarsCSVScreen({super.key});

  @override
  _CarsCSVScreenState createState() => _CarsCSVScreenState();
}

class _CarsCSVScreenState extends State<CarsCSVScreen> {
  late List<Car> cars = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Car>> loadCSV() async {
    String csvData = await rootBundle.loadString('assets/cars.csv');
    List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);
    List<Car> carList = [];

    for (var i = 1; i < rows.length; i++) {
      // Start from index 1 to skip the header row
      var row = rows[i];
      carList.add(
        Car(
          mpg: row[0],
          cylinders: row[1],
          displacement: row[2],
          horsepower: row[3],
          weight: row[4],
          acceleration: row[5],
          modelYear: row[6],
          origin: row[7],
          carName: row[8],
        ),
      );
    }

    return carList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parsed CSV Data'),
      ),
      body: FutureBuilder(
        future: loadCSV(),
        builder: (BuildContext context, AsyncSnapshot<List<Car>> snapshot) {
          if (snapshot.hasData) {
            var dataa = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: dataa.length,
                itemBuilder: (context, index) {
                  final car = dataa[index];
                  return Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('MPG: ${car.mpg}'),
                          Text('Cylinders: ${car.cylinders}'),
                          Text('Displacement: ${car.displacement}'),
                          Text('Horsepower: ${car.horsepower}'),
                          Text('Weight: ${car.weight}'),
                          Text('Acceleration: ${car.acceleration}'),
                          Text('Model Year: ${car.modelYear}'),
                          Text('Origin: ${car.origin}'),
                          Text('Car Name: ${car.carName}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
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
