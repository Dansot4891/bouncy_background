import 'package:flutter/material.dart';
import 'package:bouncy_background/bouncy_background_package.dart';

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
          bouncyWidget: Image.network(
              width: 50,
              height: 50,
              'https://i.namu.wiki/i/d1A_wD4kuLHmOOFqJdVlOXVt1TWA9NfNt_HA0CS0Y_N0zayUAX8olMuv7odG2FiDLDQZIRBqbPQwBSArXfEJlQ.webp'),
          body: const Center(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
