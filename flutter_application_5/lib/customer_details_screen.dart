import 'package:flutter/material.dart';
import 'loan_data_model.dart';
class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key});
  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}
class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();
  final _debtsController = TextEditingController();
  final _loanController = TextEditingController();
  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _ageController.clear();
    _salaryController.clear();
    _debtsController.clear();
    _loanController.clear();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Details Form"),
        backgroundColor: const Color.fromARGB(255, 7, 164, 255),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter your Name";
                    }
                    if (value.length < 3) {
                      return "Name too short";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Age";
                    }
                    int? age = int.tryParse(value);
                    if (age == null || age < 18 || age > 65) {
                      return "Enter valid age (18–65)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18),
                TextFormField(
                  controller: _salaryController,
                  decoration: InputDecoration(
                    labelText: "Monthly Salary",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Monthly Salary";
                    }
                    double? sal = double.tryParse(value);
                    if (sal == null || sal < 5000) {
                      return "Enter realistic salary";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18),
                TextFormField(
                  controller: _debtsController,
                  decoration: InputDecoration(
                    labelText: "Existing EMI/Debts",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter existing EMIs/Debts";
                    }
                    double? d = double.tryParse(value);
                    if (d == null || d < 0) {
                      return "Enter valid debts";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18),
                TextFormField(
                  controller: _loanController,
                  decoration: InputDecoration(
                    labelText: "Loan Amount Requested",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter loan amount";
                    }
                    double? amt = double.tryParse(value);
                    if (amt == null || amt < 1000) {
                      return "Enter realistic amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 97, 251, 102)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final profile = CustomerLoanProfile(
                              name: _nameController.text,
                              age: int.parse(_ageController.text),
                              salary: double.parse(_salaryController.text),
                              existingDebts: double.parse(_debtsController.text),
                              loanRequested: double.parse(_loanController.text),
                            );
                            Navigator.pushNamed(context, '/result', arguments: profile);
                          }
                        },
                        child: Text("Check Eligibility"),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 125, 116)),
                        onPressed: _resetForm,
                        child: Text("Reset"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
