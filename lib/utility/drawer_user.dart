import 'package:bin_bank_app/app_styles.dart';
import 'package:bin_bank_app/page/deposit_sampah.dart';
import 'package:bin_bank_app/page/leaderboard.dart';
import 'package:bin_bank_app/page/history.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyDrawerUser extends StatelessWidget {

  const MyDrawerUser({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildMenuItems(context),
              ]),
        ),
      );

  Widget buildMenuItems(BuildContext context) {
    final request = context.watch<CookieRequest>();
    String username = request.jsonData['username'];
    return Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 12,
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('HomePage'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: 'Bin Bank',
                        )));
              },
            ),
            ListTile(
              leading: const Icon(Icons.leaderboard_rounded),
              title: const Text('Leaderboard'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LeaderboardPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text('Donate'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyDepositPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.timeline),
              title: const Text('History'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HistoryPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                var response = await request.logout('https://bin-bank-pbp.up.railway.app/logout/ajax');
                if (response['status'] == true) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Berhasil Logout! Sampai jumpa kembali $username"),
                    backgroundColor: kBlue,
                  ));
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: 'Bin Bank')));
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Gagal Logout. Silakan coba lagi"),
                    backgroundColor: kBlue,
                  ));
                }
              },
            ),
          ],
        ));
  }
}
