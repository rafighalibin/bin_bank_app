// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bin_bank_app/page/deposit_detail.dart';
import 'package:bin_bank_app/page/deposit_form.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/utility/drawer_user.dart';

import 'package:bin_bank_app/utility/transactions_fetch.dart';
import 'package:bin_bank_app/utility/update_transaction.dart';
import 'package:intl/intl.dart';
import '../model/transactions.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../model/globals.dart' as global;

const List<String> branchOptions = <String>['One', 'Two', 'Three', 'Four'];

class MyDepositPage extends StatefulWidget {
  const MyDepositPage({Key? key}) : super(key: key);

  @override
  State<MyDepositPage> createState() => _MyDepositPageState();
}

class _MyDepositPageState extends State<MyDepositPage> {
  final _formKey = GlobalKey<FormState>();
  int _amountKg = 0;
  String _branchName = "";
  String dropdownValue = "branch_1";

  Future<List<Transactions>> list = fetchTransactions1(global.username);
  String lastcall = "fetchTransactions";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    global.username = request.jsonData['username'];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Donate'),
          ],
        ),
      ),
      drawer: const MyDrawerUser(),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 30.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DepositFormPage()),
                );
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 24,
                  width: 164,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color.fromARGB(255, 6, 72, 254),
                        Color.fromARGB(255, 0, 195, 255),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Text(
                    'Add Transactions',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: getList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data.length == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Oops, Belum ada Transaksi",
                      style: TextStyle(
                          color: Color.fromARGB(255, 6, 72, 254),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                            subtitle: Column(
                              children: [
                                  Text(
                                      '${snapshot.data![index].fields.amountKg}Kg (${DateFormat('yyyy-MM-dd kk:mm').format(snapshot.data![index].fields.date)})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'Cabang: ${snapshot.data![index].fields.branchName}'),
                                  Text(snapshot.data![index].fields.isFinished ? 'Berhasil':'Sedang Berlangsung',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DepositDetails(
                                        transactionItem:
                                            snapshot.data![index])),
                              );
                            }),
                      ],
                    ),
                  ),
                );
              }
            }
          }),
    );
  }

  Future<List<Transactions>> getList() {
    if (global.counter == 0) {
      return fetchTransactions1(global.username);
    }
    return list;
  }
}
