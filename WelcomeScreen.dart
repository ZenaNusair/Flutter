import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_project_events/regScreen.dart'; // Import the regScreen widget
import 'loginScreen.dart'; // Import the loginScreen widget

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key); // Constructor for WelcomeScreen widget

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget provides a basic structure for the screen
      body: Container( // Container widget to hold the content of the screen
        height: double.infinity, // Set the height of the container to occupy the full available height
        width: double.infinity, // Set the width of the container to occupy the full available width
        color: Colors.red, // Set the background color of the container to red
        child: Column( // Column widget to arrange children vertically
          children: [
            Padding( // Padding widget to add padding around its child
              padding: const EdgeInsets.only(top: 200.0), // Add padding only to the top side
              child: Image(image: AssetImage('assets/home page header.png')), // Display an image
            ),
            Expanded( // Expanded widget to make the child expand to fill the available space
              child: Padding( // Padding widget to add padding around its child
                padding: const EdgeInsets.only(top: 100.0), // Add padding only to the top side
                child: Column( // Column widget to arrange children vertically
                  mainAxisAlignment: MainAxisAlignment.center, // Align children vertically at the center
                  children: [
                    Text( // Text widget to display text
                      'Welcome To UniConnect', // Text content
                      style: TextStyle( // Define text style
                        fontSize: 30, // Set font size
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    SizedBox(height: 30), // SizedBox widget to add space between widgets vertically
                    GestureDetector( // GestureDetector widget to detect gestures
                      onTap: () {
                        Navigator.push( // Navigate to the login screen when tapped
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen widget
                        );
                      },
                      child: Container( // Container widget to create a clickable area
                        height: 53, // Set height of container
                        width: 320, // Set width of container
                        decoration: BoxDecoration( // BoxDecoration to add styling
                          borderRadius: BorderRadius.circular(30), // Set border radius
                          border: Border.all(color: Colors.white), // Set border color
                        ),
                        child: Center( // Center widget to center its child
                          child: Text( // Text widget to display text
                            'SIGN IN', // Text content
                            style: TextStyle( // Define text style
                              fontSize: 20, // Set font size
                              fontWeight: FontWeight.bold, // Set font weight to bold
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30), // SizedBox widget to add space between widgets vertically
                    GestureDetector( // GestureDetector widget to detect gestures
                      onTap: () {
                        Navigator.push( // Navigate to the registration screen when tapped
                          context,
                          MaterialPageRoute(builder: (context) => const RegScreen()), // Navigate to RegScreen widget
                        );
                      },
                      child: Container( // Container widget to create a clickable area
                        height: 53, // Set height of container
                        width: 320, // Set width of container
                        decoration: BoxDecoration( // BoxDecoration to add styling
                          color: Colors.white, // Set background color of container to white
                          borderRadius: BorderRadius.circular(30), // Set border radius
                          border: Border.all(color: Colors.white), // Set border color
                        ),
                        child: Center( // Center widget to center its child
                          child: Text( // Text widget to display text
                            'SIGN UP', // Text content
                            style: TextStyle( // Define text style
                              fontSize: 20, // Set font size
                              fontWeight: FontWeight.bold, // Set font weight to bold
                              color: Colors.black, // Set text color to black
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
