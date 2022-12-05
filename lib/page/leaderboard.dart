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
  int nominal = 0;
  String? jenis;
  DateTime tanggal = DateTime.now();
  List<String> jenis_pilihan = ['Pemasukan', 'Pengeluaran'];

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
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
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
                        return 'Nama lengkap tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      int? number = int.tryParse(value!);
                      setState(() {
                        if (number == null) {
                          nominal = 0;
                        } else {
                          nominal = number;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      int? number = int.tryParse(value!);
                      setState(() {
                        if (number == null) {
                          nominal = 0;
                        } else {
                          nominal = number;
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButton(
                    value: jenis,
                    hint: const Text("Pilih Jenis"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: jenis_pilihan.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenis = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                        ).then((value) {
                          setState(() {
                            tanggal = value!;
                          });
                        });
                      },
                      child: const Text("Pilih Tanggal")),
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
