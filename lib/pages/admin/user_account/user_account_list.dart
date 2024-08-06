import 'dart:convert';
import 'package:cebu_project/pages/admin/user_account/user_form.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user.dart'; // Ensure this file is correctly importing the User class

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];
  List<User> filteredUsers = [];
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  bool isLoading = true;
  bool hasUsers = true; // New state to track if users are available

  @override
  void initState() {
    super.initState();
    fetchUsers();
    searchController.addListener(_search);
  }

  @override
  void dispose() {
    searchController.removeListener(_search);
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('http://localhost/banking_system_db_api/fetch_users.php')); // Update with your actual URL

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          setState(() {
            users = (data['users'] as List).map((user) => User(
              user['fullname'],
              user['email'],
              user['date_created'],
            )).toList();
            filteredUsers = users;
            hasUsers = users.isNotEmpty;
            isLoading = false;
          });
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception('Failed to connect to the server');
      }
    } catch (e) {
      print('Exception: $e');
      setState(() {
        isLoading = false;
        hasUsers = false; // No users due to an error or empty response
      });
    }
  }

  void _search() {
    setState(() {
      searchQuery = searchController.text.toLowerCase();
      filteredUsers = users.where((user) {
        return user.name.toLowerCase().contains(searchQuery) ||
            user.email.toLowerCase().contains(searchQuery) ||
            user.dateCreated.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  void _editUser(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return UserForm(
          user: filteredUsers[index],
          onSave: (updatedUser) {
            setState(() {
              users[users.indexOf(filteredUsers[index])] = updatedUser;
              _search();
            });
          },
        );
      },
    );
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(users.indexOf(filteredUsers[index]));
      _search();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : hasUsers
            ? Column(
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 300,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search here...',
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Full Name',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Date Created',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Edit',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            filteredUsers[index].name,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            filteredUsers[index].email,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            filteredUsers[index].dateCreated,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: PopupMenuButton<String>(
                              onSelected: (String result) {
                                if (result == 'edit') {
                                  _editUser(index);
                                } else if (result == 'delete') {
                                  _deleteUser(index);
                                }
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'edit',
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit, color: Colors.blue),
                                      SizedBox(width: 8),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      SizedBox(width: 8),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        )
            : Center(child: Text('No users found', style: TextStyle(fontSize: 18))),
      ),
    );
  }
}
