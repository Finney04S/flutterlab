import 'package:flutter/material.dart';
import 'loan_data_model.dart';

class LoanResultScreen extends StatelessWidget {
  const LoanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerLoanProfile profile = ModalRoute.of(context)!.settings.arguments as CustomerLoanProfile;
    final double dti = profile.existingDebts / profile.salary;
    final bool ageEligible = (profile.age >= 21 && profile.age <= 60);
    final bool dtiEligible = (dti <= 0.6);
    final bool loanEligible = (profile.loanRequested <= profile.salary * 10);

    List<String> notEligibleReasons = [];
    if (!ageEligible) notEligibleReasons.add("Age not between 21 and 60");
    if (!dtiEligible) notEligibleReasons.add("Debt-to-Income ratio exceeds 60%");
    if (!loanEligible) notEligibleReasons.add("Loan requested exceeds 10× salary");

    double approvedLoan = loanEligible ? profile.loanRequested : profile.salary * 10;
    double emi = approvedLoan > 0 ? approvedLoan / 12 : 0;

    final bool isEligible = ageEligible && dtiEligible && loanEligible;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Eligibility Result"),
        backgroundColor: const Color.fromARGB(255, 7, 152, 255),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Name"),
                subtitle: Text(profile.name),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.cake),
                title: Text("Age"),
                subtitle: Text("${profile.age}"),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: Text("Monthly Salary"),
                subtitle: Text("${profile.salary}"),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.money_off),
                title: Text("Existing Debts"),
                subtitle: Text("${profile.existingDebts}"),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.request_page),
                title: Text("Loan Requested"),
                subtitle: Text("${profile.loanRequested}"),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.verified),
                title: Text("Eligibility Result"),
                subtitle: isEligible
                  ? Text(
                      "Eligible\nApproved amount: ${approvedLoan.toStringAsFixed(2)}\nEstimated EMI: ${emi.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      "Not Eligible\nReasons:\n${notEligibleReasons.join('\n')}",
                      style: TextStyle(color: Colors.red),
                    ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => Navigator.pop(context),
              child: Text("Reset & Recalculate"),
            ),
          ],
        ),
      ),
    );
  }
}
