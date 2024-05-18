import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'package:flutter_project_events/loginScreen.dart'; // Import the LoginScreen widget

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key); // Constructor for RegScreen widget

  @override
  _RegScreenState createState() => _RegScreenState(); // Create state for RegScreen widget
}

class _RegScreenState extends State<RegScreen> {
  final _formKey = GlobalKey<FormState>(); // Create a GlobalKey for the Form
  bool isNameValid = false; // Variable to track name validation
  bool isEmailValid = false; // Variable to track email validation
  bool isPasswordValid = false; // Variable to track password validation

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget provides a basic structure for the screen
      body: Stack( // Stack widget to stack multiple widgets on top of each other
        children: [
          _buildBackground(), // Call method to build background
          _buildContent(context), // Call method to build content
        ],
      ),
    );
  }

  Widget _buildBackground() { // Method to build background
    return Container( // Container widget for background gradient
      height: double.infinity, // Set container height to fill available space
      width: double.infinity, // Set container width to fill available space
      decoration: const BoxDecoration( // Decoration for the container
        gradient: LinearGradient( // Add gradient to container background
          colors: [
            Colors.red, // Red color
            Colors.red, // Red color (Same as the first color)
          ],
        ),
      ),
      child: const Padding( // Padding widget to add padding to the child widget
        padding: EdgeInsets.only(top: 60.0, left: 22), // Set padding
        child: Text( // Text widget for welcome message
          'Create Your\nAccount', // Displayed welcome message
          style: TextStyle( // Text style for welcome message
            fontSize: 30, // Set font size
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Set font weight to bold
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) { // Method to build content
    return Padding( // Padding widget to add padding to the child widget
      padding: const EdgeInsets.only(top: 200.0), // Set padding
      child: Form( // Form widget to handle form validation
        key: _formKey, // Assign the GlobalKey to the Form
        child: Container( // Container widget for form content
          decoration: const BoxDecoration( // Decoration for the container
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
            child: Column( // Column widget to display widgets vertically
              mainAxisAlignment: MainAxisAlignment.center, // Align widgets to center
              children: [
                TextFormField( // TextFormField widget for name input
                  decoration: InputDecoration( // Decoration for text form field
                    labelText: 'Name', // Label for text form field
                    labelStyle: TextStyle( // Text style for label
                      fontWeight: FontWeight.bold, // Set font weight to bold
                      color: Colors.red, // Set text color to red
                    ),
                  ),
                  onChanged: (value) { // OnChanged callback for text form field
                    setState(() {
                      isNameValid = value.isNotEmpty; // Update name validation status
                    });
                  },
                  validator: (value) { // Validator function for text form field
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty'; // Return error message if value is empty
                    }
                    return null; // Return null if validation passes
                  },
                ),
                TextFormField( // TextFormField widget for email input
                  decoration: InputDecoration( // Decoration for text form field
                    labelText: 'Gmail', // Label for text form field
                    labelStyle: TextStyle( // Text style for label
                      fontWeight: FontWeight.bold, // Set font weight to bold
                      color: Colors.red, // Set text color to red
                    ),
                  ),
                  onChanged: (value) { // OnChanged callback for text form field
                    setState(() {
                      isEmailValid = value.isNotEmpty; // Update email validation status
                    });
                  },
                  validator: (value) { // Validator function for text form field
                    if (value == null || value.isEmpty) {
                      return 'Gmail cannot be empty'; // Return error message if value is empty
                    }
                    return null; // Return null if validation passes
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
                  validator: (value) { // Validator function for text form field
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty'; // Return error message if value is empty
                    }
                    return null; // Return null if validation passes
                  },
                  obscureText: true, // Hide password characters
                ),
                const SizedBox(height: 10), // SizedBox widget for spacing
                const SizedBox(height: 70), // SizedBox widget for spacing
                GestureDetector( // GestureDetector widget for sign-in button
                  onTap: () { // OnTap callback for gesture detector
                    if (_formKey.currentState!.validate()) { // Check if the form is valid
                      Navigator.push( // Navigate to LoginScreen if form is valid
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to LoginScreen widget
                      );
                    }
                  },
                  child: Container( // Container widget for sign-in button
                    height: 55, // Set container height
                    width: 300, // Set container width
                    decoration: BoxDecoration( // Decoration for container
                      borderRadius: BorderRadius.circular(30), // Set border radius
                      gradient: const LinearGradient( // Add gradient to container background
                        colors: [
                          Colors.red, // Red color
                          Colors.red, // Red color (Same as the first color)
                        ],
                      ),
                    ),
                    child: Center( // Center widget to center child widget
                      child: Text( // Text widget for sign-in button label
                        'SIGN UP', // Displayed sign-in button label
                        style: TextStyle( // Text style for sign-in button label
                          fontWeight: FontWeight.bold, // Set font weight to bold
                          fontSize: 20, // Set font size
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80), // SizedBox widget for spacing
                Center( // Center widget to align children at center
                  child: Column( // Column widget to display widgets vertically
                    mainAxisAlignment: MainAxisAlignment.center, // Align widgets to center
                    crossAxisAlignment: CrossAxisAlignment.center, // Align widgets to center
                    children: [
                      Text( // Text widget for "Already have an account?" message
                        "Already have an account?", // Displayed message
                        style: TextStyle( // Text style for message
                          fontWeight: FontWeight.bold, // Set font weight to bold
                          color: Colors.grey, // Set text color to grey
                        ),
                      ),
                      GestureDetector( // GestureDetector widget for "Sign in" link
                        onTap: () { // OnTap callback for gesture detector
                          Navigator.push( // Navigate to LoginScreen when tapped
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to LoginScreen widget
                          );
                        },
                        child: Text( // Text widget for "Sign in" link
                          "Sign in", // Displayed "Sign in" link text
                          style: TextStyle( // Text style for "Sign in" link
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
    );
  }
}
