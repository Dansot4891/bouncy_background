# bouncy_background
---
A Flutter package that adds animated, bouncing widgets to your background.

## ⭐️ Features
---
- Bouncing shapes with Random speed, size, and direction
- Supports any widget as a bouncing object
- Optional full-screen or behind-scaffold background
- Customizable overflow bounds

## 💻 Installation
---
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter:
    sdk: flutter

  bouncy_background: ^1.0.0
```
OR Run
```
flutter pub add bouncy_background
```

## Usage
---
You are free to use the background with or without Scaffold.
You are also free to set the size of the widgets and the widgets you want to use as backgrounds.
However, please set the number of widgets to be in the background and the size of the widgets well.
```dart
class BouncyBackgroundEx extends StatelessWidget {
  const BouncyBackgroundEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BouncyBackground(
          isScaffold: false, // With or without Scaffold
          // if with Scaffold

          // you can set the following variables.
          // ---- Scaffold variables ----
          // PreferredSizeWidget? appBar;
          // Widget? bottomNavigationBar;
          // FloatingActionButton? floatingActionButton;
          // Color? backgroundColor;
          // bool? resizeToAvoidBottomInset;
          // ---- Scaffold variables ----

          // How much the object can move beyond the right edges
          minusWidth: 100, 

          // How much the object can move below the screen
          // For Example,
          // if you set bottomNaviation, minusHeight about 100 setting
          minusHeight: 100,
          
          boxHeight: 50, // inner widget height
          boxWidth: 50, // inner widget width
          boxCount: 10, // inner widget count
          // custom inner widget
          bouncyWidget: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
            ),
          ),
          // body
          body: const Center(
            child: Column(
              children: [   
                Text('1'),
                Text('2'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## 📸 Preview
---
![Demo](https://github.com/yourname/bouncy_background/blob/main/example.gif)

## 📄 License
---
This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.