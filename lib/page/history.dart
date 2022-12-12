// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bin_bank_app/utility/drawer_user.dart';
import 'package:bin_bank_app/utility/search_branch_form.dart';
import 'package:bin_bank_app/utility/search_range_form.dart';
import 'package:bin_bank_app/utility/transactions_fetch.dart';
import 'package:bin_bank_app/utility/update_transaction.dart';
import 'package:intl/intl.dart';
import '../model/transactions.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../model/globals.dart' as global;

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

Future<List<Transactions>> list = fetchTransactions1(global.username);

class _HistoryPageState extends State<HistoryPage> {
  String lastcall = "fetchTransactions";
  Future<List<Transactions>> list = global.list;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    global.username = request.jsonData['username'];
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('History'),
            ],
          ),
        ),
        drawer: const MyDrawerUser(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 30),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text("Cari Transaksi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Color.fromARGB(255, 49, 49, 49))),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            global.counter++;
                            global.list = fetchTransactionsOngoing(
                                request.jsonData['username']);
                            setState(() {
                              list = fetchTransactionsOngoing(
                                  request.jsonData['username']);
                              lastcall = "fetchTransactionsOngoing";
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Filter Berhasil diterapkan')),
                              );
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Text(
                                'Sedang Berlangsung',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        TextButton(
                          onPressed: () {
                            global.counter++;
                            global.list = fetchTransactionsSucces(
                                request.jsonData['username']);
                            setState(() {
                              list = fetchTransactionsSucces(
                                  request.jsonData['username']);
                              lastcall = "fetchTransactionsSucces";
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Filter Berhasil diterapkan')),
                              );
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Text(
                                'Berhasil',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            global.counter++;
                            global.list = fetchTransactions1(
                                request.jsonData['username']);
                            setState(() {
                              list = fetchTransactions1(
                                  request.jsonData['username']);
                              lastcall = "fetchTransactions";
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Filter Berhasil diterapkan')),
                              );
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Text(
                                'Semua',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchRangeForm()),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Text(
                                'Berdasarkan Berat',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchBranchForm()),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Text(
                                'Berdasarkan Cabang',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: FutureBuilder(
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
                                "Oops, nggak ada transaksi yang sesuai filter",
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
                                        if (snapshot.data![index].fields
                                                .isFinished !=
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
                                                  request.jsonData['username'],
                                                  snapshot.data![index].pk);
                                              if (lastcall ==
                                                  "fetchTransactions") {
                                                list = fetchTransactions1(
                                                    request
                                                        .jsonData['username']);
                                              } else if (lastcall ==
                                                  "fetchTransactionsOngoing") {
                                                list = fetchTransactionsOngoing(
                                                    request
                                                        .jsonData['username']);
                                              } else if (lastcall ==
                                                  "fetchTransactionsSucces") {
                                                list = fetchTransactionsSucces(
                                                    request
                                                        .jsonData['username']);
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
                                                      Color.fromARGB(
                                                          255, 6, 72, 254),
                                                      Color.fromARGB(
                                                          255, 0, 195, 255),
                                                    ],
                                                    tileMode: TileMode.mirror,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(40)),
                                                ),
                                                child: Text(
                                                  'Selesaikan Transaksi',
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                    }))
          ],
        ));
  }

  Future<List<Transactions>> getList() {
    if (global.counter == 0) {
      return fetchTransactions1(global.username);
    }
    return list;
  }
}
