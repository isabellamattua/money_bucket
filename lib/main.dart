import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final fireAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    try {
      fireAuth.signOut();
    }
    catch (e) {
      print(e);
    }
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
  final fireAuth = FirebaseAuth.instance;
  final formValues = <String>[];

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
              validator: (String value) {
                formValues.add(value);
                return;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                //icon: Icon(Icons.person),
                hintText: "Enter Password",
                labelText: "Password *",
                contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              ),
              validator: (String value) {
                formValues.add(value);
                return;
              },
            ),
            RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  final _email = formValues[0];
                  final _password = formValues[1];
                  try {
                    final result = await fireAuth.signInWithEmailAndPassword(email: _email, password: _password);
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Account(),
                        )
                    );
                  }
                  catch (e) {
                    print(e);
                  }
                }
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
  final fireAuth = FirebaseAuth.instance;
  final formValues = <String>[];

  Widget Registration(context) {
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
            validator: (String val) {
              formValues.add(val);
              return;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Enter a password",
              labelText: "Password *",
            ),
            validator: (String val) {
              formValues.add(val);
              return;
            },
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // TODO: Update validator functions
                // PASSWORD MUST BE AT LEAST 6 CHARACTERS
                final _email = formValues[0];
                final _password = formValues[1];
                fireAuth.createUserWithEmailAndPassword(email: _email, password: _password);
              }
              Navigator.pop(context);
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
      body: Registration(context),
    );
  }
}

class SavingPreferencesPage extends StatefulWidget {
  @override
  _SavingPreferencesPageState createState() => _SavingPreferencesPageState();
}

class _SavingPreferencesPageState extends State<SavingPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

