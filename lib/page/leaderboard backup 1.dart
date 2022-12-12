import 'package:bin_bank_app/main.dart';
import 'package:bin_bank_app/utility/drawer.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<LeaderboardPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  DateTime tanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Leaderboard'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 5, 25),
                    child: const Text("🏆 LEADERBOARD 🏆",
                        style: TextStyle(fontSize: 30)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(maxWidth: 600),
                    margin: const EdgeInsets.fromLTRB(7, 10, 7, 15),
                    child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(3),
                          2: FlexColumnWidth(2)
                        },
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          TableRow(children: [
                            Column(children: const [
                              Text('Rank', style: TextStyle(fontSize: 20.0))
                            ]),
                            Column(children: const [
                              Text('Username', style: TextStyle(fontSize: 20.0))
                            ]),
                            Column(children: const [
                              Text('Total Poin',
                                  style: TextStyle(fontSize: 20.0))
                            ]),
                          ]),
                        ]),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pesan dukungan tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(
                                      child:
                                          Text('Data Berhasil Ditambahkan!')),
                                  const SizedBox(height: 50),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: const MyDrawer());
  }
}
