import 'package:bouncy_background/bouncy_background.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BouncyDeviceSize.init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BouncyBackgroundEx(),
    );
  }
}

class BouncyBackgroundEx extends StatelessWidget {
  const BouncyBackgroundEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BouncyBackground(
          boxHeight: 50,
          boxWidth: 50,
          boxCount: 10,
          ratationSpeed: 0.05,
          isScaffold: false,
          bouncyWidget: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.purple,
            ),
          ),
          body: const Center(
            child: Column(
              children: [
                Text('data'),
                Text('data1'),
                Text('data2'),
                Text('data34'),
                Text('data12341234'),
                Text('data22'),
                Text('data25'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
