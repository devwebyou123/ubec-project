import 'package:flutter/material.dart';

class Interest {
  String name;
  DateTime dateCreated;

  Interest({required this.name, required this.dateCreated});
}

class InterestListPage extends StatefulWidget {
  @override
  _InterestListPageState createState() => _InterestListPageState();
}

class _InterestListPageState extends State<InterestListPage> {
  List<Interest> interests = [];

  void _showAddInterestDialog([Interest? interest]) {
    final nameController = TextEditingController(text: interest?.name ?? '');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(interest == null ? 'Add Interest' : 'Edit Interest'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Interest Name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (interest == null) {
                  setState(() {
                    interests.add(Interest(
                      name: nameController.text,
                      dateCreated: DateTime.now(),
                    ));
                  });
                } else {
                  setState(() {
                    interest.name = nameController.text;
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleAction(String action, Interest interest) {
    if (action == 'Edit') {
      _showAddInterestDialog(interest);
    } else if (action == 'Delete') {
      setState(() {
        interests.remove(interest);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interest List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1.5),
                  2: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
                    ),
                    children: [
                      Center(
                        child: Text('Interest', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      ),
                      Center(
                        child: Text('Date Created', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      ),
                      Center(
                        child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      ),
                    ],
                  ),
                  ...interests.map((interest) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text(interest.name, style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text('${interest.dateCreated.toLocal()}'.split(' ')[0], style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: PopupMenuButton<String>(
                              onSelected: (String value) {
                                _handleAction(value, interest);
                              },
                              itemBuilder: (BuildContext context) {
                                return {'Edit', 'Delete'}.map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                              icon: Icon(Icons.more_vert),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddInterestDialog(),
        child: Icon(Icons.add),
        tooltip: 'Add Interest',
      ),
    );
  }
}
