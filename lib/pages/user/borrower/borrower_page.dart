import 'package:flutter/material.dart';

class BorrowerPage extends StatefulWidget {
  const BorrowerPage({super.key});

  @override
  State<BorrowerPage> createState() => _BorrowerPageState();
}

class _BorrowerPageState extends State<BorrowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(top: 0, left: 10),
            child: Text(
              "Borrower's Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 3,
              ),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BorrowerForm(),
          ),
        ),
      ),
    );
  }
}

class BorrowerForm extends StatelessWidget {
  const BorrowerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 70, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Borrower No :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Borrower Number',
                      labelText: 'Enter Borrower Number',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  "Name :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 70),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Lastname',
                      labelText: 'Lastname',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Firstname',
                      labelText: 'Firstname',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Middle name',
                      labelText: 'Middle name',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  "Brgy/Street :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 25),
                SizedBox(
                  width: 933,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Brgy/Street',
                      labelText: 'Brgy/Street',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "Area :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 80),
                SizedBox(
                  width: 380,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Area',
                      labelText: 'Area',
                    ),
                    items: <String>['Area 1', 'Area 2', 'Area 3', 'Area 4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle change
                    },
                  ),
                ),
                const SizedBox(width: 45),
                const Text(
                  "Collector :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 44),
                SizedBox(
                  width: 380,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Collector',
                      labelText: 'Collector',
                    ),
                    items: <String>['Collector 1', 'Collector 2', 'Collector 3', 'Collector 4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle change
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 125),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                      onPressed: (){

                      }, child: const Text('New',
                  style: TextStyle(
                    color: Colors.black
                  ),
                  ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: (){

                    }, child: const Text('Update',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                    onPressed: (){

                    }, child: const Text('Search',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: (){

                    }, child: const Text('Close',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  ),
                ),
                const SizedBox(width: 73),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: (){

                    }, child: const Text('Save',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: (){

                    }, child: const Text('Cancel',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
