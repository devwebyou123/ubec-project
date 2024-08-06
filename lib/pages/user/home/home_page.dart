import 'package:flutter/material.dart';

import '../borrower/borrower_page.dart';
import '../login/login_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String _selectedItem = 'Home';

  void _onSidebarItemTap(String itemName) {
    setState(() {
      _selectedItem = itemName;
    });
  }

  Widget _buildMainContent() {
    switch (_selectedItem) {
      case 'Home':
        return const HomePage();
      case 'Borrower':
        return const BorrowerPage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 327,
            color: Colors.black26,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.black87,
                  height: 237,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/common/assets/images/logo.png',
                          height: 150,
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'MCPMC',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.home),
                            title: const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Home');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: ExpansionTile(
                          backgroundColor: Colors.white70,
                          leading: const Icon(Icons.manage_accounts),
                          title: const Text(
                            'Manage',
                            style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: const Text(
                                'Borrowers',
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                _onSidebarItemTap('Borrowers');
                              },
                            ),
                            ListTile(
                              title: const Text(
                                'Loans',
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                _onSidebarItemTap('Loans');
                              },
                            ),
                            ListTile(
                              title: const Text(
                                'Users',
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                _onSidebarItemTap('Users');
                              },
                            ),
                            ListTile(
                              title: const Text(
                                'Configure',
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                _onSidebarItemTap('Configure');
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: const Text(
                              'Borrower',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Borrower');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.money),
                            title: const Text(
                              'Loan',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Loan');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.collections),
                            title: const Text(
                              'Collectables',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Collectables');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.archive),
                            title: const Text(
                              'Collections',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Collections');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.post_add),
                            title: const Text(
                              'Posting',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Posting');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.summarize),
                            title: const Text(
                              'Summary',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Summary');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ListTile(
                            leading: const Icon(Icons.warning),
                            title: const Text(
                              'Past Due',
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              _onSidebarItemTap('Past Due');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        }, child: const Text("Logout",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/common/assets/images/Background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
