import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoImc extends StatelessWidget {
  Color bmiColor;
  double bmi;
  String classification;

  InfoImc({super.key,
  required this.bmi,
  required this.classification, 
  required this.bmiColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(color: bmiColor, width: 10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          classification,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: bmiColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Text(
                          bmi.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: bmiColor,
                          ),
                        ),
                      ],
                    ),
                  );
  }
}