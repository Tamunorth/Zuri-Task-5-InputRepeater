import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightBlueAccent,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MediaQuery.of(context).size.width <= 1200
          ? AppBar(
              centerTitle: true,
              title: Text('Input Repeater'),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(30.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _input,
                    style: TextStyle(fontSize: 16.0),
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _input = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: LogoLink(
                        logoURL: 'https://hng.tech',
                        imageURL: 'assets/images/hng.jpg')),
                SizedBox(width: 10.0),
                Expanded(
                    child: LogoLink(
                        logoURL: 'https://internship.zuri.team',
                        imageURL: 'assets/images/zuri.jpg')),
                SizedBox(width: 10.0),
                Expanded(
                    child: LogoLink(
                        logoURL: 'https://ingressive.org',
                        imageURL: 'assets/images/i4g.jpg')),
              ],
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}

class LogoLink extends StatelessWidget {
  const LogoLink({
    Key key,
    @required this.logoURL,
    @required this.imageURL,
  }) : super(key: key);
  final logoURL;
  final imageURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: Image.asset(imageURL),
    );
  }

  void _launchURL() async => await canLaunch(logoURL)
      ? await launch(logoURL)
      : throw 'Could not launch $logoURL';
}
