import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BorrowerApplicationForm extends StatefulWidget {
  @override
  _BorrowerApplicationFormState createState() => _BorrowerApplicationFormState();
}

class _BorrowerApplicationFormState extends State<BorrowerApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController desiredLoanAmountController = TextEditingController();
  final TextEditingController annualIncomeController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController municipalController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController postalController = TextEditingController();
  final TextEditingController presentEmployerController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController grossMonthlyIncomeController = TextEditingController();
  final TextEditingController monthlyRentController = TextEditingController();

  // State variables
  String? loanPurpose;
  String? maritalStatus;
  String? addressDuration;
  String? experienceYears;
  bool consent1 = false;
  bool consent2 = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now())
      setState(() {
        birthDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrower Application Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: desiredLoanAmountController,
                        decoration: InputDecoration(
                          labelText: 'Desired Loan Amount ₱',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: annualIncomeController,
                        decoration: InputDecoration(
                          labelText: 'Annual Income ₱',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Loan will be used for
                Text('Loan Will be used for'),
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    for (var purpose in [
                      'Business Launching',
                      'Home Improvement',
                      'Education',
                      'House Buying',
                      'Investment',
                      'Other'
                    ])
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 16,
                        child: RadioListTile(
                          title: Text(purpose),
                          value: purpose,
                          groupValue: loanPurpose,
                          onChanged: (value) {
                            setState(() {
                              loanPurpose = value.toString();
                            });
                          },
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Contact Information
                Text('Contact Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: middleNameController,
                        decoration: InputDecoration(
                          labelText: 'Middle Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: birthDateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    labelText: 'Birth Date',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Text('Marital Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Text('Single'),
                        value: 'Single',
                        groupValue: maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            maritalStatus = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text('Married'),
                        value: 'Married',
                        groupValue: maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            maritalStatus = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text('Other'),
                        value: 'Other',
                        groupValue: maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            maritalStatus = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: streetController,
                        decoration: InputDecoration(
                          labelText: 'Street / Barangay',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: municipalController,
                        decoration: InputDecoration(
                          labelText: 'Municipal',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: provinceController,
                        decoration: InputDecoration(
                          labelText: 'Province',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: postalController,
                  decoration: InputDecoration(
                    labelText: 'Postal / Zip Code',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Text('How long have you lived in your given address?'),
                Column(
                  children: [
                    RadioListTile(
                      title: Text('0-1 Year'),
                      value: '0-1 Year',
                      groupValue: addressDuration,
                      onChanged: (value) {
                        setState(() {
                          addressDuration = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('1-2 Years'),
                      value: '1-2 Years',
                      groupValue: addressDuration,
                      onChanged: (value) {
                        setState(() {
                          addressDuration = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('3-4 Years'),
                      value: '3-4 Years',
                      groupValue: addressDuration,
                      onChanged: (value) {
                        setState(() {
                          addressDuration = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('5+ Years'),
                      value: '5+ Years',
                      groupValue: addressDuration,
                      onChanged: (value) {
                        setState(() {
                          addressDuration = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Employment Information
                Text('Employment Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: presentEmployerController,
                        decoration: InputDecoration(
                          labelText: 'Complete Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: occupationController,
                        decoration: InputDecoration(
                          labelText: 'Occupation',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text('Years of experience', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Column(
                  children: [
                    RadioListTile(
                      title: Text('0-1 Year'),
                      value: '0-1 Year',
                      groupValue: experienceYears,
                      onChanged: (value) {
                        setState(() {
                          experienceYears = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('1-2 Years'),
                      value: '1-2 Years',
                      groupValue: experienceYears,
                      onChanged: (value) {
                        setState(() {
                          experienceYears = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('3-4 Years'),
                      value: '3-4 Years',
                      groupValue: experienceYears,
                      onChanged: (value) {
                        setState(() {
                          experienceYears = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('5+ Years'),
                      value: '5+ Years',
                      groupValue: experienceYears,
                      onChanged: (value) {
                        setState(() {
                          experienceYears = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: grossMonthlyIncomeController,
                        decoration: InputDecoration(
                          labelText: 'Gross monthly income',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: monthlyRentController,
                        decoration: InputDecoration(
                          labelText: 'Monthly Interest',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Consent
                Text('Consent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 10,),
                Text(
                  'I authorize prospective Credit Grantors/Lending/MCPMC to obtain personal and credit information about me from my employer and credit bureau, or credit reporting agency, any person who has or may have any financial dealing with me, or from any references I have provided. This information, as well as that provided by me in the application, will be referred to in connection with this lease and any other relationships we may establish from time to time. Any personal and credit information obtained may be disclosed from time to time to other lenders, credit bureaus or other credit reporting agencies.',
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  children: [
                    Text('YES'),
                    Checkbox(
                      value: consent1,
                      onChanged: (newValue) {
                        setState(() {
                          consent1 = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  'I hereby agree that the information given is true, accurate and complete as of the date of this application submission.',
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  children: [
                    Text('YES'),
                    Checkbox(
                      value: consent2,
                      onChanged: (newValue) {
                        setState(() {
                          consent2 = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                    child: Text('Send Application Now'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
