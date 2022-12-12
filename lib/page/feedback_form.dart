import 'dart:convert';
import 'package:bin_bank_app/utility/drawer_user.dart';
import 'package:bin_bank_app/utility/drawer_public.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/app_styles.dart';
import 'dart:convert' as convert;
import 'package:bin_bank_app/main.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:bin_bank_app/page/login_page.dart';
import 'package:http/http.dart' as http;

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
        "user": request.jsonData['username'],
        "subject": subject,
        "feedback": feedback,
      },
    );

    //final response = await http.post("http://127.0.0.1:8000/post-feedback-json/",
    //headers: {"Content-Type": "application/json"}, body: data);

    var url = Uri.parse('http://127.0.0.1:8000/post-feedback-json/');
    Map<String, String> requestBody = <String, String>{
      "user": request.jsonData['username'],
      "subject": subject,
      "feedback": feedback,
    };
    var request1 = http.MultipartRequest('POST', url)
      ..fields.addAll(requestBody);
    var response = await request1.send();
    final respStr = await response.stream.bytesToString();
    var encoded = json.decode(respStr);

    if (encoded['message'] == 'SUCCESS') {
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
    if (request.jsonData['username'] == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Feedback Form"),
        ),
        drawer: const MyDrawerPublic(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Sorry, you must login first!",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color.fromARGB(178, 3, 3, 3)),
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14))),
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                "Go to login page",
                style: TextStyle(color: Colors.white),
              )),
        ]),
      );
    } else {
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
}
