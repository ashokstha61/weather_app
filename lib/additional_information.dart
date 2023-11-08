import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            elevation: 6,
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  Icon(
                    Icons.water_drop,
                    size: 32,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Humidity',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '94',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 6,
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  Icon(
                    Icons.air,
                    size: 32,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Wind Speed',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '7.67',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 6,
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  Icon(
                    Icons.umbrella,
                    size: 32,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pressure',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1006',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
