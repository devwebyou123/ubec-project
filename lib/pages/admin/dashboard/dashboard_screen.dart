import '../../user/login/login_page.dart';
import '../Collection/diminishing_interest.dart';
import 'package:flutter/material.dart';
import '../Interest/interest_page.dart';
import '../Member/add_new_member.dart';
import '../Member/member_list.dart';
import '../Staff/staff_page.dart';
import '../Collection/collection_list.dart';
import '../user_account/add_user_dialog.dart';
import '../user_account/user_account_list.dart';
import 'profile_info.dart';
import 'stats_card.dart';
import 'request.dart';
import 'graph.dart';
import '../Responsive/responsive.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/common/assets/images/logo.png',
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'MCPMC',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                leading: Icon(Icons.person, color: Colors.amber),
                title: Text('User Account Management'),
                children: <Widget>[
                  ListTile(
                    title: Text('Add New Account'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddUserDialog();
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Manage User Account'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserListScreen()),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.supervised_user_circle_rounded, color: Colors.redAccent),
                title: Text('Borrower'),
                children: <Widget>[
                  ListTile(
                    title: Text('Add New Borrower'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BorrowerApplicationForm ()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Borrower List'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BorrowerListScreen()),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.percent_rounded, color: Colors.deepOrange),
                title: Text('Setup Interest'),
                children: <Widget>[
                  ListTile(
                    title: Text('Add Interest'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InterestListPage()),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.manage_search, color: Colors.blueAccent),
                title: Text('Loan Management'),
                children: <Widget>[
                  ListTile(
                    title: Text('Collection List'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CollectionListScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Diminishing Loan'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoanDetailsScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('View Loan Request list'),
                    onTap: () {},
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.business_outlined, color: Colors.purple),
                title: Text('Coop Management'),
                children: <Widget>[
                  ListTile(
                    title: Text('Staff list'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StaffListScreen()),
                      );
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.grey),
                title: Text('Signout'),
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(35.0),
          child: Responsive(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileInfo(
                  toggleTheme: _toggleTheme,
                  isDarkMode: _isDarkMode,
                ),
                SizedBox(height: 16.0),
                Column(
                  children: [
                    StatsCard(
                      title: 'User',
                      value: '105',
                      icon: Icons.person,
                      iconColor: Colors.blue,
                      titleFontSize: 20.0,
                      valueFontSize: 28.0,
                    ),
                    StatsCard(
                      title: 'Staff',
                      value: '35',
                      icon: Icons.people,
                      iconColor: Colors.deepOrange,
                      titleFontSize: 18.0,
                      valueFontSize: 24.0,
                    ),
                    StatsCard(
                      title: 'Total Loan',
                      value: '500,000',
                      icon: Icons.attach_money,
                      iconColor: Colors.lightGreenAccent,
                      titleFontSize: 18.0,
                      valueFontSize: 24.0,
                    ),
                    StatsCard(
                      title: 'Total Savings',
                      value: '100,500',
                      icon: Icons.account_balance,
                      iconColor: Colors.limeAccent,
                      titleFontSize: 18.0,
                      valueFontSize: 24.0,
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Colors.grey[200],
                  child: Graph(),
                ),
                SizedBox(height: 16.0),
                Column(
                  children: [
                    //ActivityLevel(),
                    SizedBox(height: 16.0),
                    Request(),
                  ],
                ),
              ],
            ),
            tablet: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileInfo(
                  toggleTheme: _toggleTheme,
                  isDarkMode: _isDarkMode,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StatsCard(
                        title: 'User',
                        value: '105',
                        icon: Icons.person,
                      ),
                    ),
                    Expanded(
                      child: StatsCard(
                        title: 'Staff',
                        value: '35',
                        icon: Icons.people,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Colors.grey[200],
                  child: Graph(),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StatsCard(
                        title: 'Loan Request',
                        value: '135',
                        icon: Icons.attach_money,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: StatsCard(
                        title: 'Pending Request',
                        value: '25',
                        icon: Icons.account_balance,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Request(),
              ],
            ),
            desktop: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileInfo(
                  toggleTheme: _toggleTheme,
                  isDarkMode: _isDarkMode,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatsCard(
                      title: 'User',
                      value: '105',
                      icon: Icons.person,
                    ),
                    StatsCard(
                      title: 'Staff',
                      value: '35',
                      icon: Icons.people,
                      iconColor: Colors.greenAccent,
                    ),
                    StatsCard(
                      title: 'Loan Request',
                      value: '135',
                      icon: Icons.request_quote_sharp,
                      iconColor: Colors.green,
                    ),
                    StatsCard(
                      title: 'Pending Request',
                      value: '25',
                      icon: Icons.pending_actions_outlined,
                      iconColor: Colors.deepOrange,
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Colors.grey[200],
                  child: Graph(),
                ),
                SizedBox(height: 16.0),
                Request(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "Yes",
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "No",
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.warning,
            color: Colors.orange,
          ),
          SizedBox(width: 10),
          Text("Confirm to Logout"),
        ],
      ),
      content: Text("Are you sure you want to log out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
