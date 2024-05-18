import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_project_events/regScreen.dart'; // Import the RegScreen widget
import 'package:flutter_project_events/eventsPage.dart'; // Import the EventsPage widget

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key); // Constructor for LoginScreen widget

  @override
  _LoginScreenState createState() => _LoginScreenState(); // Create state for LoginScreen widget
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Create a GlobalKey for the Form
  bool isPasswordValid = false; // Variable to track password validation
  bool isEmailValid = false; // Variable to track email validation

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget provides a basic structure for the screen
      body: Stack( // Stack widget to stack multiple widgets on top of each other
        children: [
          Container( // Container widget for background gradient
            height: double.infinity, // Set container height to fill available space
            width: double.infinity, // Set container width to fill available space
            decoration: BoxDecoration( // Decoration for the container
              gradient: LinearGradient(colors: [
                Colors.red, // Same color as the start
                Colors.red, // Same color as the end
              ]),
            ),
            child: Padding( // Padding widget to add padding to the child widget
              padding: const EdgeInsets.only(top: 60.0, left: 22), // Set padding
              child: Text( // Text widget for welcome message
                'Hello\nSign in!', // Displayed welcome message
                style: TextStyle( // Text style for welcome message
                  fontSize: 30, // Set font size
                  color: Colors.white, // Set text color to white
                  fontWeight: FontWeight.bold, // Set font weight to bold
                ),
              ),
            ),
          ),
          Padding( // Padding widget to add padding to the child widget
            padding: const EdgeInsets.only(top: 200.0), // Set padding
            child: Container( // Container widget for login form
              decoration: BoxDecoration( // Decoration for the container
                borderRadius: BorderRadius.only( // Set border radius
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white, // Set container color to white
              ),
              height: double.infinity, // Set container height to fill available space
              width: double.infinity, // Set container width to fill available space
              child: Padding( // Padding widget to add padding to the child widget
                padding: const EdgeInsets.only(left: 18.0, right: 18), // Set padding
                child: Form( // Form widget to handle form validation
                  key: _formKey, // Assign the GlobalKey to the Form
                  child: Column( // Column widget to display widgets vertically
                    mainAxisAlignment: MainAxisAlignment.center, // Align widgets to center
                    children: [
                      TextFormField( // TextFormField widget for email input
                        decoration: InputDecoration( // Decoration for text form field
                          labelText: 'Gmail', // Label for text form field
                          labelStyle: TextStyle( // Text style for label
                            fontWeight: FontWeight.bold, // Set font weight to bold
                            color: Colors.red, // Set text color to red
                          ),
                        ),
                        validator: (value) { // Validator function for text form field
                          if (value == null || value.isEmpty) {
                            return 'Gmail cannot be empty'; // Return error message if value is empty
                          }
                          return null; // Return null if validation passes
                        },
                        onChanged: (value) { // OnChanged callback for text form field
                          setState(() {
                            isEmailValid = value.isNotEmpty; // Update email validation status
                          });
                        },
                      ),
                      TextFormField( // TextFormField widget for password input
                        decoration: InputDecoration( // Decoration for text form field
                          labelText: 'Password', // Label for text form field
                          labelStyle: TextStyle( // Text style for label
                            fontWeight: FontWeight.bold, // Set font weight to bold
                            color: Colors.red, // Set text color to red
                          ),
                        ),
                        onChanged: (value) { // OnChanged callback for text form field
                          setState(() {
                            isPasswordValid = value.isNotEmpty; // Update password validation status
                          });
                        },
                        obscureText: true, // Hide password characters
                        validator: (value) { // Validator function for text form field
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty'; // Return error message if value is empty
                          }
                          return null; // Return null if validation passes
                        },
                      ),
                      SizedBox(height: 70), // SizedBox widget for spacing
                      GestureDetector( // GestureDetector widget for sign-in button
                        onTap: () { // OnTap callback for gesture detector
                          if (_formKey.currentState!.validate()) { // Check if the form is valid
                            bool loginSuccessful = true; // Replace with your authentication logic
                            if (loginSuccessful && isPasswordValid && isEmailValid) { // Check if login is successful and fields are valid
                              Navigator.push( // Navigate to EventsPage if login is successful
                                context,
                                MaterialPageRoute(builder: (context) => EventsPage()), // Navigate to EventsPage widget
                              );
                            }
                          }
                        },
                        child: Container( // Container widget for sign-in button
                          height: 55, // Set container height
                          width: 300, // Set container width
                          decoration: BoxDecoration( // Decoration for container
                            borderRadius: BorderRadius.circular(30), // Set border radius
                            gradient: LinearGradient( // Add gradient to container background
                              colors: [
                                Colors.red, // Change to red
                                Colors.red, // Change to red
                              ],
                            ),
                          ),
                          child: Center( // Center widget to center child widget
                            child: Text( // Text widget for button text
                              'SIGN IN', // Displayed button text
                              style: TextStyle( // Text style for button text
                                fontWeight: FontWeight.bold, // Set font weight to bold
                                fontSize: 20, // Set font size
                                color: Colors.white, // Set text color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 150), // SizedBox widget for spacing
                      Center( // Center widget to align children at center
                        child: Column( // Column widget to display widgets vertically
                          mainAxisAlignment: MainAxisAlignment.center, // Align widgets to center
                          crossAxisAlignment: CrossAxisAlignment.center, // Align widgets to center
                          children: [
                            Text( // Text widget for "Don't have an account?" message
                              "Don't have an account?", // Displayed message
                              style: TextStyle( // Text style for message
                                fontWeight: FontWeight.bold, // Set font weight to bold
                                color: Colors.grey, // Set text color to grey
                              ),
                            ),
                            GestureDetector( // GestureDetector widget for sign-up link
                              onTap: () { // OnTap callback for gesture detector
                                Navigator.push( // Navigate to RegScreen when tapped
                                  context,
                                  MaterialPageRoute(builder: (context) => RegScreen()), // Navigate to RegScreen widget
                                );
                              },
                              child: Text( // Text widget for sign-up link
                                "Sign up", // Displayed sign-up link text
                                style: TextStyle( // Text style for sign-up link
                                  fontWeight: FontWeight.bold, // Set font weight to bold
                                  fontSize: 17, // Set font size
                                  color: Colors.black, // Set text color to black
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
