import 'package:flutter/material.dart';

import '../Collection/diminishing_interest.dart';

class Borrower {
  String id;
  String name;
  double loanAmount;
  DateTime dateOfBirth;
  String mobileNumber;
  String address;

  Borrower({
    required this.id,
    required this.name,
    required this.loanAmount,
    required this.dateOfBirth,
    required this.mobileNumber,
    required this.address,
  });
}

class BorrowerListScreen extends StatefulWidget {
  @override
  _BorrowerListScreenState createState() => _BorrowerListScreenState();
}

class _BorrowerListScreenState extends State<BorrowerListScreen> {
  List<Borrower> borrowers = [
    Borrower(
      id: '1',
      name: 'Jv Madelo',
      loanAmount: 50000.00,
      dateOfBirth: DateTime(1994, 5, 12),
      mobileNumber: '09123456789',
      address: 'Tandag City, Surigao del Sur',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrower List'),
      ),
      body: Column(
        children: [
          SizedBox(height: 35),
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: borrowers.length,
              itemBuilder: (context, index) {
                final borrower = borrowers[index];
                return _buildBorrowerRow(borrower, index);
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
          _buildHeaderItem('Borrower ID', flex: 1),
          _buildHeaderItem('Name', flex: 2),
          _buildHeaderItem('Loan Amount', flex: 2),
          _buildHeaderItem('Date of Birth', flex: 2),
          _buildHeaderItem('Mobile Number', flex: 2),
          _buildHeaderItem('Address', flex: 3),
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

  Widget _buildBorrowerRow(Borrower borrower, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildBorrowerItem(borrower.id, flex: 1),
          _buildBorrowerItem(borrower.name, flex: 2),
          _buildBorrowerItem(
              '\₱${borrower.loanAmount.toStringAsFixed(2)}', flex: 2),
          _buildBorrowerItem(
              "${borrower.dateOfBirth.toLocal()}".split(' ')[0], flex: 2),
          _buildBorrowerItem(borrower.mobileNumber, flex: 2),
          _buildBorrowerItem(borrower.address, flex: 3),
          _buildActionsMenu(index, flex: 1),
        ],
      ),
    );
  }

  Widget _buildBorrowerItem(String value, {required int flex}) {
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
            if (value == 'View More Information') {
              _viewMoreInformation(index);
            } else if (value == 'Edit') {
              _editBorrower(index);
            } else if (value == 'Delete') {
              setState(() {
                borrowers.removeAt(index);
              });
            } else if (value == 'Balance') {
              _viewBalance(index);
            }
          },
          itemBuilder: (BuildContext context) {
            return {
              'View More Information',
              'Edit',
              'Delete',
              'Balance'
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

  void _viewMoreInformation(int index) {
    // Handle view more information
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('More Information'),
            content: Text(
                'More information for borrower ${borrowers[index].name}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  void _editBorrower(int index) {
    // Handle edit borrower
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Edit Borrower'),
            content: Text('Edit borrower ${borrowers[index].name}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  void _viewBalance(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoanDetailsScreen(),
      ),
    );
  }
}

