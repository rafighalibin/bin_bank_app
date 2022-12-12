import 'package:bin_bank_app/utility/drawer_user.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/app_styles.dart';
import 'dart:convert' as convert;
import 'package:bin_bank_app/main.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../utility/update_transaction.dart';
import 'deposit_sampah.dart';

class DepositFormPage extends StatefulWidget {
  const DepositFormPage({super.key});

  @override
  State<DepositFormPage> createState() => _DepositFormPageState();
}

class _DepositFormPageState extends State<DepositFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _branchName = "branch_1";
  int _amountKg = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      drawer: const MyDrawerUser(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Donation',
                      style: kPoppinsBold.copyWith(
                        fontSize: 22,
                        color: kDarkBlue,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contribute to BinBank',
                      style: kPoppinsRegular.copyWith(
                        fontSize: 16,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 2121",
                      labelText: "Amount (KG)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        if (value == null || value.isEmpty) {
                          _amountKg = 0;
                        } else {
                          _amountKg = int.parse(value);
                        }
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        if (value == null || value.isEmpty) {
                          _amountKg = 0;
                        } else {
                          _amountKg = int.parse(value);
                        }
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'amount tidak boleh kosong!';
                      }
                      if (int.parse(value) == 0) {
                        return 'amount tidak boleh nol!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: _branchName,
                    hint: const Text("Pilih Jenis"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'branch_1',
                        child: Text('branch_1'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'branch_2',
                        child: Text('branch_2'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'branch_3',
                        child: Text('branch_3'),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        _branchName = value ?? "";
                      });
                    },
                  ),
                ),
                TextButton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Send Message",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () async {
                      addTransaction(
                          request.jsonData['username'], _amountKg, _branchName);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const MyDepositPage()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
