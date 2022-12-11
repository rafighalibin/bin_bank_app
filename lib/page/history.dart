// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bin_bank_app/utility/drawer.dart';
import 'package:bin_bank_app/utility/transactions_fetch.dart';
import 'package:bin_bank_app/utility/update_transaction.dart';
import 'package:intl/intl.dart';
import '../model/transactions.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String lastcall = "fetchTransactions";
  static String username = "maradona";

  Future<List<Transactions>> list = fetchTransactions1(username);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('History'),
            ],
          ),
        ),
        drawer: const MyDrawer(),
        floatingActionButton: Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  list = fetchTransactionsOngoing(username);
                  lastcall = "fetchTransactionsOngoing";
                });
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
                    'Sedang Berlangsung',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  list = fetchTransactionsSucces(username);
                  lastcall = "fetchTransactionsSucces";
                });
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
                    'Berhasil',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  list = fetchTransactions1(username);
                  lastcall = "fetchTransactions";
                });
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
                    'Semua',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
        body: FutureBuilder(
            future: list,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Oops, nggak ada transaksi yang sesuai filter",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
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
                                if (snapshot.data![index].fields.isFinished !=
                                    true) ...[
                                  Text(
                                      '${snapshot.data![index].fields.amountKg}Kg (${DateFormat('yyyy-MM-dd kk:mm').format(snapshot.data![index].fields.date)})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'Cabang: ${snapshot.data![index].fields.branchName}'),
                                  Text('Sedang Berlangsung',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextButton(
                                    onPressed: () {
                                      updateTransaction(
                                          username, snapshot.data![index].pk);
                                      if (lastcall == "fetchTransactions") {
                                        list = fetchTransactions1(username);
                                      } else if (lastcall ==
                                          "fetchTransactionsOngoing") {
                                        list =
                                            fetchTransactionsOngoing(username);
                                      } else if (lastcall ==
                                          "fetchTransactionsSucces") {
                                        list =
                                            fetchTransactionsSucces(username);
                                      }
                                      setState(() {});
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40)),
                                        ),
                                        child: Text(
                                          'Selesaikan Transaksi',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ] else ...[
                                  Text(
                                      '${snapshot.data![index].fields.amountKg}Kg (${DateFormat('yyyy-MM-dd kk:mm').format(snapshot.data![index].fields.date)})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'Cabang: ${snapshot.data![index].fields.branchName}'),
                                  Text('Berhasil',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
