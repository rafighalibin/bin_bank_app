import 'package:bin_bank_app/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bin_bank_app/page/login_page.dart';
import '../utility/drawer_public.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password1 = "";
  String password2 = "";
  String? message;
  bool obscurePass1 = true;
  bool obscurePass2 = true;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
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
                  "Registrasi Akun",
                  style: kPoppinsBoldBig,
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.account_circle,
                          ),
                          labelText: "Username ",
                            contentPadding: EdgeInsets.symmetric(
                              vertical : 15,
                              horizontal: size.width * 0.30),border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(color: Colors.white),
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
                            return "Username tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText : obscurePass1,
                        decoration: InputDecoration(
                            labelText: "Password",
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscurePass1 = !obscurePass1;
                                  });
                                },
                                child: obscurePass1
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            password1 = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            password1 = value!;
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
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText : obscurePass2,
                        decoration: InputDecoration(
                          labelText: "Password Confirmation",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscurePass2 = !obscurePass2;
                              });
                            },
                            child: obscurePass2 
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)
                            )
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            password2 = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            password2 = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Konfirmasi Password tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () async {
                        final response = await request.post(
                          'https://bin-bank-pbp.up.railway.app/register/ajax',
                          {
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          });
                        if (response['status'] == true) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Berhasil Register! Silakan Login"),
                            backgroundColor: kBlue,
                          ));
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginPage(),
                              ));
                        } else {
                          setState(() {
                            message = response['message'];
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(message ?? ""),
                            backgroundColor: kLightBlue,
                          ));
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Center(
                        child: Text(
                      message ?? "",
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sudah mempunyai akun?',
                          style: kPoppinsMedium,
                        ),
                        TextButton(
                          child: Text(
                            'Sign In',
                            style: kPoppinsSemiboldLightBlue,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              );
                            },
                          )
                        ],
                      ),
                  ]),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
