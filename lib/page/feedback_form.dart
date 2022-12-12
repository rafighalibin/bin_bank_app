import 'package:bin_bank_app/utility/drawer_user.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/app_styles.dart';
import 'dart:convert' as convert;
import 'package:bin_bank_app/main.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String subject = "";
  String feedback = "";

  void _initFeedback(request) async {
    var data = convert.jsonEncode(
      <String, dynamic>{
        "subject": subject,
        "feedback": feedback,
      },
    );

    //final response = await http.post("http://127.0.0.1:8000/post-feedback-json/",
    //headers: {"Content-Type": "application/json"}, body: data);

    final response = await request.postJson(
        "https://bin-bank-pbp.up.railway.app/post-feedback-json/", data);
    if (response['message'] == 'SUCCESS') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Feedback berhasil tersimpan"),
      ));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'Bin Bank',
              )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Gagal!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
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
                  child: Text('Feedback',
                      style: kPoppinsBold.copyWith(
                        fontSize: 22,
                        color: kDarkBlue,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Share your experience in using Bin Bank to the community and help us to improve!',
                      style: kPoppinsRegular.copyWith(
                        fontSize: 16,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Complaint",
                      labelText: "Subject",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        subject = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        subject = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Write your message!",
                      labelText: "Message",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        feedback = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        feedback = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty!';
                      }
                      return null;
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
                      _initFeedback(request);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
