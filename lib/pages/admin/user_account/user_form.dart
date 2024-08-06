import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'user.dart';

class UserForm extends StatefulWidget {
  final User user;
  final Function(User) onSave;

  UserForm({required this.user, required this.onSave});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _username;
  late String _dateCreated;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _username = widget.user.email;
    _dateCreated = widget.user.dateCreated;
  }

  Future<void> _updateUser() async {
    final apiUrl = 'http://localhost/banking_system_db_api/update_user.php'; // Your API URL
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'name': _name,
          'email': _username,
          'dateCreated': _dateCreated,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          widget.onSave(User(_name, _username, _dateCreated));
          Navigator.of(context).pop();
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception('Failed to update user');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Edit Account User'),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _name,
              decoration: InputDecoration(labelText: 'Full Name'),
              onSaved: (value) {
                _name = value ?? '';
              },
            ),
            TextFormField(
              initialValue: _username,
              decoration: InputDecoration(labelText: 'Username'),
              readOnly: true, // Make username read-only
              onSaved: (value) {
                _username = value ?? '';
              },
            ),
            TextFormField(
              initialValue: _dateCreated,
              decoration: InputDecoration(labelText: 'Date Created'),
              onSaved: (value) {
                _dateCreated = value ?? '';
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              _updateUser();
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
