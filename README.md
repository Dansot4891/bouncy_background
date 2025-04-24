# bouncy_background
A Flutter package that adds animated, bouncing widgets to your background.

## ⭐️ Features
- Bouncing shapes with Random speed, size, and direction
- Supports any widget as a bouncing object
- Optional full-screen or behind-scaffold background
- Customizable overflow bounds

## 💻 Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter:
    sdk: flutter

  bouncy_background: ^1.0.2
```
OR Run
```
flutter pub add bouncy_background
```

## 📸 Preview
![Preview 1](https://raw.githubusercontent.com/Dansot4891/bouncy_background/main/screenshots/example_view_1.gif)
![Preview 2](https://raw.githubusercontent.com/Dansot4891/bouncy_background/main/screenshots/example_view_2.gif)


## ⚠️⚠️⚠️ Important: Required Setup ⚠️⚠️⚠️
Before using `bouncy_background`, you **must initialize device size** by calling:

```dart
BouncyDeviceSize.init(context);
```
This should be done at the very beginning of your app,
inside the build() method of your root widget, like this:
### Example
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BouncyDeviceSize.init(context); // ✅ MUST be called here!
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BouncyBackgroundEx(),
    );
  }
}
```

## Usage
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
          isScaffold: false, // Use internal Scaffold or not
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
          
          
          // Radians per frame, negative = counter-clockwise
          // if rotateSpeed = 0
          //    => not rotate
          //    => generally, -0.05 <= rotateSpeed <= 0.05
          rotationSpeed: 0.05,

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

## ⚙️ BouncyBackground Parameters
| Parameter               | Type                        | Required | Default      | Description                                                                 |
|-------------------------|-----------------------------|----------|--------------|-----------------------------------------------------------------------------|
| `body`                  | `Widget`                    | ✅ Yes    | –            | The main body widget of the screen                                          |
| `appBar`                | `PreferredSizeWidget?`      | ❌ No     | `null`       | Scaffold app bar                                                            |
| `bottomNavigationBar`   | `Widget?`                   | ❌ No     | `null`       | Scaffold bottom navigation bar                                              |
| `floatingActionButton`  | `FloatingActionButton?`     | ❌ No     | `null`       | Scaffold floating action button                                             |
| `backgroundColor`       | `Color?`                    | ❌ No     | `null`       | Background color of the Scaffold                                            |
| `resizeToAvoidBottomInset` | `bool?`                | ❌ No     | `null`       | Whether to resize when keyboard appears                                     |
| `minusWidth`            | `double`                    | ❌ No     | `0`          | Horizontal overflow range (how far widget can bounce off-screen)           |
| `minusHeight`           | `double`                    | ❌ No     | `0`          | Vertical overflow range (how far widget can bounce off-screen)             |
| `isScaffold`            | `bool`                      | ❌ No     | `true`       | Use Scaffold internally or not                                              |
| `rotationSpeed`         | `double`                    | ❌ No    | `null`        | Rotation speed per object (radians per frame, can be negative)            |
| `bouncyWidget`          | `Widget`                    | ✅ Yes    | –            | The widget that will be duplicated and animated                            |
| `boxWidth`              | `double`                    | ✅ Yes    | –            | Width of each bouncy widget                                                 |
| `boxHeight`             | `double`                    | ✅ Yes    | –            | Height of each bouncy widget                                                |
| `boxCount`              | `int`                       | ✅ Yes    | –            | Number of widgets to animate                                                |


## 🛠️ Planned Features / TODO
- [x] Control rotation speed per object
- [ ] Set movement speed per object
- [ ] Support multiple types of bouncy widgets in one background
- [ ] Direction bias (e.g., only left/right bounce)


## 📄 License
This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.