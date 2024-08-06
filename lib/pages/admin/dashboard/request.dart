import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan Request',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            buildListTile('Jv Madelo', '45,000', context),
            buildListTile('Jim Pajenado', '38,000', context),
            buildListTile('Roberto Sanchez', '35,000', context),
            buildListTile('John Rey Nasayao', '75,000', context),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, String amount, BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.visibility),
                  title: Text('View'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      subtitle: Text('Amount: $amount'),
    );
  }
}
