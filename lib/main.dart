import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

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

class Gear extends StatefulWidget {
  @override
  _GearState createState() => _GearState();
}

class _GearState extends State<Gear> {
  @override
  Widget build(BuildContext context) {
    return ImageButton(
      children: <Widget>[],
      width: 39,
      height: 39,
      paddingTop: 5,
      pressedImage: Image.asset(
        "assets/gear.png",
      ),
      unpressedImage: Image.asset("assets/gear.png"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      },
    );
  }
}

class CounterW extends StatefulWidget {
  @override
  _CounterWState createState() => _CounterWState();
}

class _CounterWState extends State<CounterW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(

        '\nChoose your way of saving:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color:const Color(0xFF041B15) ,
          fontSize: 20,
        ),
      ),);
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue ="Round Up to the Nearest dollar + Fixed Amount";
  bool _isVisible = false;
  //final Widget widgetHolder = counter;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.green[800]),
      underline: Container(
        height: 2,
        color: Colors.lightGreen,
      ),
      onChanged: (String newValue) {
          dropdownValue = newValue;
          print(dropdownValue);
            if (dropdownValue == "Fixed Amount" || dropdownValue ==
            "Round Up to the Nearest dollar + Fixed Amount") {
              _isVisible = true;
            //Counter.vi
            } else {
              _isVisible = false;
            }

            if (_isVisible){
              Visibility(
                visible: true,
                child :CounterW()
              );
            } else{
              Visibility(
                  visible: false,
                  child :CounterW()
              );
            }
      },
      items: <String>['Round Up to the Nearest dollar','Fixed Amount', 'Round Up to the Nearest dollar + Fixed Amount']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class SettingsPage extends StatelessWidget {

  Widget question = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '\nChoose your way of saving:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:const Color(0xFF041B15) ,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                '    ',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(

                  '\nSettings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:const Color(0xFF041B15) ,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                'Set up the preferences for your account',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Money Bucket"),
      // ),
      body: Column(
        children: <Widget>[
          titleSection,
          question,
          MyStatefulWidget(),
          //buckets,
        ],
      ),
    );
  }
}

class AccountInfo extends StatelessWidget {

  Widget blueBox =Container(
      child: Text(
        'Account Info: \n  Available founds:    \t874.52 \n Last amount saved: \t1.62 \n',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            background: Paint()
              ..strokeWidth = 30.0
              ..color = Colors.grey
              ..style = PaintingStyle.stroke
              ..strokeJoin = StrokeJoin.round),
      )
    );


  Widget buckets = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/new-b1.png'),
        Image.asset('assets/new-b2.png'),
        Image.asset('assets/new-b3.png'),
      ],
    )
  );

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(

                  '\nHi Jerge',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:const Color(0xFF041B15) ,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                'Miami, USA',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/

          Gear(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text("Money Bucket"),
     // ),
      body: Column(
        children: <Widget>[
          titleSection,
          blueBox,
          buckets,

        ],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
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
                          builder: (BuildContext context) => AccountInfo(),
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

