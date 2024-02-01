import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter White Balance',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double whiteBalanceValue = 1.0; // Initial white balance value

  @override
  Widget build(BuildContext context) {
    // Set the white balance when the slider value changes
    setWhiteBalance(whiteBalanceValue);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter White Balance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Adjust White Balance'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Slider(
              value: whiteBalanceValue,
              min: 0.5,
              max: 2.0,
              onChanged: (value) {
                setState(() {
                  whiteBalanceValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void setWhiteBalance(double value) {
    // Check if the platform is Android
    if (Theme.of(context).platform == TargetPlatform.android) {
      // Set the color temperature (white balance) for the Android platform
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.grey,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
          // statusBarContrastEnforced: false,
          // systemNavigationBarColorOverride: Colors.black.withOpacity(value),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Reset the white balance when the widget is disposed
    setWhiteBalance(1.0);
    super.dispose();
  }
}

