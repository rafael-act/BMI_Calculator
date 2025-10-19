import 'package:flutter/material.dart';

class CalculatorButtonBmi extends StatelessWidget {
  const CalculatorButtonBmi({super.key,required this.onPressed});

final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return     ElevatedButton(
              onPressed: () {
                onPressed();
                // Calculate BMI weight / (height * height)
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Color(0xFF161f48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Calculate BMI  ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFcad5de),
                ),
              ),
            )
        ;
  }
}