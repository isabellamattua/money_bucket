import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Money Bucket",

      home: AccountInfo(),
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



// ···



class AccountInfo extends StatelessWidget {


  Widget blueBox =Container(
    width: 350,
    height: 440,
    decoration: BoxDecoration(
    color: const Color(0xFFE8E8E8),
        border: Border.all(
            color: const Color(0xFFE8E8E8),
            width: 2
        ),
        borderRadius: BorderRadius.circular(8)
    ),
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
                'Kandersteg, Switzerland',
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







