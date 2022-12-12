import 'package:bin_bank_app/main.dart';
import 'package:bin_bank_app/utility/drawer_user.dart';
import 'package:bin_bank_app/utility/drawer_public.dart';
import 'package:bin_bank_app/utility/leadearboard_fetch.dart';
import 'package:bin_bank_app/utility/supportmessage_add.dart';
import 'package:bin_bank_app/utility/supportmessage_fetch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

String convertDate(date) {
  String formattedDate = DateFormat('MM/dd/yyyy').format(date);
  return formattedDate;
}

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<LeaderboardPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  bool isInLeaderboard = false;
  bool isAuthenticated = false;
  int positionInLeaderboard = 0;

  String? getUsername() {
    final request = context.watch<CookieRequest>();
    username = request.jsonData['username'];
    if (username == null) {
      print(isAuthenticated);
      return null;
    } else {
      if (isAuthenticated == false) {
        isAuthenticated = true;
      }
      print("AuthCheck: $isAuthenticated");
      return username;
    }
  }

  late String? username = getUsername();

  Color colorHelper(usernameArgument, position) {
    if (usernameArgument == username) {
      isInLeaderboard = true;
      positionInLeaderboard = position + 1;
      return Colors.yellow;
    }
    return Colors.white;
  }

  Widget getWidget() {
    final request = context.watch<CookieRequest>();
    if (request.jsonData['username'] == null) {
      return const MyDrawerPublic();
    } else {
      return const MyDrawerUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (username != null) {
      setState(() {
        isAuthenticated = true;
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Leaderboard'),
        ),
        body: Container(
          alignment: Alignment.centerRight,
          // constraints: const BoxConstraints(maxWidth: 600),
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: const Text("🏆 LEADERBOARD 🏆",
                  style: TextStyle(fontSize: 30)),
            ),
            Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxWidth: 600),
              margin: const EdgeInsets.fromLTRB(7, 10, 7, 15),
              child: FutureBuilder(
                  future: fetchLeaderboard(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Tidak ada to do list :(",
                              style: TextStyle(
                                  color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        return Table(
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
                                  Text('Username',
                                      style: TextStyle(fontSize: 20.0))
                                ]),
                                Column(children: const [
                                  Text('Total Poin',
                                      style: TextStyle(fontSize: 20.0))
                                ]),
                              ]),
                              for (int i = 0; i < snapshot.data.length; i++)
                                TableRow(children: [
                                  Container(
                                    color: colorHelper(
                                        snapshot.data![i].username, i),
                                    child: Column(children: [
                                      Text((i + 1).toString(),
                                          style:
                                              const TextStyle(fontSize: 20.0))
                                    ]),
                                  ),
                                  Container(
                                    color: colorHelper(
                                        snapshot.data![i].username, i),
                                    child: Column(children: [
                                      Text('${snapshot.data![i].username}',
                                          style:
                                              const TextStyle(fontSize: 20.0))
                                    ]),
                                  ),
                                  Container(
                                    color: colorHelper(
                                        snapshot.data![i].username, i),
                                    child: Column(children: [
                                      Text('${snapshot.data![i].points}',
                                          style:
                                              const TextStyle(fontSize: 20.0))
                                    ]),
                                  ),
                                ]),
                            ]);
                      }
                    }
                  }),
            ),
            if (isInLeaderboard)
              Container(
                alignment: Alignment.center,
                child: Text(
                    'Selamat, $username! kamu berada di peringkat $positionInLeaderboard! Pertahankan peringkatmu dengan tetap melakukan donasi sampah!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15)),
              ),
            if (!isInLeaderboard && isAuthenticated)
              Container(
                alignment: Alignment.center,
                child: const Text(
                    'Wah, poin kamu belum cukup untuk masuk leaderboard. Tingkatkan poinmu dengan melakukan donasi sampah!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15)),
              ),
            if (!isAuthenticated)
              Container(
                alignment: Alignment.center,
                child: const Text(
                    'Kamu belum login. Silakan login untuk melihat peringkatmu di leaderboard.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15)),
              ),
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: const Text('Pesan Dukungan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
            ),
            const Text(
                'Dari masyarakat agar kamu lebih termotivasi untuk meningkatkan poin sekaligus menjaga lingkungan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15)),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: fetchSupportmessage(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada to do list :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].username}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].message}"),
                                    // const SizedBox(height: 10),
                                    const SizedBox(height: 20),
                                    Text(
                                        convertDate(snapshot.data![index].date),
                                        textAlign: TextAlign.right,
                                        style:
                                            const TextStyle(color: Colors.red))
                                  ],
                                ),
                              ));
                    }
                  }
                }),
            const SizedBox(height: 30),
            if (isAuthenticated)
              Container(
                alignment: Alignment.center,
                child: const Text('Kirim pesan dukunganmu sekarang!',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            if (isAuthenticated) const SizedBox(height: 5),
            if (isAuthenticated)
              const Text(
                  'Pesan dapat berupa semangat, saran, atau tips-tips seputar pengelolaan sampah',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15)),
            if (isAuthenticated)
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
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
                            judul = value!;
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
                        const SizedBox(height: 40),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sendSupportMessage(username!, judul);
                            }
                          },
                          child: const Text(
                            "   Kirim   ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (!isAuthenticated)
              Container(
                alignment: Alignment.center,
                child: const Text(
                    'Silakan login terlebih dahulu untuk mengirim pesan dukungan',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ),
            const SizedBox(height: 30)
          ]),
        ),
        drawer: getWidget());
  }
}
