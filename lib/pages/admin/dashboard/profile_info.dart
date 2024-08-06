import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  ProfileInfo({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white, size: 30),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Robert San',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 8.0),
                Text('Administrator'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isDarkMode ? Icons.sunny : Icons.nightlight_round, color: isDarkMode ? Colors.yellow : Colors.blue),
                  onPressed: () {
                    toggleTheme();
                  },
                ),
                SizedBox(width: 16.0),
                PopupMenuButton<String>(
                  icon: Icon(Icons.notifications, color: Colors.amber),
                  onSelected: (String value) {
                    // Handle notification selection if needed
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        child: Container(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              _buildNotificationTile('New loan request from Robert San', 'Amount: \₱100,000'),
                              _buildNotificationTile('Collector Jimjim', 'Submit New Borrower Information'),
                              _buildNotificationTile('Reminder', 'JV Madelo is Over Due.'),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                ),
                SizedBox(width: 16.0),
                PopupMenuButton<String>(
                  icon: Icon(Icons.settings),
                  onSelected: (String value) {
                    if (value == 'Light Mode' && isDarkMode) {
                      toggleTheme();
                    } else if (value == 'Dark Mode' && !isDarkMode) {
                      toggleTheme();
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'Light Mode',
                        child: Text('Light Mode'),
                      ),
                      PopupMenuItem<String>(
                        value: 'Dark Mode',
                        child: Text('Dark Mode'),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ],
        ),
        trailing: TextButton(
          onPressed: () {},
          child: Text('Edit Profile', style: TextStyle(color: Colors.blue)),
        ),
      ),
    );
  }

  Widget _buildNotificationTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.more_vert, size: 20),
      ),
    );
  }

  Widget _buildMessageTile(String sender, String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(sender, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        trailing: Icon(Icons.more_vert, size: 20),
      ),
    );
  }
}
