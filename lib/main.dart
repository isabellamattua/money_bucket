import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Money Bucket",
      home: Landing(),
    );
  }
}

class Landing extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Widget _loginForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "your email address",
                labelText: "Username *",
              ),
              onSaved: (String value) {
                // Code to do something when user saves form
              },
              validator: (String value) {
                // Check the input to make sure its ok
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "your password",
                labelText: "Password *",
              ),
              onSaved: (String value) {
                // Code to do something when user saves form
              },
              validator: (String value) {
                // Input validation
              },
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Submit"),
            )
          ],
        )
    );
  }

  Widget _logoArea(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 200,
      ),
      color: Colors.green,
      alignment: Alignment.center,
      child: Text("Money Bucket",
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Bucket"),
      ),
      body: Column(
        children: <Widget>[
          _logoArea(context),
          _loginForm(),
        ],
      ),
    );
  }
}