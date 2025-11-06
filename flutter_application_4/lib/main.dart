import 'package:flutter/material.dart';

void main() => runApp(BudgetCalculatorApp());

class BudgetCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Calculator',
      home: BudgetCalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BudgetCalculatorScreen extends StatefulWidget {
  @override
  _BudgetCalculatorScreenState createState() => _BudgetCalculatorScreenState();
}

class _BudgetCalculatorScreenState extends State<BudgetCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _incomeController = TextEditingController();
  final _rentController = TextEditingController();
  final _foodController = TextEditingController();
  final _transportController = TextEditingController();
  final _otherController = TextEditingController();

  double? _balance;
  String _message = '';
  Color _balanceColor = Colors.green;

  @override
  void dispose() {
    _incomeController.dispose();
    _rentController.dispose();
    _foodController.dispose();
    _transportController.dispose();
    _otherController.dispose();
    super.dispose();
  }

  void _calculateBalance() {
    if (_formKey.currentState!.validate()) {
      final income = double.parse(_incomeController.text);
      final rent = double.tryParse(_rentController.text) ?? 0;
      final food = double.tryParse(_foodController.text) ?? 0;
      final transport = double.tryParse(_transportController.text) ?? 0;
      final other = double.tryParse(_otherController.text) ?? 0;

      final balance = income - (rent + food + transport + other);
      setState(() {
        _balance = balance;
        if (balance < 0) {
          _balanceColor = Colors.red;
          _message = "You are overspending!";
        } else {
          _balanceColor = Colors.green;
          _message = "Great! You're within budget.";
        }
      });
    }
  }

  String? _validateIncome(String? value) {
    if (value == null || value.isEmpty) return "Enter monthly income";
    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) return "Income must be a positive value";
    return null;
  }

  String? _validateExpense(String? value) {
    if (value == null || value.isEmpty) return null;
    final amount = double.tryParse(value);
    if (amount != null && amount < 0) return "Amount cannot be negative";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Budget Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _incomeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Monthly Income"),
                validator: _validateIncome,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _rentController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Rent / EMI"),
                validator: _validateExpense,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _foodController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Food Expenses"),
                validator: _validateExpense,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _transportController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Transport Expenses"),
                validator: _validateExpense,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _otherController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Other Expenses"),
                validator: _validateExpense,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calculateBalance,
                child: Text('Calculate Balance'),
              ),
              SizedBox(height: 30),
              if (_balance != null)
                Column(
                  children: [
                    Text(
                      "Remaining Balance: ₹${_balance!.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 20,
                        color: _balanceColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _message,
                      style: TextStyle(
                        fontSize: 16,
                        color: _balanceColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}