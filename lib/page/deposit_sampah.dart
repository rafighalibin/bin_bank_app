import 'package:bin_bank_app/utility/drawer.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/utility/transactions_fetch.dart';
import 'package:bin_bank_app/page/deposit_detail.dart';

class MyDepositPage extends StatefulWidget {
  const MyDepositPage({super.key});

  @override
  State<MyDepositPage> createState() => _MyDepositPageState();
}

class _MyDepositPageState extends State<MyDepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Deposit Sampah")),
        drawer: const MyDrawer(),
        body: FutureBuilder(
            future: fetchTransactions(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada item di MyWatchList :(",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
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
                          boxShadow: [
                            BoxShadow(
                                color: snapshot.data![index].fields.isFinished
                                    ? Colors.green
                                    : Colors.red,
                                blurRadius: 2.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              subtitle: Column(
                                children: [
                                  Text('Amount : ${snapshot.data![index].fields.amountKg}'),
                                  Text('Date: ${snapshot.data![index].fields.date}'),
                                  Text('Branch: ${snapshot.data![index].fields.branchName}'),
                                  Text('Status: ${snapshot.data![index].fields.isFinished ? "Yes": " No"}'),
                                ],
                              ),
                              trailing: Column(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                    MaterialStateProperty.resolveWith<
                                        Color>((Set<MaterialState> states) {
                                      if (snapshot.data![index].fields.isFinished) {
                                        return Colors.green;
                                      }
                                      return Colors.red;
                                    }),
                                    value: snapshot.data![index].fields.isFinished,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].fields.isFinished =
                                        value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DepositDetails(
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
            }));
  }
}
