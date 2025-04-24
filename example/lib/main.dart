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
    AppSize.init(context);
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
    return BouncyBackground(
        isScaffold: true,
        bouncyWidget: Image.network(
            width: 50,
            height: 50,
            'https://i.namu.wiki/i/d1A_wD4kuLHmOOFqJdVlOXVt1TWA9NfNt_HA0CS0Y_N0zayUAX8olMuv7odG2FiDLDQZIRBqbPQwBSArXfEJlQ.webp'),
        body: const SafeArea(
          child: Center(
            child: Column(
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
                Text('6'),
              ],
            ),
          ),
        ));
  }
}
