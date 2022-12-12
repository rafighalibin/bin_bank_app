import 'package:bin_bank_app/page/login_page.dart';
import 'package:bin_bank_app/utility/drawer_public.dart';
import 'package:bin_bank_app/utility/drawer_user.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bin_bank_app/app_styles.dart';
import 'package:bin_bank_app/page/feedback_form.dart';
import 'package:bin_bank_app/page/feedback_detail.dart';

void main() {
  bool isLoggedIn = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter App'),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});
  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    List<String> articleTitle = [
      'E-waste management must get policy priority',
      'How Can We Solve The Growing E-Waste Problem?',
      'Jubir G20 Sebut Permasalahan Sampah Menumpuk di Indonesia',
    ];

    List<String> publisher = [
      'NEW AGE',
      'EPOLINE',
      'KBR',
    ];

    List<String> images = [
      'waste-1.jpg',
      'waste-2.jpg',
      'waste-3.jpg',
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("BinBank"),
        ),
        drawer: getWidget(),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Welcome to Bin Bank',
                        style: kPoppinsBold.copyWith(
                          fontSize: 22,
                          color: kDarkBlue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Join us to promote and protect our health and environment.',
                        style: kPoppinsRegular.copyWith(
                          fontSize: 16,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Article',
                          style: kPoppinsBold.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '📰',
                          style: kPoppinsBold.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyFormPage()));
                    },
                    child: const Text('Give Feedback'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FeedbackDetailPage()));
                    },
                    child: const Text('Show All Feedbacks'),
                  ),
                ],
              ),
            ),
          ),
        ));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
