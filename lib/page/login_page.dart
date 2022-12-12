// ignore_for_file: use_build_context_synchronously

import 'package:bin_bank_app/app_styles.dart';
import 'package:bin_bank_app/main.dart';
import 'package:bin_bank_app/page/homepage.dart';
import 'package:bin_bank_app/utility/drawer_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:bin_bank_app/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  String? message;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      // Menambahkan drawer menu
      drawer: const MyDrawerPublic(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login User",
                  style: kPoppinsBoldBig,
                ),
                Form(
                  key: _loginFormKey,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.account_circle,
                                ),
                                labelText: "Username",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username tidak boleh kosong!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                  ),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                      child: obscureText
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility))),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  password = value!;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  password = value!;
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password tidak boleh kosong!';
                                }
                                return null;
                              },
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () async {
                              final response = await request.login(
                                  'https://bin-bank-pbp.up.railway.app/login/ajax',
                                  {"username": username, "password": password});
                              if (response['status'] == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Berhasil Login! Selamat datang $username"),
                                  backgroundColor: kBlue,
                                ));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Home(title: 'Bin Bank'),
                                    ));
                              } else {
                                setState(() {
                                  message = response['message'];
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(message ?? ""),
                                  backgroundColor: Colors.indigo,
                                ));
                              }
                            },
                            child: Text(
                              "Sign In",
                              style: kPoppinsSemibold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Belum mempunyai akun?',
                                style: kPoppinsMedium,
                              ),
                              TextButton(
                                child: Text(
                                  'Sign Up',
                                  style: kPoppinsSemiboldLightBlue,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
