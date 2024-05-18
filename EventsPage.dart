import 'package:flutter/material.dart'; // Import the Flutter Material package
import 'AddedEventsPage.dart'; // Import the AddedEventsPage

class EventsPage extends StatefulWidget {
  EventsPage({Key? key}) : super(key: key); // Constructor for EventsPage widget

  @override
  _EventsPageState createState() => _EventsPageState(); // Create state for EventsPage
}

class _EventsPageState extends State<EventsPage> {
  final List<Map<String, dynamic>> events = [
    {
      'name': 'Event 1',
      'date': 'May 20, 2024',
      'location': 'Venue 1',
      'description': 'Description of Event 1',
    },
    {
      'name': 'Event 2',
      'date': 'June 5, 2024',
      'location': 'Venue 2',
      'description': 'Description of Event 2',
    },
    {
      'name': 'Event 3',
      'date': 'July 12, 2024',
      'location': 'Venue 3',
      'description': 'Description of Event 3',
    },
    // Add more events if you like
  ];

  final List<Map<String, dynamic>> addedEvents = []; // List to hold added events

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget provides a basic structure for the screen
      appBar: AppBar( // AppBar widget for the top app bar
        title: const Text('Events'), // Set the title of the app bar
        backgroundColor: Colors.red, // Set app bar background color to red
      ),
      body: ListView.builder( // ListView.builder to display a list of events
        itemCount: events.length, // Set the number of items in the list
        itemBuilder: (context, index) { // Builder function to build each item in the list
          final event = events[index]; // Get the event at the current index
          return Card( // Card widget to display each event as a card
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Set margin around the card
            elevation: 2, // Add elevation for a card-like effect
            child: ListTile( // ListTile widget to display content inside the card
              title: Text( // Text widget to display the name of the event
                event['name'], // Get the name of the event
                style: TextStyle( // Define text style
                  color: Colors.red, // Set text color to red
                  fontWeight: FontWeight.bold, // Set font weight to bold
                  fontSize: 18, // Set font size
                ),
              ),
              subtitle: Column( // Column widget to display event details
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                children: [
                  Text( // Text widget to display event date
                    'Date: ${event['date']}', // Get the date of the event
                    style: TextStyle( // Define text style
                      color: Colors.black87, // Set text color to black
                      fontSize: 16, // Set font size
                    ),
                  ),
                  Text( // Text widget to display event location
                    'Location: ${event['location']}', // Get the location of the event
                    style: TextStyle( // Define text style
                      color: Colors.black87, // Set text color to black
                      fontSize: 16, // Set font size
                    ),
                  ),
                  Text( // Text widget to display event description
                    'Description: ${event['description']}', // Get the description of the event
                    style: TextStyle( // Define text style
                      color: Colors.black87, // Set text color to black
                      fontSize: 16, // Set font size
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton( // ElevatedButton widget as a trailing button
                onPressed: () { // Define onPressed callback when the button is pressed
                  setState(() { // Update UI when the state changes
                    addedEvents.add(event); // Add the event to the addedEvents list
                  });
                  ScaffoldMessenger.of(context).showSnackBar( // Show a SnackBar when the button is pressed
                    SnackBar( // SnackBar widget to display a message at the bottom of the screen
                      content: Text('${event['name']} added to your events.'), // Display a message
                    ),
                  );
                },
                child: Text('Join Event'), // Button text
                style: ElevatedButton.styleFrom( // Define button style
                  backgroundColor: Colors.red, // Set button background color to red
                  textStyle: TextStyle( // Define text style for the button
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton( // FloatingActionButton widget for adding events
        onPressed: () { // Define onPressed callback when the button is pressed
          Navigator.push( // Navigate to the AddedEventsPage when the button is pressed
            context,
            MaterialPageRoute( // MaterialPageRoute for navigation
              builder: (context) => AddedEventsPage(events: addedEvents), // Pass the addedEvents list
            ),
          );
        },
        backgroundColor: Colors.red, // Set button background color to red
        child: Icon(Icons.event), // Icon for the button
      ),
    );
  }
}
