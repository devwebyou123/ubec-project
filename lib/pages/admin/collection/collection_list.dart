import 'package:flutter/material.dart';

class CollectionItem {
  final String memberId;
  final String memberName;
  final double amountCollected;
  final DateTime dateCollected;

  CollectionItem({
    required this.memberId,
    required this.memberName,
    required this.amountCollected,
    required this.dateCollected,
  });
}

class CollectionListScreen extends StatefulWidget {
  @override
  _CollectionListScreenState createState() => _CollectionListScreenState();
}

class _CollectionListScreenState extends State<CollectionListScreen> {
  List<CollectionItem> collectionItems = [
    CollectionItem(
      memberId: '001',
      memberName: 'Robert San',
      amountCollected: 100.0,
      dateCollected: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection List'),
      ),
      body: Column(
        children: [
          SizedBox(height: 35,),
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: collectionItems.length,
              itemBuilder: (context, index) {
                final item = collectionItems[index];
                return _buildCollectionRow(item, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildHeaderItem('Member ID', flex: 1),
          _buildHeaderItem('Member Name', flex: 2),
          _buildHeaderItem('Amount Collected', flex: 2),
          _buildHeaderItem('Date Collected', flex: 2),
          _buildHeaderItem('Actions', flex: 1),
        ],
      ),
    );
  }

  Widget _buildHeaderItem(String title, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCollectionRow(CollectionItem item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildCollectionItem(item.memberId, flex: 1),
          _buildCollectionItem(item.memberName, flex: 2),
          _buildCollectionItem('₱${item.amountCollected.toStringAsFixed(2)}', flex: 2),
          _buildCollectionItem("${item.dateCollected.toLocal()}".split(' ')[0], flex: 2),
          _buildActionsMenu(index, flex: 1),
        ],
      ),
    );
  }

  Widget _buildCollectionItem(String value, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          value,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildActionsMenu(int index, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'View Details') {
              _viewDetails(index);
            } else if (value == 'Edit') {
              _editItem(index);
            } else if (value == 'Delete') {
              setState(() {
                collectionItems.removeAt(index);
              });
            } else if (value == 'Diminishing Interest') {
              _applyDiminishingInterest(index);
            }
          },
          itemBuilder: (BuildContext context) {
            return {
              'View Details',
              'Edit',
              'Delete',
              'Diminishing Interest'
            }.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  void _viewDetails(int index) {
    // Handle view details
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Details'),
        content: Text('Details for item ${collectionItems[index].memberName}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _editItem(int index) {
    // Handle edit item
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit'),
        content: Text('Edit item ${collectionItems[index].memberName}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _applyDiminishingInterest(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Diminishing Interest'),
        content: Text('Apply diminishing interest to item ${collectionItems[index].memberName}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CollectionListScreen(),
  ));
}
