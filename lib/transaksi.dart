import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  List<Transaction> transactions = [
    Transaction(
        title: 'Es Teller',
        amount: 150000,
        isChecked: false,
        image: 'assets/images/es-teler-3.jpg'),
    Transaction(
        title: 'Nasi Sate',
        amount: 200000,
        isChecked: false,
        image: 'assets/images/Bakso-Wide.jpg'),
    Transaction(
        title: 'Es Cincau',
        amount: 100000,
        isChecked: false,
        image: 'assets/images/059805300_1556518803-es_cincau_susu.jpg'),
    Transaction(
        title: 'Es Teler Durian',
        amount: 100000,
        isChecked: false,
        image: 'assets/images/1218541-1000xauto-resep-es-teler.jpg'),
  ];

  int getTotalTransaction() {
    int total = 0;
    for (var transaction in transactions) {
      if (transaction.isChecked) {
        total += transaction.amount;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi Anda'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                transactions[index].image,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(transactions[index].title),
            subtitle: Text('Rp ${transactions[index].amount.toString()}'),
            trailing: Checkbox(
              value: transactions[index].isChecked,
              onChanged: (bool? value) {
                setState(() {
                  transactions[index].isChecked = value!;
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Transaksi:',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Rp ${getTotalTransaction().toString()}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Transaction {
  final String title;
  final int amount;
  bool isChecked;
  final String image;

  Transaction(
      {required this.title,
      required this.amount,
      required this.isChecked,
      required this.image});
}
