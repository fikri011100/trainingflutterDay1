import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashLogin(),
    );
  }
}

class SplashLogin extends StatefulWidget {
  @override
  _SplashLoginState createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        height: double.infinity,
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanLogin()));
          },
          color: Colors.lightBlue,
          child: Text('Enter'),
        ),
      ),
    );
  }
}

class HalamanLogin extends StatefulWidget {
  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final _formkey = GlobalKey<FormState>();
  bool _validasi = false;
  String email;
  String password;

  Widget FormUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validasiEmail,
          onSaved: (String val) {
            email = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Password'),
          keyboardType: TextInputType.text,
          obscureText: true,
          validator: validasiPassword,
          onSaved: (String val) {
            password = val;
          },
        ),
      ],
    );
  }

  String validasiPassword(String password) {
    if (password.length < 8) {
      return 'password minimal 8 karakter';
    } else {
      return null;
    }
  }

  String validasiEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Enter Valid Email';
    else
      return null;
  }

  void validasiInputan() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
//      Scaffold.of(context).showSnackBar(SnackBar(content: Text("data complete")));
      Toast.show("Data Complete", context, duration: Toast.LENGTH_LONG);
    } else {
      setState(() {
        _validasi = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('gambar/twitter.png'),
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.start,
                ),
                Text('Sign in to Continue',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    textAlign: TextAlign.start),
                Container(
                  margin: EdgeInsets.only(top: 30),
                ),
                Form(key: _formkey, autovalidate: _validasi, child: FormUI()),
                Container(
                  margin: EdgeInsets.only(top: 30),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.grey[350], fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.lightBlue,
                        onPressed: () {
                          validasiInputan();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New User? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sign-up',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _toast() {
    setState(() {
      _counter++;
    });
    Toast.show("Angka = $_counter", context, duration: Toast.LENGTH_LONG);
  }

  _onSubmit() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Info')),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  "Apakah Anda Ingin Keluar?",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    child: Text('nggak'),
                    textColor: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                    child: Text('iya'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          leading: Icon(Icons.settings),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.restaurant),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Image.asset('gambar/client.jpg'),
              RaisedButton(
                child: Text(
                  "Button Toast",
                ),
                color: Colors.red,
                textColor: Colors.white,
                splashColor: Colors.grey,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                onPressed: _onSubmit,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text("data1"),
                    padding: const EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text("alert button"),
                    color: Colors.yellow,
                    textColor: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    onPressed: _toast,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
