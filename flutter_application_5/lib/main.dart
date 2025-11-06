import 'package:flutter/material.dart';
import 'customer_details_screen.dart';
import 'loan_result_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "Loan Eligibility Calculator",
    initialRoute: '/',
    routes: {
      '/': (context) => CustomerDetailsScreen(),
      '/result': (context) => LoanResultScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
