import 'package:bmi_calculator/alert_message.dart';
import 'package:bmi_calculator/calculator_button_bmi.dart';
import 'package:bmi_calculator/info_imc.dart' show InfoImc;
import 'package:flutter/material.dart';

class MyBMICalculator extends StatefulWidget {
  const MyBMICalculator({super.key});

  @override
  State<MyBMICalculator> createState() => _MyBMICalculatorState();
}

class _MyBMICalculatorState extends State<MyBMICalculator> {
  late TextEditingController weightController;
  late TextEditingController heightController;
  double weight = 30;
  double height = 1.6;

  double bmi = 0;
  String classification = '';
  Color bmiColor = Color(0xFF2cabaa);

  @override
  void initState() {
    weightController = TextEditingController(text: weight.toStringAsFixed(1));
    heightController = TextEditingController(text: height.toStringAsFixed(2));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcad5de),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bmi == 0
                ? AlertMessage()
                : InfoImc(
                    bmi: bmi,
                    classification: classification,
                    bmiColor: bmiColor,
                  ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Your weight',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2cabaa),
                        ),
                      ),
                      SizedBox(height: 6),
                      SizedBox(
                        width: 125,
                        child: TextField(
                          enabled: false,
                          controller: weightController,
                          style: TextStyle(
                            color: Color(0xFF161f48),
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF161f48)),
                            ),
                            suffixText: 'kg',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 1.5,
                          activeTickMarkColor: Color(0xFF161f48),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                        ),
                        child: Slider(
                          activeColor: Color(0xFF161f48),
                          value: weight,
                          onChanged: (wheightParam) {
                            setState(() {
                              weight = wheightParam;
                              weightController.text = weight.toStringAsFixed(1);
                            });
                          },
                          min: 30,
                          max: 150,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2cabaa),
                        ),
                      ),
                      SizedBox(height: 6),
                      SizedBox(
                        width: 125,
                        child: TextField(
                          enabled: false,
                          controller: heightController,
                          style: TextStyle(
                            color: Color(0xFF161f48),
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixText: 'cm ',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 1.5,
                          activeTickMarkColor: Color(0xFF161f48),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                        ),
                        child: Slider(
                          activeColor: Color(0xFF161f48),
                          value: height,
                          onChanged: (heightParam) {
                            setState(() {
                              height = heightParam;
                              heightController.text = height.toStringAsFixed(2);
                            });
                          },
                          min: 0.5,
                          max: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            CalculatorButtonBmi(
              onPressed: () {
                  double weight = double.parse(weightController.text);
                  double height = double.parse(heightController.text);
                  bmi = weight / (height * height);
                  classification = classifyBMI(bmi);
                  bmiColor = classifyColor(bmi);
                  setState(() {
                    bmi = bmi;
                  });
              },
            ),
          ],
        ),
      ),
    );
  }

  String classifyBMI(double bmi) {
    if (bmi <= 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi < 34.9) {
      return 'Overweight 1st Degree';
    } else if (bmi >= 35 && bmi < 39.9) {
      return 'Overweight 2nd Degree';
    } else {
      return 'Obesity';
    }
  }

  Color classifyColor(double bmi) {
    if (bmi <= 18.5) {
      return Colors.blue;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else if (bmi >= 25 && bmi < 29.9) {
      return Colors.yellow;
    } else if (bmi >= 30 && bmi < 34.9) {
      return Colors.orange;
    } else if (bmi >= 35 && bmi < 39.9) {
      return Colors.redAccent;
    } else {
      return Colors.red;
    }
  }
}
