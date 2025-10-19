import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
                    'Insert weight and height values to calculate BMI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF161f48),
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  );
  }
}