import 'package:flutter/material.dart'; // Import the Flutter Material package

class AddedEventsPage extends StatefulWidget {
  final List<Map<String, dynamic>> events; // Define the events list as a member variable

  // Constructor that accepts the events list as a named parameter
  const AddedEventsPage({Key? key, required this.events}) : super(key: key);

  @override
  _AddedEventsPageState createState() => _AddedEventsPageState(); // Create state for AddedEventsPage
}

class _AddedEventsPageState extends State<AddedEventsPage> {
  @override
  Widget build(BuildContext context) {
    // Build method for the AddedEventsPage widget
    return Scaffold( // Scaffold widget provides a basic structure for the screen
      appBar: AppBar( // AppBar widget for the top app bar
        title: Text('Added Events'), // Set the title of the app bar
        backgroundColor: Colors.red, // Set app bar background color to red
      ),
      body: ListView.builder( // ListView.builder to display a list of added events
        itemCount: widget.events.length, // Set the number of items in the list
        itemBuilder: (context, index) { // Builder function to build each item in the list
          final event = widget.events[index]; // Get the event at the current index
          return Card( // Card widget to display each event as a card
            color: Colors.white, // Set card background color to white
            elevation: 2, // Add elevation to the card for a shadow effect
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Set margin around the card
            child: ListTile( // ListTile widget to display content inside the card
              title: Text( // Text widget to display the name of the event
                event['name'], // Get the name of the event
                style: TextStyle( // Define text style
                  color: Colors.red, // Set text color to red
                  fontWeight: FontWeight.bold, // Set font weight to bold
                ),
              ),
              subtitle: Text( // Text widget to display the description of the event
                event['description'], // Get the description of the event
                style: TextStyle( // Define text style
                  color: Colors.red, // Set text color to red
                ),
              ),
              trailing: IconButton( // IconButton widget as a trailing button
                icon: Icon(Icons.delete), // Icon for the button
                color: Colors.red, // Set icon color to red
                onPressed: () { // Define onPressed callback when the button is pressed
                  _removeEvent(index); // Call the _removeEvent method to remove the event
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _removeEvent(int index) {
    setState(() { // Update UI when the state changes
      // Remove the event from the events list
      if (index >= 0 && index < widget.events.length) {
        widget.events.removeAt(index);
      }
    });
  }
}
