import 'package:bin_bank_app/page/login_page.dart';
import 'package:bin_bank_app/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:bin_bank_app/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyDrawerPublic extends StatelessWidget {
  const MyDrawerPublic({Key? key}) : super(key: key);

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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: '',
                        )));
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginPage(
                        )));
              },
            ),
            ListTile(
              title: const Text('Register'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const RegisterPage(
                        )));
              },
            ),
          ],
        ),
      );
}
