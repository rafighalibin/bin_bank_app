// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bin_bank_app/utility/drawer_user.dart';
import 'package:bin_bank_app/page/history.dart';
import '../model/globals.dart' as global;
import 'package:bin_bank_app/utility/transactions_fetch.dart';

class SearchRangeForm extends StatefulWidget {
  const SearchRangeForm({super.key});

  @override
  State<SearchRangeForm> createState() => _SearchRangeFormState();
}

class Data {
  String feedback;

  Data({required this.feedback});
}

class _SearchRangeFormState extends State<SearchRangeForm> {
  final _formKey = GlobalKey<FormState>();
  final _min = TextEditingController();
  final _max = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion Box'),
      ),
      drawer: const MyDrawerUser(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _min,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Minimal Kilogram',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 56, 130, 214), width: 2.0),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 56, 130, 214)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Minimal Kilogram tidak bisa kosong';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color.fromARGB(255, 56, 130, 214)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _max,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Maksimal Kilogram',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 56, 130, 214), width: 2.0),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 56, 130, 214)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Maksimal Kilogram tidak bisa kosong';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color.fromARGB(255, 56, 130, 214)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryPage()),
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
                            'Kembali',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          global.list = fetchTransactionsRange(
                              global.username, _min.text, _max.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Filter Berhasil diterapkan')),
                          );
                          // sendSuggestion(_min.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HistoryPage(),
                            ),
                          );
                        }
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
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          )),
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
