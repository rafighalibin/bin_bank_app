import 'package:bin_bank_app/page/deposit_sampah.dart';
import 'package:bin_bank_app/page/leaderboard.dart';
import 'package:bin_bank_app/page/history.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bin_bank_app/page/homepage.dart';
import 'package:bin_bank_app/utility/header_drawer.dart';

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

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 12,
        children: [
          const MyHeaderDrawer(),
          ListTile(
            title: const Text('HomePage'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Home(
                        title: 'Bin Bank',
                      )));
            },
          ),
          ListTile(
            title: const Text('Leaderboard'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LeaderboardPage()));
            },
          ),
          ListTile(
            title: const Text('Donate'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyDepositPage()));
            },
          ),
          ListTile(
            title: const Text('History'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HistoryPage()));
            },
          ),
          ListTile(
            title: const Text('Logout'),
            // onTap: () {
            //   logout(request);
            //   Navigator.of(context).pushReplacement(MaterialPageRoute(
            //       builder: (context) => const MyHomePage()));
            // },
          ),
        ],
      ));
}
