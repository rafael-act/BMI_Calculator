import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyBMICalculator(),
    );
  }
}

class MyBMICalculator extends StatefulWidget {
  const MyBMICalculator({super.key});

  @override
  State<MyBMICalculator> createState() => _MyBMICalculatorState();
}

class _MyBMICalculatorState extends State<MyBMICalculator> {
  late TextEditingController weightController;
  late TextEditingController heightController;

  double bmi = 0;
  String classification = '';
  Color bmiColor = Color(0xFF2cabaa);

  @override
  void initState() {
    weightController = TextEditingController(text: '');
    heightController = TextEditingController(text: '');
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
                ? Text(
                    'Insert weight and height values to calculate BMI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF161f48),
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Container(
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
                  ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                  ],
                ),
                SizedBox(width: 20),
                Column(
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
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Calculate BMI weight / (height * height)
                try {
                  double weight = double.parse(weightController.text);
                  double height = double.parse(heightController.text);
                  bmi = weight / (height * height);
                  classification = classifyBMI(bmi);
                  bmiColor = classifyColor(bmi);
                  setState(() {
                    bmi = bmi;
                  });
                } on Exception {
                  setState(() {
                    bmi = 0;
                    weightController.text = '';
                    heightController.text = '';
                    classification = '';
                    bmiColor = Color(0xFF2cabaa);
                  });
                  print('Insert valid numbers');
                }
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
