import 'package:bin_bank_app/page/deposit_sampah.dart';
import 'package:bin_bank_app/page/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

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
          ListTile(
            title: const Text('HomePage'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
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
          )
        ],
      ));
}