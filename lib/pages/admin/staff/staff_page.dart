import 'package:flutter/material.dart';

class Staff {
  String fullName;
  String role;
  String address;

  Staff({
    required this.fullName,
    required this.role,
    required this.address,
  });
}

class StaffListScreen extends StatefulWidget {
  @override
  _StaffListScreenState createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  List<Staff> staffMembers = [
    Staff(
      fullName: 'Robert San',
      role: 'Developer',
      address: 'Marihatag, Surigao del Sur',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff List'),
      ),
      body: Column(
        children: [
          SizedBox(height: 35),
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: staffMembers.length,
              itemBuilder: (context, index) {
                final staff = staffMembers[index];
                return _buildStaffRow(staff);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStaffDialog(),
        child: Icon(Icons.add),
        tooltip: 'Add Staff',
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildHeaderItem('Full Name', flex: 2),
          _buildHeaderItem('Role', flex: 1),
          _buildHeaderItem('Address', flex: 3),
          _buildHeaderItem('Action', flex: 1),
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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildStaffRow(Staff staff) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildStaffItem(staff.fullName, flex: 2),
          _buildStaffItem(staff.role, flex: 1),
          _buildStaffItem(staff.address, flex: 3),
          _buildActionsMenu(flex: 1),
        ],
      ),
    );
  }

  Widget _buildStaffItem(String value, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Arial',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildActionsMenu({required int flex}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'View Details') {
              _viewDetails();
            } else if (value == 'Edit') {
              _editStaff();
            } else if (value == 'Delete') {
              _deleteStaff();
            }
          },
          itemBuilder: (BuildContext context) {
            return {
              'View Details',
              'Edit',
              'Delete',
            }.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(
                  choice,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Arial',
                  ),
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  void _viewDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('View Details'),
        content: Text('Details of the selected staff member'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _editStaff() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Staff'),
        content: Text('Edit the selected staff member'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _deleteStaff() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Staff'),
        content: Text('Are you sure you want to delete this staff member?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {

              });
              Navigator.of(context).pop();
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddStaffDialog() {
    final _fullNameController = TextEditingController();
    final _roleController = TextEditingController();
    final _addressController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Staff'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Arial',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(
                labelText: 'Role',
              ),
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Arial',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                staffMembers.add(
                  Staff(
                    fullName: _fullNameController.text,
                    role: _roleController.text,
                    address: _addressController.text,
                  ),
                );
              });
              Navigator.of(context).pop();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
