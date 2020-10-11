import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Money Bucket",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text(""),
      //),
      body: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  final _formKey = GlobalKey<FormState>();

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Money Bucket", style: TextStyle(fontSize: 40)),
            Image.asset(
              "assets/moneybucket.png",
              height: 200,
            ),
            TextFormField(
              decoration: InputDecoration(
                //icon: Icon(Icons.person),
                hintText: "Enter username",
                labelText: "Username *",
                contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                //icon: Icon(Icons.person),
                hintText: "Enter Password",
                labelText: "Password *",
                contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Account(),
                  )
                );
              },
              child: const Text("Sign In", style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RegistrationPage(),
                  )
                );
              },
              child: const Text("Register", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loginForm();
  }
}

class Account extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Column(
        children: [
          Text("Test"),
        ],
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Widget Registration() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Enter your email address",
              labelText: "Email *"
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Enter a password",
              labelText: "Password *",
            ),
          ),
          RaisedButton(
            onPressed: () {

            },
            child: const Text("Register", style: TextStyle(fontSize: 20),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Registration"),
      ),
      body: Registration(),
    );
  }
}