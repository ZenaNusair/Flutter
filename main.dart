import 'package:flutter/material.dart'; // Import Flutter Material package
import 'package:flutter/services.dart'; // Import Flutter Services package
import 'WelcomeScreen.dart'; // Import the WelcomeScreen widget

void main() {
  // Set system UI overlay style to have a transparent status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make status bar transparent
  ));
  
  // Run the application with MyApp widget as the root widget
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  // This method builds the widget hierarchy that represents your application's UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp provides several core Flutter functionalities
      debugShowCheckedModeBanner: false, // Hide debug banner in the top right corner
      theme: ThemeData( // Set the overall theme for the app
        fontFamily: ('inter'), // Set the default font family to 'inter'
        useMaterial3: true, // Enable Material 3 design components
      ),
      home:const WelcomeScreen(), // Set the WelcomeScreen widget as the home screen
    );
  }
}
