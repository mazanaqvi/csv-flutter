import 'package:csv/csv.dart';

class Car {
  final num mpg;
  final num cylinders;
  final num displacement;
  final num horsepower;
  final num weight;
  final num acceleration;
  final num modelYear;
  final num origin;
  final String carName;

  Car({
    required this.mpg,
    required this.cylinders,
    required this.displacement,
    required this.horsepower,
    required this.weight,
    required this.acceleration,
    required this.modelYear,
    required this.origin,
    required this.carName,
  });
}

List<Car> parseCarCSV(String csvData) {
  List<List<dynamic>> rows = CsvToListConverter().convert(csvData);
  List<Car> cars = [];

  for (var row in rows) {
    cars.add(
      Car(
        mpg: num.parse(row[0]),
        cylinders: num.parse(row[1]),
        displacement: num.parse(row[2]),
        horsepower: num.parse(row[3]),
        weight: num.parse(row[4]),
        acceleration: double.parse(row[5]),
        modelYear: num.parse(row[6]),
        origin: num.parse(row[7]),
        carName: row[8],
      ),
    );
  }

  return cars;
}
