import 'package:csv_test/views/cars_csv_view.dart';
import 'package:csv_test/views/raw_csv_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV Project"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(const RawCsvScreen());
              },
              child: const Text("Raw CSV")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const CarsCSVScreen());
                },
                child: const Text("Parsed CSV")),
          ),
        ],
      ),
    );
  }
}
